create table jbpm_active_clob ( loid oid );

-- BLOB triggers

-- content.content

CREATE OR REPLACE FUNCTION content_content_clob_after_update()
  RETURNS "trigger" AS
$BODY$
declare
begin
    perform lo_unlink(cast(old.content as oid));
    return new;
EXCEPTION WHEN others THEN
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION content_content_clob_after_update() OWNER TO postgres;

CREATE TRIGGER content_content_clob_after_update_trigger
  AFTER UPDATE
  ON content
  FOR EACH ROW
  WHEN (old.content IS NOT NULL AND old.content IS DISTINCT FROM new.content)
  EXECUTE PROCEDURE content_content_clob_after_update();

CREATE OR REPLACE FUNCTION content_content_clob_after_delete()
  RETURNS "trigger" AS
$BODY$
declare
begin
    perform lo_unlink(cast(old.content as oid));
    return old;
EXCEPTION WHEN others THEN
    return old;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION content_content_clob_after_delete() OWNER TO postgres;

CREATE TRIGGER content_content_clob_after_delete_trigger
  AFTER DELETE
  ON content
  FOR EACH ROW
  WHEN (old.content IS NOT NULL)
  EXECUTE PROCEDURE content_content_clob_after_delete();

-- processinstanceinfo.processinstancebytearray

CREATE OR REPLACE FUNCTION processinstanceinfo_processinstancebytearray_clob_after_update()
  RETURNS "trigger" AS
$BODY$
declare
begin
    perform lo_unlink(cast(old.processinstancebytearray as oid));
    return new;
EXCEPTION WHEN others THEN
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION processinstanceinfo_processinstancebytearray_clob_after_update() OWNER TO postgres;

CREATE TRIGGER processinstanceinfo_processinstancebytearray_clob_after_update_trigger
  AFTER UPDATE
  ON processinstanceinfo
  FOR EACH ROW
  WHEN (old.processinstancebytearray IS NOT NULL AND old.processinstancebytearray IS DISTINCT FROM new.processinstancebytearray)
  EXECUTE PROCEDURE processinstanceinfo_processinstancebytearray_clob_after_update();

CREATE OR REPLACE FUNCTION processinstanceinfo_processinstancebytearray_clob_after_delete()
  RETURNS "trigger" AS
$BODY$
declare
begin
    perform lo_unlink(cast(old.processinstancebytearray as oid));
    return old;
EXCEPTION WHEN others THEN
    return old;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION processinstanceinfo_processinstancebytearray_clob_after_delete() OWNER TO postgres;

CREATE TRIGGER processinstanceinfo_processinstancebytearray_clob_after_delete_trigger
  AFTER DELETE
  ON processinstanceinfo
  FOR EACH ROW
  WHEN (old.processinstancebytearray IS NOT NULL)
  EXECUTE PROCEDURE processinstanceinfo_processinstancebytearray_clob_after_delete();

-- requestinfo.requestdata

CREATE OR REPLACE FUNCTION requestinfo_requestdata_clob_after_update()
  RETURNS "trigger" AS
$BODY$
declare
begin
    perform lo_unlink(cast(old.requestdata as oid));
    return new;
EXCEPTION WHEN others THEN
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION requestinfo_requestdata_clob_after_update() OWNER TO postgres;

CREATE TRIGGER requestinfo_requestdata_clob_after_update_trigger
  AFTER UPDATE
  ON requestinfo
  FOR EACH ROW
  WHEN (old.requestdata IS NOT NULL AND old.requestdata IS DISTINCT FROM new.requestdata)
  EXECUTE PROCEDURE requestinfo_requestdata_clob_after_update();

CREATE OR REPLACE FUNCTION requestinfo_requestdata_clob_after_delete()
  RETURNS "trigger" AS
$BODY$
declare
begin
    perform lo_unlink(cast(old.requestdata as oid));
    return old;
EXCEPTION WHEN others THEN
    return old;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION requestinfo_requestdata_clob_after_delete() OWNER TO postgres;

CREATE TRIGGER requestinfo_requestdata_clob_after_delete_trigger
  AFTER DELETE
  ON requestinfo
  FOR EACH ROW
  WHEN (old.requestdata IS NOT NULL)
  EXECUTE PROCEDURE requestinfo_requestdata_clob_after_delete();

-- requestinfo.responsedata

