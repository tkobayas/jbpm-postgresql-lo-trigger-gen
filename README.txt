# jbpm-postgresql-lo-trigger

## Environment
BPMS 6.3.0
BPMS 6.4.0

PostgreSQL 9

## Why do we need this?

vacuumlo analyzes database to find orphaned large objects. But it only looks at 'oid' columns. In jBPM, there are 'text' columns which hold large objects. In Java codes, they are String @Lob fields which are considered as "CLOB". These 'text' columns are not analyzed so vacuumlo could delete non-orphaned (= active) large objects.

This trigger copies the jBPM CLOB references to 'jbpm_active_clob' table's oid column so it prevents vacuumlo from deleting those large objects. In other words, you can safely run vacuumlo.

## How to use

1. Make sure that the database user which runs this script has TRIGGER privilege on BPMS tables and USAGE privilege on language plpgsql.

2. Run script to create triggers. It also creates jbpm_active_clob table.

\i postgresql-jbpm-lo-trigger-clob.sql

4. Populate jbpm_active_clob for CLOBs which already exist before creating the trigger

insert into jbpm_active_clob ( loid ) select cast(expression as oid) from booleanexpression where expression is not null;
insert into jbpm_active_clob ( loid ) select cast(body as oid) from email_header where body is not null;
insert into jbpm_active_clob ( loid ) select cast(text as oid) from i18ntext where text is not null;
insert into jbpm_active_clob ( loid ) select cast(text as oid) from task_comment where text is not null;
insert into jbpm_active_clob ( loid ) select cast(qexpression as oid) from querydefinitionstore where qexpression is not null;
insert into jbpm_active_clob ( loid ) select cast(deploymentunit as oid) from deploymentstore where deploymentunit is not null;

Now, jbpm_active_clob is maintained by the trigger so CLOB references will be protected from vacuumlo.

This zip also contains drop-postgresql-jbpm-lo-trigger-clob.sql for the time when you want to drop the triggers.
