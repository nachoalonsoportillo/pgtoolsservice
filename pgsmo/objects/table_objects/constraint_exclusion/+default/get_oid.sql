{#
 # pgAdmin 4 - PostgreSQL Tools
 #
 # Copyright (C) 2013 - 2017, The pgAdmin Development Team
 # This software is released under the PostgreSQL Licence
 #}
SELECT ct.conindid AS oid
FROM pg_catalog.pg_constraint ct
WHERE contype='x' AND
ct.conname = {{ name|qtLiteral(conn) }};