CREATE OR REPLACE FUNCTION requestinfo_responsedata_clob_after_update()
  RETURNS "trigger" AS
$BODY$
declare
begin
    perform lo_unlink(cast(old.responsedata as oid));
    return new;
EXCEPTION WHEN others THEN
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION requestinfo_responsedata_clob_after_update() OWNER TO postgres;

CREATE TRIGGER requestinfo_responsedata_clob_after_update_trigger
  AFTER UPDATE
  ON requestinfo
  FOR EACH ROW
  WHEN (old.responsedata IS NOT NULL AND old.responsedata IS DISTINCT FROM new.responsedata)
  EXECUTE PROCEDURE requestinfo_responsedata_clob_after_update();

CREATE OR REPLACE FUNCTION requestinfo_responsedata_clob_after_delete()
  RETURNS "trigger" AS
$BODY$
declare
begin
    perform lo_unlink(cast(old.responsedata as oid));
    return old;
EXCEPTION WHEN others THEN
    return old;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION requestinfo_responsedata_clob_after_delete() OWNER TO postgres;

CREATE TRIGGER requestinfo_responsedata_clob_after_delete_trigger
  AFTER DELETE
  ON requestinfo
  FOR EACH ROW
  WHEN (old.responsedata IS NOT NULL)
  EXECUTE PROCEDURE requestinfo_responsedata_clob_after_delete();

-- sessioninfo.rulesbytearray

CREATE OR REPLACE FUNCTION sessioninfo_rulesbytearray_clob_after_update()
  RETURNS "trigger" AS
$BODY$
declare
begin
    perform lo_unlink(cast(old.rulesbytearray as oid));
    return new;
EXCEPTION WHEN others THEN
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION sessioninfo_rulesbytearray_clob_after_update() OWNER TO postgres;

CREATE TRIGGER sessioninfo_rulesbytearray_clob_after_update_trigger
  AFTER UPDATE
  ON sessioninfo
  FOR EACH ROW
  WHEN (old.rulesbytearray IS NOT NULL AND old.rulesbytearray IS DISTINCT FROM new.rulesbytearray)
  EXECUTE PROCEDURE sessioninfo_rulesbytearray_clob_after_update();

CREATE OR REPLACE FUNCTION sessioninfo_rulesbytearray_clob_after_delete()
  RETURNS "trigger" AS
$BODY$
declare
begin
    perform lo_unlink(cast(old.rulesbytearray as oid));
    return old;
EXCEPTION WHEN others THEN
    return old;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION sessioninfo_rulesbytearray_clob_after_delete() OWNER TO postgres;

CREATE TRIGGER sessioninfo_rulesbytearray_clob_after_delete_trigger
  AFTER DELETE
  ON sessioninfo
  FOR EACH ROW
  WHEN (old.rulesbytearray IS NOT NULL)
  EXECUTE PROCEDURE sessioninfo_rulesbytearray_clob_after_delete();

-- workiteminfo.workitembytearray

CREATE OR REPLACE FUNCTION workiteminfo_workitembytearray_clob_after_update()
  RETURNS "trigger" AS
$BODY$
declare
begin
    perform lo_unlink(cast(old.workitembytearray as oid));
    return new;
EXCEPTION WHEN others THEN
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION workiteminfo_workitembytearray_clob_after_update() OWNER TO postgres;

CREATE TRIGGER workiteminfo_workitembytearray_clob_after_update_trigger
  AFTER UPDATE
  ON workiteminfo
  FOR EACH ROW
  WHEN (old.workitembytearray IS NOT NULL AND old.workitembytearray IS DISTINCT FROM new.workitembytearray)
  EXECUTE PROCEDURE workiteminfo_workitembytearray_clob_after_update();

CREATE OR REPLACE FUNCTION workiteminfo_workitembytearray_clob_after_delete()
  RETURNS "trigger" AS
$BODY$
declare
begin
    perform lo_unlink(cast(old.workitembytearray as oid));
    return old;
EXCEPTION WHEN others THEN
    return old;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION workiteminfo_workitembytearray_clob_after_delete() OWNER TO postgres;

CREATE TRIGGER workiteminfo_workitembytearray_clob_after_delete_trigger
  AFTER DELETE
  ON workiteminfo
  FOR EACH ROW
  WHEN (old.workitembytearray IS NOT NULL)
  EXECUTE PROCEDURE workiteminfo_workitembytearray_clob_after_delete();

