create table jbpm_active_clob ( loid oid );

-- booleanexpression.expression

CREATE OR REPLACE FUNCTION booleanexpression_clob_before_insert()
  RETURNS "trigger" AS
$BODY$
declare
begin
    insert into jbpm_active_clob (loid) values (cast(new.expression as oid));
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION booleanexpression_clob_before_insert() OWNER TO postgres;

CREATE TRIGGER booleanexpression_clob_before_insert_trigger
  BEFORE INSERT
  ON booleanexpression
  FOR EACH ROW
  EXECUTE PROCEDURE booleanexpression_clob_before_insert();

CREATE OR REPLACE FUNCTION booleanexpression_clob_before_update()
  RETURNS "trigger" AS
$BODY$
declare
begin
    insert into jbpm_active_clob (loid) values (cast(new.expression as oid));
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION booleanexpression_clob_before_update() OWNER TO postgres;

CREATE TRIGGER booleanexpression_clob_before_update_trigger
  BEFORE UPDATE
  ON booleanexpression
  FOR EACH ROW
  WHEN (old.expression IS DISTINCT FROM new.expression)
  EXECUTE PROCEDURE booleanexpression_clob_before_update();

CREATE OR REPLACE FUNCTION booleanexpression_clob_after_update()
  RETURNS "trigger" AS
$BODY$
declare
begin
    delete from jbpm_active_clob where loid = cast(old.expression as oid);
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION booleanexpression_clob_after_update() OWNER TO postgres;

CREATE TRIGGER booleanexpression_clob_after_update_trigger
  AFTER UPDATE
  ON booleanexpression
  FOR EACH ROW
  WHEN (old.expression IS DISTINCT FROM new.expression)
  EXECUTE PROCEDURE booleanexpression_clob_after_update();

CREATE OR REPLACE FUNCTION booleanexpression_clob_after_delete()
  RETURNS "trigger" AS
$BODY$
declare
begin
    delete from jbpm_active_clob where loid = cast(old.expression as oid);
    return old;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION booleanexpression_clob_after_delete() OWNER TO postgres;

CREATE TRIGGER booleanexpression_clob_after_delete_trigger
  AFTER DELETE
  ON booleanexpression
  FOR EACH ROW
  EXECUTE PROCEDURE booleanexpression_clob_after_delete();

-- email_header.body

CREATE OR REPLACE FUNCTION email_header_clob_before_insert()
  RETURNS "trigger" AS
$BODY$
declare
begin
    insert into jbpm_active_clob (loid) values (cast(new.body as oid));
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION email_header_clob_before_insert() OWNER TO postgres;

CREATE TRIGGER email_header_clob_before_insert_trigger
  BEFORE INSERT
  ON email_header
  FOR EACH ROW
  EXECUTE PROCEDURE email_header_clob_before_insert();

CREATE OR REPLACE FUNCTION email_header_clob_before_update()
  RETURNS "trigger" AS
$BODY$
declare
begin
    insert into jbpm_active_clob (loid) values (cast(new.body as oid));
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION email_header_clob_before_update() OWNER TO postgres;

CREATE TRIGGER email_header_clob_before_update_trigger
  BEFORE UPDATE
  ON email_header
  FOR EACH ROW
  WHEN (old.body IS DISTINCT FROM new.body)
  EXECUTE PROCEDURE email_header_clob_before_update();

CREATE OR REPLACE FUNCTION email_header_clob_after_update()
  RETURNS "trigger" AS
$BODY$
declare
begin
    delete from jbpm_active_clob where loid = cast(old.body as oid);
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION email_header_clob_after_update() OWNER TO postgres;

CREATE TRIGGER email_header_clob_after_update_trigger
  AFTER UPDATE
  ON email_header
  FOR EACH ROW
  WHEN (old.body IS DISTINCT FROM new.body)
  EXECUTE PROCEDURE email_header_clob_after_update();

CREATE OR REPLACE FUNCTION email_header_clob_after_delete()
  RETURNS "trigger" AS
$BODY$
declare
begin
    delete from jbpm_active_clob where loid = cast(old.body as oid);
    return old;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION email_header_clob_after_delete() OWNER TO postgres;

CREATE TRIGGER email_header_clob_after_delete_trigger
  AFTER DELETE
  ON email_header
  FOR EACH ROW
  EXECUTE PROCEDURE email_header_clob_after_delete();

-- i18ntext.text

CREATE OR REPLACE FUNCTION i18ntext_clob_before_insert()
  RETURNS "trigger" AS
