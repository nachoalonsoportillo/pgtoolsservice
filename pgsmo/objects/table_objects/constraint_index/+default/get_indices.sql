{#
 # pgAdmin 4 - PostgreSQL Tools
 #
 # Copyright (C) 2013 - 2017, The pgAdmin Development Team
 # This software is released under the PostgreSQL Licence
 #}
SELECT relname FROM pg_catalog.pg_class, pg_catalog.pg_index
WHERE pg_catalog.pg_class.oid=indexrelid
AND indrelid={{ tid }}
