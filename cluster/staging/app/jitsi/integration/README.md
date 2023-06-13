## About Jitsi

Several server components:
  - prosody XMPP (ext)
  - jitsi videobridge aka JVB
  - jitsi conference focus aka jicofo aka focus
  - jitsi meet
  - octo
  - jigasi
  - jibri
  - etc.

Some libs:
  - libjitsi seems deprecated
  - jicoco contains some parent classes to handle Jitsi's Configuration
  - [jitsi-utils](https://github.com/jitsi/jitsi-utils) contains the Logger definition for example
  - [ice4j](https://github.com/jitsi/ice4j) contains jitsi's implementation of WebRTC
  - etc.

Client components:
  - jitsi meet electron
  - jitsi android/ios
  - etc.

## Conf

Base conf:

  - [videobridge.conf](https://github.com/jitsi/jitsi-videobridge/blob/master/jvb/src/main/resources/reference.conf)
  - [jicofo.conf](https://github.com/jitsi/jicofo/blob/master/src/main/resources/reference.conf)

the following is used in videobridge.conf:
[jicoco/MucClientConfiguration](https://github.com/jitsi/jicoco/blob/master/jicoco/src/main/java/org/jitsi/xmpp/mucclient/MucClientConfiguration.java)

How the new configuration is read in jicoco:
https://github.com/jitsi/jicoco/blob/master/jicoco-config/src/main/kotlin/org/jitsi/config/JitsiConfig.kt#L83-L91
They use this library: https://github.com/lightbend/config
We are particularly interested by: https://github.com/lightbend/config#standard-behavior
Using 'application.conf' with classpath does not seem to work.
But, specifying the file path as `-Dconfig.file=/etc/jitsi/jicofo.conf` works!

Some parameters are also set independently of lightbend hocon config.
They are seen in jicofo entrypoint:
https://github.com/jitsi/jicofo/blob/master/src/main/java/org/jitsi/jicofo/Main.java
Many of these parameters can be in fact read from the HOCON file except one: the `--secret` parameter or the `JICOFO_SECRET` env variable.
But we can see this is a deprecated thing, it has been already removed from master: https://github.com/jitsi/jicofo/commit/c9e5b50a8b4e77f8b8cb8831a4a044a53edfcf48
For now (as per v5390) we will keep `JICOFO_SECRET` environment variable but will assume no other environment variable is set
But maybe this value is deprecated: the check is still here but it is not used anymore?!

## Run the integration suite

start a maintainance container

```
docker run --rm -it -v `pwd`/prosody/certs/:/var/lib/prosody/ -v `pwd`/prosody/prosody.cfg.lua:/etc/prosody/prosody.cfg.lua:ro --user root superboum/amd64_jitsi_xmpp:v11 bash
```

then generate certificates from inside this container

```
cd /var/lib/prosody/
chown -R prosody .
prosodyctl cert generate auth.jitsi
prosodyctl cert generate jitsi
```

then start the stack

```bash
docker-compose up
```

go to the URL by using a LAN/WAN IP (not localhost) and accept the self signed cert.

```
https://192.168.1.143
```

## Generate certs with prosody
```
prosodyctl cert generate auth.jitsi
prosodyctl cert generate jitsi
```

## An example prosody configuration file

https://github.com/jitsi/jitsi-meet/blob/master/doc/example-config-files/prosody.cfg.lua.example

but this one is not the one used by the [debian postinst script](https://github.com/jitsi/jitsi-meet/blob/master/debian/jitsi-meet-prosody.postinst)
instead, we should look at this one: https://github.com/jitsi/jitsi-meet/blob/master/doc/debian/jitsi-meet-prosody/prosody.cfg.lua-jvb.example

Jitsi can be configured to authenticated through tokens,
the postinst file is here: https://github.com/jitsi/jitsi-meet/blob/master/debian/jitsi-meet-tokens.postinst

## Remote debug

Add this parameter to the java process you want to debug (either jicofo or jvb). It must be added by modifying the entrypoint script, next to the respective Dockerfile of each container.

```
-agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=*:5005
```

## Be careful

jiti-videobridge (jvb) does not start to listen on ICE ports (both TCP and UDP) at boot.
Instead, listening is triggered on the creation of the first conference (a 2 people P2P conference is enough).
A nice entrypoint to check with your debugger is:
  - [Videobridge.java#XmppConnectionEventHandle.colibriConferenceIqReceived](https://github.com/jitsi/jitsi-videobridge/blob/256dc7acb7ee10440502a6073a498329eaf1e819/jvb/src/main/java/org/jitsi/videobridge/Videobridge.java#L627)
  - [VideobridgeShim.java#VideobridgeShim.handleColibriConferenceIQ](https://github.com/jitsi/jitsi-videobridge/blob/256dc7acb7ee10440502a6073a498329eaf1e819/jvb/src/main/java/org/jitsi/videobridge/shim/VideobridgeShim.java#L251)
  - [ConferenceShim.java#ConferenceShim.initializeSignaledEndpoints](https://github.com/jitsi/jitsi-videobridge/blob/256dc7acb7ee10440502a6073a498329eaf1e819/jvb/src/main/java/org/jitsi/videobridge/shim/ConferenceShim.java#L274)
  - [ConferenceShim.java#ConferenceShim.ensureEndpointCreated](https://github.com/jitsi/jitsi-videobridge/blob/256dc7acb7ee10440502a6073a498329eaf1e819/jvb/src/main/java/org/jitsi/videobridge/shim/ConferenceShim.java#L312)
  - [Conference.java#Conference.createLocalEndpoint](https://github.com/jitsi/jitsi-videobridge/blob/256dc7acb7ee10440502a6073a498329eaf1e819/jvb/src/main/java/org/jitsi/videobridge/Conference.java#L602)
  - [Endpoint.java#Endpoint.new](https://github.com/jitsi/jitsi-videobridge/blob/256dc7acb7ee10440502a6073a498329eaf1e819/jvb/src/main/java/org/jitsi/videobridge/Endpoint.java#L254)
  - [IceTransport.kt#IceTransport.iceAgent(init)](https://github.com/jitsi/jitsi-videobridge/blob/0c2ac250ec6b518eaf75fbc83f7936ec01e7b5f6/jvb/src/main/kotlin/org/jitsi/videobridge/transport/ice/IceTransport.kt#L99)
  - [IceTransport.kt#companionObject.appendHarvesters](https://github.com/jitsi/jitsi-videobridge/blob/0c2ac250ec6b518eaf75fbc83f7936ec01e7b5f6/jvb/src/main/kotlin/org/jitsi/videobridge/transport/ice/IceTransport.kt#L350)

## Resources to understand jitsi

  - [jicofo/debian/postinst](https://github.com/jitsi/jicofo/blob/master/debian/postinst)
  - [videobridge/debian/postinst](https://github.com/jitsi/jitsi-videobridge/blob/master/debian/postinst)
