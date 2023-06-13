{
  "http_bind_addr": ":9991",
  "ldap_server_addr": "ldap://{{ env "meta.site" }}.bottin.service.prod.consul:389",

  "base_dn": "{{ key "secrets/directory/ldap_base_dn" }}",
  "user_base_dn": "ou=users,{{ key "secrets/directory/ldap_base_dn" }}",
  "user_name_attr": "cn",
  "group_base_dn": "ou=groups,{{ key "secrets/directory/ldap_base_dn" }}",
  "group_name_attr": "cn",
  "mailing_list_base_dn": "ou=mailing_lists,ou=groups,{{ key "secrets/directory/ldap_base_dn" }}",
  "mailing_list_name_attr": "cn",
  "mailing_list_guest_user_base_dn": "ou=guests,ou=users,{{ key "secrets/directory/ldap_base_dn" }}",

  "invitation_base_dn": "ou=invitations,{{ key "secrets/directory/ldap_base_dn" }}",
  "invitation_name_attr": "cn",
  "invited_mail_format": "{}@{{ key "secrets/directory/guichet/mail_domain" | trimSpace }}",
  "invited_auto_groups": [
    "cn=email,ou=groups,{{ key "secrets/directory/ldap_base_dn" }}"
  ],

  "web_address": "https://{{ key "secrets/directory/guichet/web_hostname" }}",
  "mail_from": "{{ key "secrets/directory/guichet/mail_from" }}",
  "smtp_server": "{{ key "secrets/directory/guichet/smtp_server" }}",
  "smtp_username": "{{ key "secrets/directory/guichet/smtp_user" | trimSpace }}",
  "smtp_password": "{{ key "secrets/directory/guichet/smtp_pass" | trimSpace }}",

  "admin_account": "cn=admin,{{ key "secrets/directory/ldap_base_dn" }}",
  "group_can_admin": "cn=admin,ou=groups,{{ key "secrets/directory/ldap_base_dn" }}",
  "group_can_invite": "cn=asso_deuxfleurs,ou=groups,{{ key "secrets/directory/ldap_base_dn" }}",

  "s3_admin_endpoint": "garage-admin.service.prod.consul:3903",
  "s3_admin_token": "{{ key "secrets/garage/admin_token" | trimSpace }}",

  "s3_endpoint": "{{ key "secrets/directory/guichet/s3_endpoint" }}",
  "s3_access_key": "{{ key "secrets/directory/guichet/s3_access_key" | trimSpace }}",
  "s3_secret_key": "{{ key "secrets/directory/guichet/s3_secret_key" | trimSpace }}",
  "s3_region": "{{ key "secrets/directory/guichet/s3_region" }}",
  "s3_bucket": "{{ key "secrets/directory/guichet/s3_bucket" }}"
}

