package com.redhat.gss.jbpm;

import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;

public class PostgreSQLLOCreateTriggerGen {

    private static final String OUTPUT_FILE = "postgresql-jbpm-lo-trigger.sql";

    StringBuilder sb = new StringBuilder();

    public static void main( String[] args ) throws Exception {
        PostgreSQLLOCreateTriggerGen gen = new PostgreSQLLOCreateTriggerGen();
        gen.generateScript();

        System.out.println( "finished" );
    }

    private void generateScript() throws Exception {

        sb.append( "create table jbpm_active_clob ( loid oid );\n\n" );

        sb.append( "-- BLOB triggers\n\n" );

        // BLOB
        generatePerColumn( "content", "content", false );
        generatePerColumn( "processinstanceinfo", "processinstancebytearray", false );
        generatePerColumn( "requestinfo", "requestdata", false );
        generatePerColumn( "requestinfo", "responsedata", false );
        generatePerColumn( "sessioninfo", "rulesbytearray", false );
        generatePerColumn( "workiteminfo", "workitembytearray", false );

        sb.append( "-- CLOB triggers\n\n" );

        // CLOB
        generatePerColumn( "booleanexpression", "expression", true );
        generatePerColumn( "email_header", "body", true );
        generatePerColumn( "i18ntext", "text", true );
        generatePerColumn( "task_comment", "text", true );
        generatePerColumn( "querydefinitionstore", "qexpression", true );
        generatePerColumn( "deploymentstore", "deploymentunit", true );

        PrintWriter pw = new PrintWriter( new FileWriter( new File( OUTPUT_FILE ) ) );
        pw.write( sb.toString() );
        pw.close();
    }

    private void generatePerColumn( String table, String column, boolean isClob ) {
        
        sb.append( "-- " + table + "." + column + "\n\n" );

        if (isClob) {
            generateBeforeInsertTrigger( table, column );
        }
        
        if (isClob) {
            generateBeforeUpdateTrigger( table, column );
        }
        
        generateAfterUpdateTrigger( table, column, isClob );
        generateAfterDeleteTrigger( table, column, isClob );
    }

    private void generateBeforeInsertTrigger( String table, String column ) {
        String beforeInsertTrigger =
                "CREATE OR REPLACE FUNCTION " + table + "_" + column + "_clob_before_insert()\n" +
                "  RETURNS \"trigger\" AS\n" +
                "$BODY$\n" +
                "declare\n" +
                "begin\n" +
                "    insert into jbpm_active_clob (loid) values (cast(new." + column + " as oid));\n" +
                "    return new;\n" +
                "EXCEPTION WHEN others THEN\n" +
                "    return new;\n" +
                "end;\n" +
                "$BODY$\n" +
                "  LANGUAGE plpgsql VOLATILE;\n" +
                "\n" +
                "ALTER FUNCTION " + table + "_" + column + "_clob_before_insert() OWNER TO postgres;\n" +
                "\n" +
                "CREATE TRIGGER " + table + "_" + column + "_clob_before_insert_trigger\n" +
                "  BEFORE INSERT\n" +
                "  ON " + table + "\n" +
                "  FOR EACH ROW\n" +
                "  WHEN (new." + column + " IS NOT NULL)\n" +
                "  EXECUTE PROCEDURE " + table + "_" + column + "_clob_before_insert();\n" +
                "\n";

        sb.append( beforeInsertTrigger );
    }

