-- Triggers to unlink BLOB/CLOB large objects automatically

-- content.content for Unlink

CREATE OR REPLACE FUNCTION content_content_unlink_after_update()
  RETURNS "trigger" AS
$BODY$
declare
begin
    perform lo_unlink(cast(old.content as oid));
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

CREATE TRIGGER content_content_unlink_after_update_trigger
  AFTER UPDATE
  ON content
  FOR EACH ROW
  WHEN (old.content IS NOT NULL AND old.content IS DISTINCT FROM new.content)
  EXECUTE PROCEDURE content_content_unlink_after_update();

CREATE OR REPLACE FUNCTION content_content_unlink_after_delete()
  RETURNS "trigger" AS
$BODY$
declare
begin
    perform lo_unlink(cast(old.content as oid));
    return old;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

CREATE TRIGGER content_content_unlink_after_delete_trigger
  AFTER DELETE
  ON content
  FOR EACH ROW
  WHEN (old.content IS NOT NULL)
  EXECUTE PROCEDURE content_content_unlink_after_delete();

-- processinstanceinfo.processinstancebytearray for Unlink

CREATE OR REPLACE FUNCTION processinstanceinfo_array_unlink_after_update()
  RETURNS "trigger" AS
$BODY$
declare
begin
    perform lo_unlink(cast(old.processinstancebytearray as oid));
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

CREATE TRIGGER processinstanceinfo_array_unlink_after_update_trigger
  AFTER UPDATE
  ON processinstanceinfo
  FOR EACH ROW
  WHEN (old.processinstancebytearray IS NOT NULL AND old.processinstancebytearray IS DISTINCT FROM new.processinstancebytearray)
  EXECUTE PROCEDURE processinstanceinfo_array_unlink_after_update();

CREATE OR REPLACE FUNCTION processinstanceinfo_array_unlink_after_delete()
  RETURNS "trigger" AS
$BODY$
declare
begin
    perform lo_unlink(cast(old.processinstancebytearray as oid));
    return old;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

CREATE TRIGGER processinstanceinfo_array_unlink_after_delete_trigger
  AFTER DELETE
  ON processinstanceinfo
  FOR EACH ROW
  WHEN (old.processinstancebytearray IS NOT NULL)
  EXECUTE PROCEDURE processinstanceinfo_array_unlink_after_delete();

-- requestinfo.requestdata for Unlink

CREATE OR REPLACE FUNCTION requestinfo_requestdata_unlink_after_update()
  RETURNS "trigger" AS
$BODY$
declare
begin
    perform lo_unlink(cast(old.requestdata as oid));
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

CREATE TRIGGER requestinfo_requestdata_unlink_after_update_trigger
  AFTER UPDATE
  ON requestinfo
  FOR EACH ROW
  WHEN (old.requestdata IS NOT NULL AND old.requestdata IS DISTINCT FROM new.requestdata)
  EXECUTE PROCEDURE requestinfo_requestdata_unlink_after_update();

CREATE OR REPLACE FUNCTION requestinfo_requestdata_unlink_after_delete()
  RETURNS "trigger" AS
$BODY$
declare
begin
    perform lo_unlink(cast(old.requestdata as oid));
    return old;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

CREATE TRIGGER requestinfo_requestdata_unlink_after_delete_trigger
  AFTER DELETE
  ON requestinfo
  FOR EACH ROW
  WHEN (old.requestdata IS NOT NULL)
  EXECUTE PROCEDURE requestinfo_requestdata_unlink_after_delete();

-- requestinfo.responsedata for Unlink

CREATE OR REPLACE FUNCTION requestinfo_responsedata_unlink_after_update()
  RETURNS "trigger" AS
$BODY$
declare
begin
    perform lo_unlink(cast(old.responsedata as oid));
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

CREATE TRIGGER requestinfo_responsedata_unlink_after_update_trigger
  AFTER UPDATE
  ON requestinfo
  FOR EACH ROW
  WHEN (old.responsedata IS NOT NULL AND old.responsedata IS DISTINCT FROM new.responsedata)
  EXECUTE PROCEDURE requestinfo_responsedata_unlink_after_update();

CREATE OR REPLACE FUNCTION requestinfo_responsedata_unlink_after_delete()
  RETURNS "trigger" AS
$BODY$
declare
begin
    perform lo_unlink(cast(old.responsedata as oid));
    return old;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

CREATE TRIGGER requestinfo_responsedata_unlink_after_delete_trigger
  AFTER DELETE
  ON requestinfo
  FOR EACH ROW
  WHEN (old.responsedata IS NOT NULL)
  EXECUTE PROCEDURE requestinfo_responsedata_unlink_after_delete();

