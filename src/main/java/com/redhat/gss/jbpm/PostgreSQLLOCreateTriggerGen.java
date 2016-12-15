package com.redhat.gss.jbpm;

import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;

public class PostgreSQLLOCreateTriggerGen {

    private static final String OUTPUT_FILE = "jbpm_active_clob_create_trigger.txt";

    StringBuilder sb = new StringBuilder();

    public static void main( String[] args ) throws Exception {
        PostgreSQLLOCreateTriggerGen gen = new PostgreSQLLOCreateTriggerGen();
        gen.generateScript();

        System.out.println( "finished" );
    }

    private void generateScript() throws Exception {

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
                "CREATE OR REPLACE FUNCTION " + table + "_clob_insert()\n" +
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
                "ALTER FUNCTION " + table + "_clob_insert() OWNER TO postgres;\n" +
                "\n" +
                "CREATE TRIGGER " + table + "_clob_insert_trigger\n" +
                "  AFTER INSERT\n" +
                "  ON " + table + "\n" +
                "  FOR EACH ROW\n" +
                "  EXECUTE PROCEDURE " + table + "_clob_insert();\n" +
                "\n";

        sb.append( insertTrigger );
    }

    private void generateUpdateTrigger( String table, String column ) {
        String updateTrigger =
                "CREATE OR REPLACE FUNCTION " + table + "_clob_update()\n" +
                "  RETURNS \"trigger\" AS\n" +
                "$BODY$\n" +
                "declare\n" +
                "begin\n" +
                "    update jbpm_active_clob set loid = cast(new." + column + " as oid) where loid = cast(old." + column + " as oid);\n" +
                "    return new;\n" +
                "end;\n" +
                "$BODY$\n" +
                "  LANGUAGE plpgsql VOLATILE;\n" +
                "\n" +
                "ALTER FUNCTION " + table + "_clob_update() OWNER TO postgres;\n" +
                "\n" +
                "CREATE TRIGGER " + table + "_clob_update_trigger\n" +
                "  AFTER UPDATE\n" +
                "  ON " + table + "\n" +
                "  FOR EACH ROW\n" +
                "  EXECUTE PROCEDURE " + table + "_clob_update();\n" +
                "\n";

        sb.append( updateTrigger );
    }

    private void generateDeleteTrigger( String table, String column ) {
        String deleteTrigger =
                "CREATE OR REPLACE FUNCTION " + table + "_clob_delete()\n" +
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
                "ALTER FUNCTION " + table + "_clob_delete() OWNER TO postgres;\n" +
                "\n" +
                "CREATE TRIGGER " + table + "_clob_delete_trigger\n" +
                "  AFTER DELETE\n" +
                "  ON " + table + "\n" +
                "  FOR EACH ROW\n" +
                "  EXECUTE PROCEDURE " + table + "_clob_delete();\n" +
                "\n";

        sb.append( deleteTrigger );
    }
}