-- CLOB triggers

-- booleanexpression.expression

CREATE OR REPLACE FUNCTION booleanexpression_expression_clob_before_insert()
  RETURNS "trigger" AS
$BODY$
declare
begin
    insert into jbpm_active_clob (loid) values (cast(new.expression as oid));
    return new;
EXCEPTION WHEN others THEN
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION booleanexpression_expression_clob_before_insert() OWNER TO postgres;

CREATE TRIGGER booleanexpression_expression_clob_before_insert_trigger
  BEFORE INSERT
  ON booleanexpression
  FOR EACH ROW
  WHEN (new.expression IS NOT NULL)
  EXECUTE PROCEDURE booleanexpression_expression_clob_before_insert();

CREATE OR REPLACE FUNCTION booleanexpression_expression_clob_before_update()
  RETURNS "trigger" AS
$BODY$
declare
begin
    insert into jbpm_active_clob (loid) values (cast(new.expression as oid));
    return new;
EXCEPTION WHEN others THEN
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION booleanexpression_expression_clob_before_update() OWNER TO postgres;

CREATE TRIGGER booleanexpression_expression_clob_before_update_trigger
  BEFORE UPDATE
  ON booleanexpression
  FOR EACH ROW
  WHEN (new.expression IS NOT NULL AND old.expression IS DISTINCT FROM new.expression)
  EXECUTE PROCEDURE booleanexpression_expression_clob_before_update();

CREATE OR REPLACE FUNCTION booleanexpression_expression_clob_after_update()
  RETURNS "trigger" AS
$BODY$
declare
begin
    delete from jbpm_active_clob where loid = cast(old.expression as oid);
    perform lo_unlink(cast(old.expression as oid));
    return new;
EXCEPTION WHEN others THEN
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION booleanexpression_expression_clob_after_update() OWNER TO postgres;

CREATE TRIGGER booleanexpression_expression_clob_after_update_trigger
  AFTER UPDATE
  ON booleanexpression
  FOR EACH ROW
  WHEN (old.expression IS NOT NULL AND old.expression IS DISTINCT FROM new.expression)
  EXECUTE PROCEDURE booleanexpression_expression_clob_after_update();

CREATE OR REPLACE FUNCTION booleanexpression_expression_clob_after_delete()
  RETURNS "trigger" AS
$BODY$
declare
begin
    delete from jbpm_active_clob where loid = cast(old.expression as oid);
    perform lo_unlink(cast(old.expression as oid));
    return old;
EXCEPTION WHEN others THEN
    return old;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION booleanexpression_expression_clob_after_delete() OWNER TO postgres;

CREATE TRIGGER booleanexpression_expression_clob_after_delete_trigger
  AFTER DELETE
  ON booleanexpression
  FOR EACH ROW
  WHEN (old.expression IS NOT NULL)
  EXECUTE PROCEDURE booleanexpression_expression_clob_after_delete();

-- email_header.body

CREATE OR REPLACE FUNCTION email_header_body_clob_before_insert()
  RETURNS "trigger" AS
$BODY$
declare
begin
    insert into jbpm_active_clob (loid) values (cast(new.body as oid));
    return new;
EXCEPTION WHEN others THEN
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION email_header_body_clob_before_insert() OWNER TO postgres;

CREATE TRIGGER email_header_body_clob_before_insert_trigger
  BEFORE INSERT
  ON email_header
  FOR EACH ROW
  WHEN (new.body IS NOT NULL)
  EXECUTE PROCEDURE email_header_body_clob_before_insert();

CREATE OR REPLACE FUNCTION email_header_body_clob_before_update()
  RETURNS "trigger" AS
$BODY$
declare
begin
    insert into jbpm_active_clob (loid) values (cast(new.body as oid));
    return new;
EXCEPTION WHEN others THEN
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION email_header_body_clob_before_update() OWNER TO postgres;

CREATE TRIGGER email_header_body_clob_before_update_trigger
  BEFORE UPDATE
  ON email_header
  FOR EACH ROW
  WHEN (new.body IS NOT NULL AND old.body IS DISTINCT FROM new.body)
  EXECUTE PROCEDURE email_header_body_clob_before_update();

CREATE OR REPLACE FUNCTION email_header_body_clob_after_update()
  RETURNS "trigger" AS
