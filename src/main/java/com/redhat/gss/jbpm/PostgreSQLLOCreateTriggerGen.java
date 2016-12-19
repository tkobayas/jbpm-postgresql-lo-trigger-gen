package com.redhat.gss.jbpm;

import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;

public class PostgreSQLLOCreateTriggerGen {

    private static final String OUTPUT_FILE_FOR_CLOB = "postgresql-jbpm-lo-trigger-clob.sql";
    private static final String OUTPUT_FILE_FOR_UNLINK = "postgresql-jbpm-lo-trigger-unlink.sql";


    StringBuilder sb = new StringBuilder();

    public static void main( String[] args ) throws Exception {
        PostgreSQLLOCreateTriggerGen gen = new PostgreSQLLOCreateTriggerGen();
        gen.generateScript();

        System.out.println( "finished" );
    }

    private void generateScript() throws Exception {

        sb.append( "create table jbpm_active_clob ( loid oid );\n\n" );

        sb.append( "-- Triggers to protect CLOB from vacuumlo\n\n" );

        // CLOB
        generatePerColumnForCLOB( "booleanexpression", "expression" );
        generatePerColumnForCLOB( "email_header", "body" );
        generatePerColumnForCLOB( "i18ntext", "text" );
        generatePerColumnForCLOB( "task_comment", "text" );
        generatePerColumnForCLOB( "querydefinitionstore", "qexpression" );
        generatePerColumnForCLOB( "deploymentstore", "deploymentunit" );
        
        PrintWriter pw1 = new PrintWriter( new FileWriter( new File( OUTPUT_FILE_FOR_CLOB ) ) );
        pw1.write( sb.toString() );
        pw1.close();
        
        //------------------------------------
        
        sb = new StringBuilder();

        sb.append( "-- Triggers to unlink BLOB/CLOB large objects automatically\n\n" );

        // BLOB and CLOB
        generatePerColumnForUnlink( "content", "content" );
        generatePerColumnForUnlink( "processinstanceinfo", "processinstancebytearray" );
        generatePerColumnForUnlink( "requestinfo", "requestdata" );
        generatePerColumnForUnlink( "requestinfo", "responsedata" );
        generatePerColumnForUnlink( "sessioninfo", "rulesbytearray" );
        generatePerColumnForUnlink( "workiteminfo", "workitembytearray" );

        generatePerColumnForUnlink( "booleanexpression", "expression" );
        generatePerColumnForUnlink( "email_header", "body" );
        generatePerColumnForUnlink( "i18ntext", "text" );
        generatePerColumnForUnlink( "task_comment", "text" );
        generatePerColumnForUnlink( "querydefinitionstore", "qexpression" );
        generatePerColumnForUnlink( "deploymentstore", "deploymentunit" );

        PrintWriter pw2 = new PrintWriter( new FileWriter( new File( OUTPUT_FILE_FOR_UNLINK ) ) );
        pw2.write( sb.toString() );
        pw2.close();
    }

    private void generatePerColumnForCLOB( String table, String column ) {

        sb.append( "-- " + table + "." + column + " for CLOB\n\n" );

        generateBeforeInsertTriggerForCLOB( table, column );
        generateBeforeUpdateTriggerForCLOB( table, column );
        generateAfterUpdateTriggerForCLOB( table, column );
        generateAfterDeleteTriggerForCLOB( table, column );
    }

    private void generatePerColumnForUnlink( String table, String column ) {

        sb.append( "-- " + table + "." + column + " for Unlink\n\n" );

        generateAfterUpdateTriggerForUnlink( table, column );
        generateAfterDeleteTriggerForUnlink( table, column );
    }

    private void generateBeforeInsertTriggerForCLOB( String table, String column ) {
        String beforeInsertTrigger =
                "CREATE OR REPLACE FUNCTION " + table + "_" + column + "_clob_before_insert()\n" +
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
                "CREATE TRIGGER " + table + "_" + column + "_clob_before_insert_trigger\n" +
                "  BEFORE INSERT\n" +
                "  ON " + table + "\n" +
                "  FOR EACH ROW\n" +
                "  WHEN (new." + column + " IS NOT NULL)\n" +
                "  EXECUTE PROCEDURE " + table + "_" + column + "_clob_before_insert();\n" +
                "\n";

        sb.append( beforeInsertTrigger );
    }

