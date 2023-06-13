modules_enabled = {
  "roster"; -- Allow users to have a roster. Recommended ;)
  "saslauth"; -- Authentication for clients and servers. Recommended if you want to log in.
  "tls"; -- Add support for secure TLS on c2s/s2s connections
  "dialback"; -- s2s dialback support
  "disco"; -- Service discovery
  "posix"; -- POSIX functionality, sends server to background, enables syslog, etc.
  "version"; -- Replies to server version requests
  "uptime"; -- Report how long server has been running
  "time"; -- Let others know the time here on this server
  "ping"; -- Replies to XMPP pings with pongs
  "pep"; -- Enables users to publish their mood, activity, playing music and more
  -- jitsi
  --"smacks"; -- not shipped with prosody
  "carbons";
  "mam";
  "lastactivity";
  "offline";
  "pubsub";
  "adhoc";
  "websocket";
  --"http_altconnect"; -- not shipped with prosody
}
modules_disabled = { "s2s" }

plugin_paths = { "/usr/share/jitsi-meet/prosody-plugins/" }

log = {
  --log less on console with warn="*console"; or err="*console" or more with debug="*console"
  info="*console";
}
daemonize = false
use_libevent = true

-- domain mapper options, must at least have domain base set to use the mapper
muc_mapper_domain_base = "jitsi.bring-out.me";

--@FIXME would be great to configure it
--turncredentials_secret = "__turnSecret__";

--turncredentials = {
--    { type = "stun", host = "jitmeet.example.com", port = "3478" },
--    { type = "turn", host = "jitmeet.example.com", port = "3478", transport = "udp" },
--    { type = "turns", host = "jitmeet.example.com", port = "5349", transport = "tcp" }
--};

cross_domain_bosh = false;
consider_bosh_secure = true;
--component_ports = { 5347 }
component_ports = { } -- it seems we don't need external components for now...
https_ports = { } -- we don't need http
http_ports = { 5280 }
http_interfaces = { "0.0.0.0", "::" }
c2s_ports = { 5222 }
s2s_ports = { }


-- https://ssl-config.mozilla.org/#server=haproxy&version=2.1&config=intermediate&openssl=1.1.0g&guideline=5.4
ssl = {
    protocol = "tlsv1_2+";
    ciphers = "ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384"
}

VirtualHost "jitsi"
    enabled = true -- Remove this line to enable this host
    authentication = "anonymous"
    -- Properties below are modified by jitsi-meet-tokens package config
    -- and authentication above is switched to "token"
    --app_id="example_app_id"
    --app_secret="example_app_secret"
    -- Assign this host a certificate for TLS, otherwise it would use the one
    -- set in the global section (if any).
    -- Note that old-style SSL on port 5223 only supports one certificate, and will always
    -- use the global one.
    ssl = {
        key = "/var/lib/prosody/jitsi.key";
        certificate = "/var/lib/prosody/jitsi.crt";
    }
    speakerstats_component = "speakerstats.jitsi"
    conference_duration_component = "conferenceduration.jitsi"
    -- we need bosh
    modules_enabled = {
        "bosh";
        "pubsub";
        "ping"; -- Enable mod_ping
        "speakerstats";
        --"turncredentials"; not supported yet
        "conference_duration";
        "muc_lobby_rooms";
    }
    c2s_require_encryption = false
    lobby_muc = "lobby.jitsi"
    main_muc = "conference.jitsi"
    http_host = "jitsi-bosh"
    -- muc_lobby_whitelist = { "recorder.jitmeet.example.com" } -- Here we can whitelist jibri to enter lobby enabled rooms

Component "conference.jitsi" "muc"
    storage = "memory"
    modules_enabled = {
        "muc_meeting_id";
        "muc_domain_mapper";
        --"token_verification";
    }
    admins = { "focus@auth.jitsi" }
    muc_room_locking = false
    muc_room_default_public_jids = true

-- internal muc component
Component "internal.auth.jitsi" "muc"
    storage = "memory"
    modules_enabled = {
        "ping";
    }
    admins = { "focus@auth.jitsi", "jvb@auth.jitsi" }
    muc_room_locking = false
    muc_room_default_public_jids = true

VirtualHost "auth.jitsi"
    ssl = {
        key = "/var/lib/prosody/auth.jitsi.key";
        certificate = "/var/lib/prosody/auth.jitsi.crt";
    }
    authentication = "internal_plain"

Component "focus.jitsi" "client_proxy"
    target_address = "focus@auth.jitsi"

Component "speakerstats.jitsi" "speakerstats_component"
    muc_component = "conference.jitsi"

Component "conferenceduration.jitsi" "conference_duration_component"
    muc_component = "conference.jitsi"

Component "lobby.jitsi" "muc"
    storage = "memory"
    restrict_room_creation = true
    muc_room_locking = false
    muc_room_default_public_jids = true