$BODY$
declare
begin
    delete from jbpm_active_clob where loid = cast(old.body as oid);
    perform lo_unlink(cast(old.body as oid));
    return new;
EXCEPTION WHEN others THEN
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION email_header_body_clob_after_update() OWNER TO postgres;

CREATE TRIGGER email_header_body_clob_after_update_trigger
  AFTER UPDATE
  ON email_header
  FOR EACH ROW
  WHEN (old.body IS NOT NULL AND old.body IS DISTINCT FROM new.body)
  EXECUTE PROCEDURE email_header_body_clob_after_update();

CREATE OR REPLACE FUNCTION email_header_body_clob_after_delete()
  RETURNS "trigger" AS
$BODY$
declare
begin
    delete from jbpm_active_clob where loid = cast(old.body as oid);
    perform lo_unlink(cast(old.body as oid));
    return old;
EXCEPTION WHEN others THEN
    return old;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION email_header_body_clob_after_delete() OWNER TO postgres;

CREATE TRIGGER email_header_body_clob_after_delete_trigger
  AFTER DELETE
  ON email_header
  FOR EACH ROW
  WHEN (old.body IS NOT NULL)
  EXECUTE PROCEDURE email_header_body_clob_after_delete();

-- i18ntext.text

CREATE OR REPLACE FUNCTION i18ntext_text_clob_before_insert()
  RETURNS "trigger" AS
$BODY$
declare
begin
    insert into jbpm_active_clob (loid) values (cast(new.text as oid));
    return new;
EXCEPTION WHEN others THEN
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION i18ntext_text_clob_before_insert() OWNER TO postgres;

CREATE TRIGGER i18ntext_text_clob_before_insert_trigger
  BEFORE INSERT
  ON i18ntext
  FOR EACH ROW
  WHEN (new.text IS NOT NULL)
  EXECUTE PROCEDURE i18ntext_text_clob_before_insert();

CREATE OR REPLACE FUNCTION i18ntext_text_clob_before_update()
  RETURNS "trigger" AS
$BODY$
declare
begin
    insert into jbpm_active_clob (loid) values (cast(new.text as oid));
    return new;
EXCEPTION WHEN others THEN
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION i18ntext_text_clob_before_update() OWNER TO postgres;

CREATE TRIGGER i18ntext_text_clob_before_update_trigger
  BEFORE UPDATE
  ON i18ntext
  FOR EACH ROW
  WHEN (new.text IS NOT NULL AND old.text IS DISTINCT FROM new.text)
  EXECUTE PROCEDURE i18ntext_text_clob_before_update();

CREATE OR REPLACE FUNCTION i18ntext_text_clob_after_update()
  RETURNS "trigger" AS
$BODY$
declare
begin
    delete from jbpm_active_clob where loid = cast(old.text as oid);
    perform lo_unlink(cast(old.text as oid));
    return new;
EXCEPTION WHEN others THEN
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION i18ntext_text_clob_after_update() OWNER TO postgres;

CREATE TRIGGER i18ntext_text_clob_after_update_trigger
  AFTER UPDATE
  ON i18ntext
  FOR EACH ROW
  WHEN (old.text IS NOT NULL AND old.text IS DISTINCT FROM new.text)
  EXECUTE PROCEDURE i18ntext_text_clob_after_update();

CREATE OR REPLACE FUNCTION i18ntext_text_clob_after_delete()
  RETURNS "trigger" AS
$BODY$
declare
begin
    delete from jbpm_active_clob where loid = cast(old.text as oid);
    perform lo_unlink(cast(old.text as oid));
    return old;
EXCEPTION WHEN others THEN
    return old;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION i18ntext_text_clob_after_delete() OWNER TO postgres;

CREATE TRIGGER i18ntext_text_clob_after_delete_trigger
  AFTER DELETE
  ON i18ntext
  FOR EACH ROW
  WHEN (old.text IS NOT NULL)
  EXECUTE PROCEDURE i18ntext_text_clob_after_delete();

-- task_comment.text

CREATE OR REPLACE FUNCTION task_comment_text_clob_before_insert()
  RETURNS "trigger" AS
$BODY$
declare
begin
    insert into jbpm_active_clob (loid) values (cast(new.text as oid));
    return new;
EXCEPTION WHEN others THEN
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION task_comment_text_clob_before_insert() OWNER TO postgres;

