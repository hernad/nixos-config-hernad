{
  "suffix": "{{ key "secrets/directory/ldap_base_dn" }}",
  "bind": "0.0.0.0:389",
  "log_level": "debug",
  "acl": [
		"*,{{ key "secrets/directory/ldap_base_dn" }}::read:*:* !userpassword !user_secret !alternate_user_secrets !garage_s3_secret_key",
		"*::read modify:SELF:*",
		"ANONYMOUS::bind:*,ou=users,{{ key "secrets/directory/ldap_base_dn" }}:",
		"ANONYMOUS::bind:cn=admin,{{ key "secrets/directory/ldap_base_dn" }}:",
		"*,ou=services,ou=users,{{ key "secrets/directory/ldap_base_dn" }}::bind:*,ou=users,{{ key "secrets/directory/ldap_base_dn" }}:*",
		"*,ou=services,ou=users,{{ key "secrets/directory/ldap_base_dn" }}::read:*:*",

		"*:cn=bring-out,ou=groups,{{ key "secrets/directory/ldap_base_dn" }}:add:*,ou=invitations,{{ key "secrets/directory/ldap_base_dn" }}:*",
		"ANONYMOUS::bind:*,ou=invitations,{{ key "secrets/directory/ldap_base_dn" }}:",
		"*,ou=invitations,{{ key "secrets/directory/ldap_base_dn" }}::delete:SELF:*",

		"*:cn=bring-out,ou=groups,{{ key "secrets/directory/ldap_base_dn" }}:add:*,ou=users,{{ key "secrets/directory/ldap_base_dn" }}:*",
		"*,ou=invitations,{{ key "secrets/directory/ldap_base_dn" }}::add:*,ou=users,{{ key "secrets/directory/ldap_base_dn" }}:*",

		"*:cn=bring-out,ou=groups,{{ key "secrets/directory/ldap_base_dn" }}:modifyAdd:cn=email,ou=groups,{{ key "secrets/directory/ldap_base_dn" }}:*",
		"*,ou=invitations,{{ key "secrets/directory/ldap_base_dn" }}::modifyAdd:cn=email,ou=groups,{{ key "secrets/directory/ldap_base_dn" }}:*",

		"cn=admin,{{ key "secrets/directory/ldap_base_dn" }}::read add modify delete:*:*",
		"*:cn=admin,ou=groups,{{ key "secrets/directory/ldap_base_dn" }}:read add modify delete:*:*"
  ]
}