-- sessioninfo.rulesbytearray for Unlink

CREATE OR REPLACE FUNCTION sessioninfo_rulesbytearray_unlink_after_update()
  RETURNS "trigger" AS
$BODY$
declare
begin
    perform lo_unlink(cast(old.rulesbytearray as oid));
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

CREATE TRIGGER sessioninfo_rulesbytearray_unlink_after_update_trigger
  AFTER UPDATE
  ON sessioninfo
  FOR EACH ROW
  WHEN (old.rulesbytearray IS NOT NULL AND old.rulesbytearray IS DISTINCT FROM new.rulesbytearray)
  EXECUTE PROCEDURE sessioninfo_rulesbytearray_unlink_after_update();

CREATE OR REPLACE FUNCTION sessioninfo_rulesbytearray_unlink_after_delete()
  RETURNS "trigger" AS
$BODY$
declare
begin
    perform lo_unlink(cast(old.rulesbytearray as oid));
    return old;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

CREATE TRIGGER sessioninfo_rulesbytearray_unlink_after_delete_trigger
  AFTER DELETE
  ON sessioninfo
  FOR EACH ROW
  WHEN (old.rulesbytearray IS NOT NULL)
  EXECUTE PROCEDURE sessioninfo_rulesbytearray_unlink_after_delete();

-- workiteminfo.workitembytearray for Unlink

CREATE OR REPLACE FUNCTION workiteminfo_workitembytearray_unlink_after_update()
  RETURNS "trigger" AS
$BODY$
declare
begin
    perform lo_unlink(cast(old.workitembytearray as oid));
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

CREATE TRIGGER workiteminfo_workitembytearray_unlink_after_update_trigger
  AFTER UPDATE
  ON workiteminfo
  FOR EACH ROW
  WHEN (old.workitembytearray IS NOT NULL AND old.workitembytearray IS DISTINCT FROM new.workitembytearray)
  EXECUTE PROCEDURE workiteminfo_workitembytearray_unlink_after_update();

CREATE OR REPLACE FUNCTION workiteminfo_workitembytearray_unlink_after_delete()
  RETURNS "trigger" AS
$BODY$
declare
begin
    perform lo_unlink(cast(old.workitembytearray as oid));
    return old;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

CREATE TRIGGER workiteminfo_workitembytearray_unlink_after_delete_trigger
  AFTER DELETE
  ON workiteminfo
  FOR EACH ROW
  WHEN (old.workitembytearray IS NOT NULL)
  EXECUTE PROCEDURE workiteminfo_workitembytearray_unlink_after_delete();

-- booleanexpression.expression for Unlink

CREATE OR REPLACE FUNCTION booleanexpression_expression_unlink_after_update()
  RETURNS "trigger" AS
$BODY$
declare
begin
    perform lo_unlink(cast(old.expression as oid));
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

CREATE TRIGGER booleanexpression_expression_unlink_after_update_trigger
  AFTER UPDATE
  ON booleanexpression
  FOR EACH ROW
  WHEN (old.expression IS NOT NULL AND old.expression IS DISTINCT FROM new.expression)
  EXECUTE PROCEDURE booleanexpression_expression_unlink_after_update();

CREATE OR REPLACE FUNCTION booleanexpression_expression_unlink_after_delete()
  RETURNS "trigger" AS
$BODY$
declare
begin
    perform lo_unlink(cast(old.expression as oid));
    return old;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

CREATE TRIGGER booleanexpression_expression_unlink_after_delete_trigger
  AFTER DELETE
  ON booleanexpression
  FOR EACH ROW
  WHEN (old.expression IS NOT NULL)
  EXECUTE PROCEDURE booleanexpression_expression_unlink_after_delete();

-- email_header.body for Unlink

CREATE OR REPLACE FUNCTION email_header_body_unlink_after_update()
  RETURNS "trigger" AS
$BODY$
declare
begin
    perform lo_unlink(cast(old.body as oid));
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

CREATE TRIGGER email_header_body_unlink_after_update_trigger
  AFTER UPDATE
  ON email_header
  FOR EACH ROW
  WHEN (old.body IS NOT NULL AND old.body IS DISTINCT FROM new.body)
  EXECUTE PROCEDURE email_header_body_unlink_after_update();

CREATE OR REPLACE FUNCTION email_header_body_unlink_after_delete()
  RETURNS "trigger" AS
$BODY$
declare
begin
    perform lo_unlink(cast(old.body as oid));
    return old;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

CREATE TRIGGER email_header_body_unlink_after_delete_trigger
  AFTER DELETE
  ON email_header
  FOR EACH ROW
  WHEN (old.body IS NOT NULL)
  EXECUTE PROCEDURE email_header_body_unlink_after_delete();