    private void generateBeforeUpdateTriggerForCLOB( String table, String column ) {
        String beforeUpdateTrigger =
                "CREATE OR REPLACE FUNCTION " + table + "_" + column + "_clob_before_update()\n" +
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
                "CREATE TRIGGER " + table + "_" + column + "_clob_before_update_trigger\n" +
                "  BEFORE UPDATE\n" +
                "  ON " + table + "\n" +
                "  FOR EACH ROW\n" +
                "  WHEN (new." + column + " IS NOT NULL AND old." + column + " IS DISTINCT FROM new." + column + ")\n" +
                "  EXECUTE PROCEDURE " + table + "_" + column + "_clob_before_update();\n" +
                "\n";

        sb.append( beforeUpdateTrigger );
    }

    private void generateAfterUpdateTriggerForCLOB( String table, String column ) {

        String afterUpdateTrigger =
                "CREATE OR REPLACE FUNCTION " + table + "_" + column + "_clob_after_update()\n" +
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
                "CREATE TRIGGER " + table + "_" + column + "_clob_after_update_trigger\n" +
                "  AFTER UPDATE\n" +
                "  ON " + table + "\n" +
                "  FOR EACH ROW\n" +
                "  WHEN (old." + column + " IS NOT NULL AND old." + column + " IS DISTINCT FROM new." + column + ")\n" +
                "  EXECUTE PROCEDURE " + table + "_" + column + "_clob_after_update();\n" +
                "\n";

        sb.append( afterUpdateTrigger );
    }

    private void generateAfterDeleteTriggerForCLOB( String table, String column ) {

        String afterDeleteTrigger =
                "CREATE OR REPLACE FUNCTION " + table + "_" + column + "_clob_after_delete()\n" +
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
                "CREATE TRIGGER " + table + "_" + column + "_clob_after_delete_trigger\n" +
                "  AFTER DELETE\n" +
                "  ON " + table + "\n" +
                "  FOR EACH ROW\n" +
                "  WHEN (old." + column + " IS NOT NULL)\n" +
                "  EXECUTE PROCEDURE " + table + "_" + column + "_clob_after_delete();\n" +
                "\n";

        sb.append( afterDeleteTrigger );
    }

    private void generateAfterUpdateTriggerForUnlink( String table, String column ) {

        String identifier_prefix = table + "_" + column;
        // special case for long name because PostgreSQL truncates the name.
        if ( identifier_prefix.equals( "processinstanceinfo_processinstancebytearray" ) ) {
            identifier_prefix = "processinstanceinfo_array";
        }

        String afterUpdateTrigger =
                "CREATE OR REPLACE FUNCTION " + identifier_prefix + "_unlink_after_update()\n" +
                "  RETURNS \"trigger\" AS\n" +
                "$BODY$\n" +
                "declare\n" +
                "begin\n" +
                "    perform lo_unlink(cast(old." + column + " as oid));\n" +
                "    return new;\n" +
                "end;\n" +
                "$BODY$\n" +
                "  LANGUAGE plpgsql VOLATILE;\n" +
                "\n" +
                "CREATE TRIGGER " + identifier_prefix + "_unlink_after_update_trigger\n" +
                "  AFTER UPDATE\n" +
                "  ON " + table + "\n" +
                "  FOR EACH ROW\n" +
                "  WHEN (old." + column + " IS NOT NULL AND old." + column + " IS DISTINCT FROM new." + column + ")\n" +
                "  EXECUTE PROCEDURE " + identifier_prefix + "_unlink_after_update();\n" +
                "\n";

        sb.append( afterUpdateTrigger );
    }

    private void generateAfterDeleteTriggerForUnlink( String table, String column ) {

        String identifier_prefix = table + "_" + column;
        // special case for long name because PostgreSQL truncates the name.
        if ( identifier_prefix.equals( "processinstanceinfo_processinstancebytearray" ) ) {
            identifier_prefix = "processinstanceinfo_array";
        }

        String afterDeleteTrigger =
                "CREATE OR REPLACE FUNCTION " + identifier_prefix + "_unlink_after_delete()\n" +
                "  RETURNS \"trigger\" AS\n" +
                "$BODY$\n" +
                "declare\n" +
                "begin\n" +
                "    perform lo_unlink(cast(old." + column + " as oid));\n" +
                "    return old;\n" +
                "end;\n" +
                "$BODY$\n" +
                "  LANGUAGE plpgsql VOLATILE;\n" +
                "\n" +
                "CREATE TRIGGER " + identifier_prefix + "_unlink_after_delete_trigger\n" +
                "  AFTER DELETE\n" +
                "  ON " + table + "\n" +
                "  FOR EACH ROW\n" +
                "  WHEN (old." + column + " IS NOT NULL)\n" +
                "  EXECUTE PROCEDURE " + identifier_prefix + "_unlink_after_delete();\n" +
                "\n";

        sb.append( afterDeleteTrigger );
    }
}