    private void generateBeforeUpdateTrigger( String table, String column ) {
        String beforeUpdateTrigger =
                "CREATE OR REPLACE FUNCTION " + table + "_" + column + "_clob_before_update()\n" +
                "  RETURNS \"trigger\" AS\n" +
                "$BODY$\n" +
                "declare\n" +
                "begin\n" +
                "    insert into jbpm_active_clob (loid) values (cast(new." + column + " as oid));\n" +
                "    return new;\n" +
                "EXCEPTION WHEN others THEN\n" +
                "    return new;\n" +
                "end;\n" +
                "$BODY$\n" +
                "  LANGUAGE plpgsql VOLATILE;\n" +
                "\n" +
                "ALTER FUNCTION " + table + "_" + column + "_clob_before_update() OWNER TO postgres;\n" +
                "\n" +
                "CREATE TRIGGER " + table + "_" + column + "_clob_before_update_trigger\n" +
                "  BEFORE UPDATE\n" +
                "  ON " + table + "\n" +
                "  FOR EACH ROW\n" +
                "  WHEN (new." + column + " IS NOT NULL AND old." + column + " IS DISTINCT FROM new." + column + ")\n" +
                "  EXECUTE PROCEDURE " + table + "_" + column + "_clob_before_update();\n" +
                "\n";

        sb.append( beforeUpdateTrigger );
    }

    private void generateAfterUpdateTrigger( String table, String column, boolean isClob ) {
        
        String maintainClob;
        if (isClob) {
            maintainClob = "    delete from jbpm_active_clob where loid = cast(old." + column + " as oid);\n";
        } else {
            maintainClob = ""; // BLOB
        }
        
        String afterUpdateTrigger =
                "CREATE OR REPLACE FUNCTION " + table + "_" + column + "_clob_after_update()\n" +
                "  RETURNS \"trigger\" AS\n" +
                "$BODY$\n" +
                "declare\n" +
                "begin\n" +
                maintainClob +
                "    perform lo_unlink(cast(old." + column + " as oid));\n" +
                "    return new;\n" +
                "EXCEPTION WHEN others THEN\n" +
                "    return new;\n" +
                "end;\n" +
                "$BODY$\n" +
                "  LANGUAGE plpgsql VOLATILE;\n" +
                "\n" +
                "ALTER FUNCTION " + table + "_" + column + "_clob_after_update() OWNER TO postgres;\n" +
                "\n" +
                "CREATE TRIGGER " + table + "_" + column + "_clob_after_update_trigger\n" +
                "  AFTER UPDATE\n" +
                "  ON " + table + "\n" +
                "  FOR EACH ROW\n" +
                "  WHEN (old." + column + " IS NOT NULL AND old." + column + " IS DISTINCT FROM new." + column + ")\n" +
                "  EXECUTE PROCEDURE " + table + "_" + column + "_clob_after_update();\n" +
                "\n";

        sb.append( afterUpdateTrigger );
    }
    
    private void generateAfterDeleteTrigger( String table, String column, boolean isClob ) {
        
        String maintainClob;
        if (isClob) {
            maintainClob = "    delete from jbpm_active_clob where loid = cast(old." + column + " as oid);\n";
        } else {
            maintainClob = ""; // BLOB
        }
        
        String afterDeleteTrigger =
                "CREATE OR REPLACE FUNCTION " + table + "_" + column + "_clob_after_delete()\n" +
                "  RETURNS \"trigger\" AS\n" +
                "$BODY$\n" +
                "declare\n" +
                "begin\n" +
                maintainClob +
                "    perform lo_unlink(cast(old." + column + " as oid));\n" +
                "    return old;\n" +
                "EXCEPTION WHEN others THEN\n" +
                "    return old;\n" +
                "end;\n" +
                "$BODY$\n" +
                "  LANGUAGE plpgsql VOLATILE;\n" +
                "\n" +
                "ALTER FUNCTION " + table + "_" + column + "_clob_after_delete() OWNER TO postgres;\n" +
                "\n" +
                "CREATE TRIGGER " + table + "_" + column + "_clob_after_delete_trigger\n" +
                "  AFTER DELETE\n" +
                "  ON " + table + "\n" +
                "  FOR EACH ROW\n" +
                "  WHEN (old." + column + " IS NOT NULL)\n" +
                "  EXECUTE PROCEDURE " + table + "_" + column + "_clob_after_delete();\n" +
                "\n";

        sb.append( afterDeleteTrigger );
    }
}