$BODY$
declare
begin
    insert into jbpm_active_clob (loid) values (cast(new.text as oid));
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION i18ntext_clob_before_insert() OWNER TO postgres;

CREATE TRIGGER i18ntext_clob_before_insert_trigger
  BEFORE INSERT
  ON i18ntext
  FOR EACH ROW
  EXECUTE PROCEDURE i18ntext_clob_before_insert();

CREATE OR REPLACE FUNCTION i18ntext_clob_before_update()
  RETURNS "trigger" AS
$BODY$
declare
begin
    insert into jbpm_active_clob (loid) values (cast(new.text as oid));
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION i18ntext_clob_before_update() OWNER TO postgres;

CREATE TRIGGER i18ntext_clob_before_update_trigger
  BEFORE UPDATE
  ON i18ntext
  FOR EACH ROW
  WHEN (old.text IS DISTINCT FROM new.text)
  EXECUTE PROCEDURE i18ntext_clob_before_update();

CREATE OR REPLACE FUNCTION i18ntext_clob_after_update()
  RETURNS "trigger" AS
$BODY$
declare
begin
    delete from jbpm_active_clob where loid = cast(old.text as oid);
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION i18ntext_clob_after_update() OWNER TO postgres;

CREATE TRIGGER i18ntext_clob_after_update_trigger
  AFTER UPDATE
  ON i18ntext
  FOR EACH ROW
  WHEN (old.text IS DISTINCT FROM new.text)
  EXECUTE PROCEDURE i18ntext_clob_after_update();

CREATE OR REPLACE FUNCTION i18ntext_clob_after_delete()
  RETURNS "trigger" AS
$BODY$
declare
begin
    delete from jbpm_active_clob where loid = cast(old.text as oid);
    return old;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION i18ntext_clob_after_delete() OWNER TO postgres;

CREATE TRIGGER i18ntext_clob_after_delete_trigger
  AFTER DELETE
  ON i18ntext
  FOR EACH ROW
  EXECUTE PROCEDURE i18ntext_clob_after_delete();

-- task_comment.text

CREATE OR REPLACE FUNCTION task_comment_clob_before_insert()
  RETURNS "trigger" AS
$BODY$
declare
begin
    insert into jbpm_active_clob (loid) values (cast(new.text as oid));
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION task_comment_clob_before_insert() OWNER TO postgres;

CREATE TRIGGER task_comment_clob_before_insert_trigger
  BEFORE INSERT
  ON task_comment
  FOR EACH ROW
  EXECUTE PROCEDURE task_comment_clob_before_insert();

CREATE OR REPLACE FUNCTION task_comment_clob_before_update()
  RETURNS "trigger" AS
$BODY$
declare
begin
    insert into jbpm_active_clob (loid) values (cast(new.text as oid));
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION task_comment_clob_before_update() OWNER TO postgres;

CREATE TRIGGER task_comment_clob_before_update_trigger
  BEFORE UPDATE
  ON task_comment
  FOR EACH ROW
  WHEN (old.text IS DISTINCT FROM new.text)
  EXECUTE PROCEDURE task_comment_clob_before_update();

CREATE OR REPLACE FUNCTION task_comment_clob_after_update()
  RETURNS "trigger" AS
$BODY$
declare
begin
    delete from jbpm_active_clob where loid = cast(old.text as oid);
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION task_comment_clob_after_update() OWNER TO postgres;

CREATE TRIGGER task_comment_clob_after_update_trigger
  AFTER UPDATE
  ON task_comment
  FOR EACH ROW
  WHEN (old.text IS DISTINCT FROM new.text)
  EXECUTE PROCEDURE task_comment_clob_after_update();

CREATE OR REPLACE FUNCTION task_comment_clob_after_delete()
  RETURNS "trigger" AS
$BODY$
declare
begin
    delete from jbpm_active_clob where loid = cast(old.text as oid);
    return old;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION task_comment_clob_after_delete() OWNER TO postgres;

CREATE TRIGGER task_comment_clob_after_delete_trigger
  AFTER DELETE
  ON task_comment
  FOR EACH ROW
  EXECUTE PROCEDURE task_comment_clob_after_delete();

-- querydefinitionstore.qexpression

CREATE OR REPLACE FUNCTION querydefinitionstore_clob_before_insert()
  RETURNS "trigger" AS
$BODY$
declare
begin
    insert into jbpm_active_clob (loid) values (cast(new.qexpression as oid));
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION querydefinitionstore_clob_before_insert() OWNER TO postgres;