CREATE TRIGGER task_comment_text_clob_before_insert_trigger
  BEFORE INSERT
  ON task_comment
  FOR EACH ROW
  WHEN (new.text IS NOT NULL)
  EXECUTE PROCEDURE task_comment_text_clob_before_insert();

CREATE OR REPLACE FUNCTION task_comment_text_clob_before_update()
  RETURNS "trigger" AS
$BODY$
declare
begin
    insert into jbpm_active_clob (loid) values (cast(new.text as oid));
    return new;
EXCEPTION WHEN others THEN
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION task_comment_text_clob_before_update() OWNER TO postgres;

CREATE TRIGGER task_comment_text_clob_before_update_trigger
  BEFORE UPDATE
  ON task_comment
  FOR EACH ROW
  WHEN (new.text IS NOT NULL AND old.text IS DISTINCT FROM new.text)
  EXECUTE PROCEDURE task_comment_text_clob_before_update();

CREATE OR REPLACE FUNCTION task_comment_text_clob_after_update()
  RETURNS "trigger" AS
$BODY$
declare
begin
    delete from jbpm_active_clob where loid = cast(old.text as oid);
    perform lo_unlink(cast(old.text as oid));
    return new;
EXCEPTION WHEN others THEN
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION task_comment_text_clob_after_update() OWNER TO postgres;

CREATE TRIGGER task_comment_text_clob_after_update_trigger
  AFTER UPDATE
  ON task_comment
  FOR EACH ROW
  WHEN (old.text IS NOT NULL AND old.text IS DISTINCT FROM new.text)
  EXECUTE PROCEDURE task_comment_text_clob_after_update();

CREATE OR REPLACE FUNCTION task_comment_text_clob_after_delete()
  RETURNS "trigger" AS
$BODY$
declare
begin
    delete from jbpm_active_clob where loid = cast(old.text as oid);
    perform lo_unlink(cast(old.text as oid));
    return old;
EXCEPTION WHEN others THEN
    return old;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION task_comment_text_clob_after_delete() OWNER TO postgres;

CREATE TRIGGER task_comment_text_clob_after_delete_trigger
  AFTER DELETE
  ON task_comment
  FOR EACH ROW
  WHEN (old.text IS NOT NULL)
  EXECUTE PROCEDURE task_comment_text_clob_after_delete();

-- querydefinitionstore.qexpression

CREATE OR REPLACE FUNCTION querydefinitionstore_qexpression_clob_before_insert()
  RETURNS "trigger" AS
$BODY$
declare
begin
    insert into jbpm_active_clob (loid) values (cast(new.qexpression as oid));
    return new;
EXCEPTION WHEN others THEN
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION querydefinitionstore_qexpression_clob_before_insert() OWNER TO postgres;

CREATE TRIGGER querydefinitionstore_qexpression_clob_before_insert_trigger
  BEFORE INSERT
  ON querydefinitionstore
  FOR EACH ROW
  WHEN (new.qexpression IS NOT NULL)
  EXECUTE PROCEDURE querydefinitionstore_qexpression_clob_before_insert();

CREATE OR REPLACE FUNCTION querydefinitionstore_qexpression_clob_before_update()
  RETURNS "trigger" AS
$BODY$
declare
begin
    insert into jbpm_active_clob (loid) values (cast(new.qexpression as oid));
    return new;
EXCEPTION WHEN others THEN
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION querydefinitionstore_qexpression_clob_before_update() OWNER TO postgres;

CREATE TRIGGER querydefinitionstore_qexpression_clob_before_update_trigger
  BEFORE UPDATE
  ON querydefinitionstore
  FOR EACH ROW
  WHEN (new.qexpression IS NOT NULL AND old.qexpression IS DISTINCT FROM new.qexpression)
  EXECUTE PROCEDURE querydefinitionstore_qexpression_clob_before_update();

CREATE OR REPLACE FUNCTION querydefinitionstore_qexpression_clob_after_update()
  RETURNS "trigger" AS
$BODY$
declare
begin
    delete from jbpm_active_clob where loid = cast(old.qexpression as oid);
    perform lo_unlink(cast(old.qexpression as oid));
    return new;
EXCEPTION WHEN others THEN
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION querydefinitionstore_qexpression_clob_after_update() OWNER TO postgres;

