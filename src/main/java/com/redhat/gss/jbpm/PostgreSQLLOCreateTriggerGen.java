package com.redhat.gss.jbpm;

import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;

public class PostgreSQLLOCreateTriggerGen {

    private static final String OUTPUT_FILE = "jbpm_active_clob_create_trigger.sql";

    StringBuilder sb = new StringBuilder();

    public static void main( String[] args ) throws Exception {
        PostgreSQLLOCreateTriggerGen gen = new PostgreSQLLOCreateTriggerGen();
        gen.generateScript();

        System.out.println( "finished" );
    }

    private void generateScript() throws Exception {
        
        sb.append( "create table jbpm_active_clob ( loid oid );\n\n" );

        generatePerColumn( "booleanexpression", "expression" );
        generatePerColumn( "email_header", "body" );
        generatePerColumn( "i18ntext", "text" );
        generatePerColumn( "task_comment", "text" );
        generatePerColumn( "querydefinitionstore", "qexpression" );
        generatePerColumn( "deploymentstore", "deploymentunit" );

        PrintWriter pw = new PrintWriter( new FileWriter( new File( OUTPUT_FILE ) ) );
        pw.write( sb.toString() );
        pw.close();

    }

    private void generatePerColumn( String table, String column ) {

        sb.append( "-- " + table + "." + column + "\n\n" );

        generateInsertTrigger( table, column );
        generateUpdateTrigger( table, column );
        generateDeleteTrigger( table, column );
    }

    private void generateInsertTrigger( String table, String column ) {
        String insertTrigger =
                "CREATE OR REPLACE FUNCTION " + table + "_clob_before_insert()\n" +
                "  RETURNS \"trigger\" AS\n" +
                "$BODY$\n" +
                "declare\n" +
                "begin\n" +
                "    insert into jbpm_active_clob (loid) values (cast(new." + column + " as oid));\n" +
                "    return new;\n" +
                "end;\n" +
                "$BODY$\n" +
                "  LANGUAGE plpgsql VOLATILE;\n" +
                "\n" +
                "ALTER FUNCTION " + table + "_clob_before_insert() OWNER TO postgres;\n" +
                "\n" +
                "CREATE TRIGGER " + table + "_clob_before_insert_trigger\n" +
                "  BEFORE INSERT\n" +
                "  ON " + table + "\n" +
                "  FOR EACH ROW\n" +
                "  EXECUTE PROCEDURE " + table + "_clob_before_insert();\n" +
                "\n";

        sb.append( insertTrigger );
    }

    private void generateUpdateTrigger( String table, String column ) {
        String beforeUpdateTrigger =
                "CREATE OR REPLACE FUNCTION " + table + "_clob_before_update()\n" +
                "  RETURNS \"trigger\" AS\n" +
                "$BODY$\n" +
                "declare\n" +
                "begin\n" +
                "    insert into jbpm_active_clob (loid) values (cast(new." + column + " as oid));\n" +
                "    return new;\n" +
                "end;\n" +
                "$BODY$\n" +
                "  LANGUAGE plpgsql VOLATILE;\n" +
                "\n" +
                "ALTER FUNCTION " + table + "_clob_before_update() OWNER TO postgres;\n" +
                "\n" +
                "CREATE TRIGGER " + table + "_clob_before_update_trigger\n" +
                "  BEFORE UPDATE\n" +
                "  ON " + table + "\n" +
                "  FOR EACH ROW\n" +
                "  WHEN (old." + column + " IS DISTINCT FROM new." + column + ")\n" +
                "  EXECUTE PROCEDURE " + table + "_clob_before_update();\n" +
                "\n";

        sb.append( beforeUpdateTrigger );
        
        String afterUpdateTrigger =
                "CREATE OR REPLACE FUNCTION " + table + "_clob_after_update()\n" +
                "  RETURNS \"trigger\" AS\n" +
                "$BODY$\n" +
                "declare\n" +
                "begin\n" +
                "    delete from jbpm_active_clob where loid = cast(old." + column + " as oid);\n" +
                "    return new;\n" +
                "end;\n" +
                "$BODY$\n" +
                "  LANGUAGE plpgsql VOLATILE;\n" +
                "\n" +
                "ALTER FUNCTION " + table + "_clob_after_update() OWNER TO postgres;\n" +
                "\n" +
                "CREATE TRIGGER " + table + "_clob_after_update_trigger\n" +
                "  AFTER UPDATE\n" +
                "  ON " + table + "\n" +
                "  FOR EACH ROW\n" +
                "  WHEN (old." + column + " IS DISTINCT FROM new." + column + ")\n" +
                "  EXECUTE PROCEDURE " + table + "_clob_after_update();\n" +
                "\n";

        sb.append( afterUpdateTrigger );
    }

    private void generateDeleteTrigger( String table, String column ) {
        String deleteTrigger =
                "CREATE OR REPLACE FUNCTION " + table + "_clob_after_delete()\n" +
                "  RETURNS \"trigger\" AS\n" +
                "$BODY$\n" +
                "declare\n" +
                "begin\n" +
                "    delete from jbpm_active_clob where loid = cast(old." + column + " as oid);\n" +
                "    return old;\n" +
                "end;\n" +
                "$BODY$\n" +
                "  LANGUAGE plpgsql VOLATILE;\n" +
                "\n" +
                "ALTER FUNCTION " + table + "_clob_after_delete() OWNER TO postgres;\n" +
                "\n" +
                "CREATE TRIGGER " + table + "_clob_after_delete_trigger\n" +
                "  AFTER DELETE\n" +
                "  ON " + table + "\n" +
                "  FOR EACH ROW\n" +
                "  EXECUTE PROCEDURE " + table + "_clob_after_delete();\n" +
                "\n";

        sb.append( deleteTrigger );
    }
}