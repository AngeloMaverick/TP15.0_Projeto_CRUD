/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;
import java.sql.*;
import java.util.ArrayList;
import web.DbListener;

/**
 *
 * @author Desktop
 */
public class TasksConnector {
    public static ArrayList<String> getTasks() throws Exception{
        ArrayList<String> list = new ArrayList<>();
        Connection con = DbListener.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM TASKS");
        while(rs.next()){
            list.add(rs.getString("name"));
        }
        rs.close();
        stmt.close();
        con.close();
        return list;
    }
    
    public static void addTask(String taskName) throws Exception{
        Connection con = DbListener.getConnection();
        Statement stmt = con.createStatement();
        stmt.execute("INSERT INTO TASKS VALUES('"+taskName+"')");
        stmt.close();
        con.close();
    }
    
    public static void removeTask(String taskName) throws Exception{
        Connection con = DbListener.getConnection();
        Statement stmt = con.createStatement();
        stmt.execute("DELETE FROM TASKS WHERE NAME = '"+taskName+"'");
        stmt.close();
        con.close();
    }
}