-- i18ntext.text for Unlink

CREATE OR REPLACE FUNCTION i18ntext_text_unlink_after_update()
  RETURNS "trigger" AS
$BODY$
declare
begin
    perform lo_unlink(cast(old.text as oid));
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

CREATE TRIGGER i18ntext_text_unlink_after_update_trigger
  AFTER UPDATE
  ON i18ntext
  FOR EACH ROW
  WHEN (old.text IS NOT NULL AND old.text IS DISTINCT FROM new.text)
  EXECUTE PROCEDURE i18ntext_text_unlink_after_update();

CREATE OR REPLACE FUNCTION i18ntext_text_unlink_after_delete()
  RETURNS "trigger" AS
$BODY$
declare
begin
    perform lo_unlink(cast(old.text as oid));
    return old;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

CREATE TRIGGER i18ntext_text_unlink_after_delete_trigger
  AFTER DELETE
  ON i18ntext
  FOR EACH ROW
  WHEN (old.text IS NOT NULL)
  EXECUTE PROCEDURE i18ntext_text_unlink_after_delete();

-- task_comment.text for Unlink

CREATE OR REPLACE FUNCTION task_comment_text_unlink_after_update()
  RETURNS "trigger" AS
$BODY$
declare
begin
    perform lo_unlink(cast(old.text as oid));
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

CREATE TRIGGER task_comment_text_unlink_after_update_trigger
  AFTER UPDATE
  ON task_comment
  FOR EACH ROW
  WHEN (old.text IS NOT NULL AND old.text IS DISTINCT FROM new.text)
  EXECUTE PROCEDURE task_comment_text_unlink_after_update();

CREATE OR REPLACE FUNCTION task_comment_text_unlink_after_delete()
  RETURNS "trigger" AS
$BODY$
declare
begin
    perform lo_unlink(cast(old.text as oid));
    return old;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

CREATE TRIGGER task_comment_text_unlink_after_delete_trigger
  AFTER DELETE
  ON task_comment
  FOR EACH ROW
  WHEN (old.text IS NOT NULL)
  EXECUTE PROCEDURE task_comment_text_unlink_after_delete();

-- querydefinitionstore.qexpression for Unlink

CREATE OR REPLACE FUNCTION querydefinitionstore_qexpression_unlink_after_update()
  RETURNS "trigger" AS
$BODY$
declare
begin
    perform lo_unlink(cast(old.qexpression as oid));
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

CREATE TRIGGER querydefinitionstore_qexpression_unlink_after_update_trigger
  AFTER UPDATE
  ON querydefinitionstore
  FOR EACH ROW
  WHEN (old.qexpression IS NOT NULL AND old.qexpression IS DISTINCT FROM new.qexpression)
  EXECUTE PROCEDURE querydefinitionstore_qexpression_unlink_after_update();

CREATE OR REPLACE FUNCTION querydefinitionstore_qexpression_unlink_after_delete()
  RETURNS "trigger" AS
$BODY$
declare
begin
    perform lo_unlink(cast(old.qexpression as oid));
    return old;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

CREATE TRIGGER querydefinitionstore_qexpression_unlink_after_delete_trigger
  AFTER DELETE
  ON querydefinitionstore
  FOR EACH ROW
  WHEN (old.qexpression IS NOT NULL)
  EXECUTE PROCEDURE querydefinitionstore_qexpression_unlink_after_delete();

-- deploymentstore.deploymentunit for Unlink

CREATE OR REPLACE FUNCTION deploymentstore_deploymentunit_unlink_after_update()
  RETURNS "trigger" AS
$BODY$
declare
begin
    perform lo_unlink(cast(old.deploymentunit as oid));
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

CREATE TRIGGER deploymentstore_deploymentunit_unlink_after_update_trigger
  AFTER UPDATE
  ON deploymentstore
  FOR EACH ROW
  WHEN (old.deploymentunit IS NOT NULL AND old.deploymentunit IS DISTINCT FROM new.deploymentunit)
  EXECUTE PROCEDURE deploymentstore_deploymentunit_unlink_after_update();

CREATE OR REPLACE FUNCTION deploymentstore_deploymentunit_unlink_after_delete()
  RETURNS "trigger" AS
$BODY$
declare
begin
    perform lo_unlink(cast(old.deploymentunit as oid));
    return old;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

CREATE TRIGGER deploymentstore_deploymentunit_unlink_after_delete_trigger
  AFTER DELETE
  ON deploymentstore
  FOR EACH ROW
  WHEN (old.deploymentunit IS NOT NULL)
  EXECUTE PROCEDURE deploymentstore_deploymentunit_unlink_after_delete();