CREATE TRIGGER querydefinitionstore_qexpression_clob_after_update_trigger
  AFTER UPDATE
  ON querydefinitionstore
  FOR EACH ROW
  WHEN (old.qexpression IS NOT NULL AND old.qexpression IS DISTINCT FROM new.qexpression)
  EXECUTE PROCEDURE querydefinitionstore_qexpression_clob_after_update();

CREATE OR REPLACE FUNCTION querydefinitionstore_qexpression_clob_after_delete()
  RETURNS "trigger" AS
$BODY$
declare
begin
    delete from jbpm_active_clob where loid = cast(old.qexpression as oid);
    perform lo_unlink(cast(old.qexpression as oid));
    return old;
EXCEPTION WHEN others THEN
    return old;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION querydefinitionstore_qexpression_clob_after_delete() OWNER TO postgres;

CREATE TRIGGER querydefinitionstore_qexpression_clob_after_delete_trigger
  AFTER DELETE
  ON querydefinitionstore
  FOR EACH ROW
  WHEN (old.qexpression IS NOT NULL)
  EXECUTE PROCEDURE querydefinitionstore_qexpression_clob_after_delete();

-- deploymentstore.deploymentunit

CREATE OR REPLACE FUNCTION deploymentstore_deploymentunit_clob_before_insert()
  RETURNS "trigger" AS
$BODY$
declare
begin
    insert into jbpm_active_clob (loid) values (cast(new.deploymentunit as oid));
    return new;
EXCEPTION WHEN others THEN
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION deploymentstore_deploymentunit_clob_before_insert() OWNER TO postgres;

CREATE TRIGGER deploymentstore_deploymentunit_clob_before_insert_trigger
  BEFORE INSERT
  ON deploymentstore
  FOR EACH ROW
  WHEN (new.deploymentunit IS NOT NULL)
  EXECUTE PROCEDURE deploymentstore_deploymentunit_clob_before_insert();

CREATE OR REPLACE FUNCTION deploymentstore_deploymentunit_clob_before_update()
  RETURNS "trigger" AS
$BODY$
declare
begin
    insert into jbpm_active_clob (loid) values (cast(new.deploymentunit as oid));
    return new;
EXCEPTION WHEN others THEN
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION deploymentstore_deploymentunit_clob_before_update() OWNER TO postgres;

CREATE TRIGGER deploymentstore_deploymentunit_clob_before_update_trigger
  BEFORE UPDATE
  ON deploymentstore
  FOR EACH ROW
  WHEN (new.deploymentunit IS NOT NULL AND old.deploymentunit IS DISTINCT FROM new.deploymentunit)
  EXECUTE PROCEDURE deploymentstore_deploymentunit_clob_before_update();

CREATE OR REPLACE FUNCTION deploymentstore_deploymentunit_clob_after_update()
  RETURNS "trigger" AS
$BODY$
declare
begin
    delete from jbpm_active_clob where loid = cast(old.deploymentunit as oid);
    perform lo_unlink(cast(old.deploymentunit as oid));
    return new;
EXCEPTION WHEN others THEN
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION deploymentstore_deploymentunit_clob_after_update() OWNER TO postgres;

CREATE TRIGGER deploymentstore_deploymentunit_clob_after_update_trigger
  AFTER UPDATE
  ON deploymentstore
  FOR EACH ROW
  WHEN (old.deploymentunit IS NOT NULL AND old.deploymentunit IS DISTINCT FROM new.deploymentunit)
  EXECUTE PROCEDURE deploymentstore_deploymentunit_clob_after_update();

CREATE OR REPLACE FUNCTION deploymentstore_deploymentunit_clob_after_delete()
  RETURNS "trigger" AS
$BODY$
declare
begin
    delete from jbpm_active_clob where loid = cast(old.deploymentunit as oid);
    perform lo_unlink(cast(old.deploymentunit as oid));
    return old;
EXCEPTION WHEN others THEN
    return old;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION deploymentstore_deploymentunit_clob_after_delete() OWNER TO postgres;

CREATE TRIGGER deploymentstore_deploymentunit_clob_after_delete_trigger
  AFTER DELETE
  ON deploymentstore
  FOR EACH ROW
  WHEN (old.deploymentunit IS NOT NULL)
  EXECUTE PROCEDURE deploymentstore_deploymentunit_clob_after_delete();