CREATE TRIGGER querydefinitionstore_clob_before_insert_trigger
  BEFORE INSERT
  ON querydefinitionstore
  FOR EACH ROW
  EXECUTE PROCEDURE querydefinitionstore_clob_before_insert();

CREATE OR REPLACE FUNCTION querydefinitionstore_clob_before_update()
  RETURNS "trigger" AS
$BODY$
declare
begin
    insert into jbpm_active_clob (loid) values (cast(new.qexpression as oid));
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION querydefinitionstore_clob_before_update() OWNER TO postgres;

CREATE TRIGGER querydefinitionstore_clob_before_update_trigger
  BEFORE UPDATE
  ON querydefinitionstore
  FOR EACH ROW
  WHEN (old.qexpression IS DISTINCT FROM new.qexpression)
  EXECUTE PROCEDURE querydefinitionstore_clob_before_update();

CREATE OR REPLACE FUNCTION querydefinitionstore_clob_after_update()
  RETURNS "trigger" AS
$BODY$
declare
begin
    delete from jbpm_active_clob where loid = cast(old.qexpression as oid);
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION querydefinitionstore_clob_after_update() OWNER TO postgres;

CREATE TRIGGER querydefinitionstore_clob_after_update_trigger
  AFTER UPDATE
  ON querydefinitionstore
  FOR EACH ROW
  WHEN (old.qexpression IS DISTINCT FROM new.qexpression)
  EXECUTE PROCEDURE querydefinitionstore_clob_after_update();

CREATE OR REPLACE FUNCTION querydefinitionstore_clob_after_delete()
  RETURNS "trigger" AS
$BODY$
declare
begin
    delete from jbpm_active_clob where loid = cast(old.qexpression as oid);
    return old;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION querydefinitionstore_clob_after_delete() OWNER TO postgres;

CREATE TRIGGER querydefinitionstore_clob_after_delete_trigger
  AFTER DELETE
  ON querydefinitionstore
  FOR EACH ROW
  EXECUTE PROCEDURE querydefinitionstore_clob_after_delete();

-- deploymentstore.deploymentunit

CREATE OR REPLACE FUNCTION deploymentstore_clob_before_insert()
  RETURNS "trigger" AS
$BODY$
declare
begin
    insert into jbpm_active_clob (loid) values (cast(new.deploymentunit as oid));
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION deploymentstore_clob_before_insert() OWNER TO postgres;

CREATE TRIGGER deploymentstore_clob_before_insert_trigger
  BEFORE INSERT
  ON deploymentstore
  FOR EACH ROW
  EXECUTE PROCEDURE deploymentstore_clob_before_insert();

CREATE OR REPLACE FUNCTION deploymentstore_clob_before_update()
  RETURNS "trigger" AS
$BODY$
declare
begin
    insert into jbpm_active_clob (loid) values (cast(new.deploymentunit as oid));
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION deploymentstore_clob_before_update() OWNER TO postgres;

CREATE TRIGGER deploymentstore_clob_before_update_trigger
  BEFORE UPDATE
  ON deploymentstore
  FOR EACH ROW
  WHEN (old.deploymentunit IS DISTINCT FROM new.deploymentunit)
  EXECUTE PROCEDURE deploymentstore_clob_before_update();

CREATE OR REPLACE FUNCTION deploymentstore_clob_after_update()
  RETURNS "trigger" AS
$BODY$
declare
begin
    delete from jbpm_active_clob where loid = cast(old.deploymentunit as oid);
    return new;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION deploymentstore_clob_after_update() OWNER TO postgres;

CREATE TRIGGER deploymentstore_clob_after_update_trigger
  AFTER UPDATE
  ON deploymentstore
  FOR EACH ROW
  WHEN (old.deploymentunit IS DISTINCT FROM new.deploymentunit)
  EXECUTE PROCEDURE deploymentstore_clob_after_update();

CREATE OR REPLACE FUNCTION deploymentstore_clob_after_delete()
  RETURNS "trigger" AS
$BODY$
declare
begin
    delete from jbpm_active_clob where loid = cast(old.deploymentunit as oid);
    return old;
end;
$BODY$
  LANGUAGE plpgsql VOLATILE;

ALTER FUNCTION deploymentstore_clob_after_delete() OWNER TO postgres;

CREATE TRIGGER deploymentstore_clob_after_delete_trigger
  AFTER DELETE
  ON deploymentstore
  FOR EACH ROW
  EXECUTE PROCEDURE deploymentstore_clob_after_delete();

