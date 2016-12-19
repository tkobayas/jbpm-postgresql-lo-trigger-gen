package com.redhat.gss.jbpm;

import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;

public class PostgreSQLLODropTriggerGen {

    private static final String OUTPUT_FILE_FOR_CLOB = "drop-postgresql-jbpm-lo-trigger-clob.sql";
    private static final String OUTPUT_FILE_FOR_UNLINK = "drop-postgresql-jbpm-lo-trigger-unlink.sql";

    StringBuilder sb = new StringBuilder();

    public static void main( String[] args ) throws Exception {
        PostgreSQLLODropTriggerGen gen = new PostgreSQLLODropTriggerGen();
        gen.generateScript();

        System.out.println( "finished" );
    }

    private void generateScript() throws Exception {

        sb.append( "drop table jbpm_active_clob;\n\n" );

        generatePerColumnForCLOB( "booleanexpression", "expression" );
        generatePerColumnForCLOB( "email_header", "body" );
        generatePerColumnForCLOB( "i18ntext", "text" );
        generatePerColumnForCLOB( "task_comment", "text" );
        generatePerColumnForCLOB( "querydefinitionstore", "qexpression" );
        generatePerColumnForCLOB( "deploymentstore", "deploymentunit" );
        
        PrintWriter pw1 = new PrintWriter( new FileWriter( new File( OUTPUT_FILE_FOR_CLOB ) ) );
        pw1.write( sb.toString() );
        pw1.close();
        
        sb = new StringBuilder();

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

        sb.append( "-- " + table + "." + column + "\n\n" );

        String drop =
                "DROP TRIGGER " + table + "_" + column + "_clob_before_insert_trigger ON " + table + ";\n" +
                "DROP FUNCTION " + table + "_" + column + "_clob_before_insert();\n" +
                "\n" +
                "DROP TRIGGER " + table + "_" + column + "_clob_before_update_trigger ON " + table + ";\n" +
                "DROP FUNCTION " + table + "_" + column + "_clob_before_update();\n" +
                "\n" +
                "DROP TRIGGER " + table + "_" + column + "_clob_after_update_trigger ON " + table + ";\n" +
                "DROP FUNCTION " + table + "_" + column + "_clob_after_update();\n" +
                "\n" +
                "DROP TRIGGER " + table + "_" + column + "_clob_after_delete_trigger ON " + table + ";\n" +
                "DROP FUNCTION " + table + "_" + column + "_clob_after_delete();\n" +
                "\n";

        sb.append( drop );
    }

    private void generatePerColumnForUnlink( String table, String column ) {

        sb.append( "-- " + table + "." + column + "\n\n" );

        String identifier_prefix = table + "_" + column;
        // special case for long name because PostgreSQL truncates the name.
        if ( identifier_prefix.equals( "processinstanceinfo_processinstancebytearray" ) ) {
            identifier_prefix = "processinstanceinfo_array";
        }

        String drop =
                "DROP TRIGGER " + identifier_prefix + "_unlink_after_update_trigger ON " + table + ";\n" +
                "DROP FUNCTION " + identifier_prefix + "_unlink_after_update();\n" +
                "\n" +
                "DROP TRIGGER " + identifier_prefix + "_unlink_after_delete_trigger ON " + table + ";\n" +
                "DROP FUNCTION " + identifier_prefix + "_unlink_after_delete();\n" +
                "\n";

        sb.append( drop );
    }
}