package com.redhat.gss.jbpm;

import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;

public class PostgreSQLLODropTriggerGen {

    private static final String OUTPUT_FILE = "jbpm_active_clob_drop_trigger.txt";

    StringBuilder sb = new StringBuilder();

    public static void main( String[] args ) throws Exception {
        PostgreSQLLODropTriggerGen gen = new PostgreSQLLODropTriggerGen();
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
                "DROP TRIGGER " + table + "_clob_insert_trigger ON " + table + ";\n" +
                "DROP FUNCTION " + table + "_clob_insert();\n" +
                "\n";

        sb.append( insertTrigger );
    }

    private void generateUpdateTrigger( String table, String column ) {
        String updateTrigger =
                "DROP TRIGGER " + table + "_clob_update_trigger ON " + table + ";\n" +
                "DROP FUNCTION " + table + "_clob_update();\n" +
                "\n";

        sb.append( updateTrigger );
    }

    private void generateDeleteTrigger( String table, String column ) {
        String deleteTrigger =
                "DROP TRIGGER " + table + "_clob_delete_trigger ON " + table + ";\n" +
                "DROP FUNCTION " + table + "_clob_delete();\n" +
                "\n";

        sb.append( deleteTrigger );
    }
}