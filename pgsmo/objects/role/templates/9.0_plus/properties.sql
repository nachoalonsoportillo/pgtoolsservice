{#
 # pgAdmin 4 - PostgreSQL Tools
 #
 # Copyright (C) 2013 - 2017, The pgAdmin Development Team
 # This software is released under the PostgreSQL Licence
 #}
SELECT
	r.oid, r.*,
	pg_catalog.shobj_description(r.oid, 'pg_authid') AS description,
	ARRAY(
		SELECT
			CASE WHEN am.admin_option THEN '1' ELSE '0' END || rm.rolname
		FROM
			(SELECT * FROM pg_auth_members WHERE member = r.oid) am
			LEFT JOIN pg_catalog.pg_roles rm ON (rm.oid = am.roleid)
	) rolmembership
FROM
	pg_roles r
{% if rid %}
WHERE r.oid = {{ rid }}::oid
{% endif %}
ORDER BY r.rolcanlogin, r.rolname
