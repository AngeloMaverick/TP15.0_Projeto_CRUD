<%-- 
    Document   : index
    Created on : 31 de mai. de 2021, 16:45:11
    Author     : Desktop
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%
    //Rotina de consulta direta ao SQLite
    //
    //Considerando que há um arquivo SQLite criado manualmente no drive C:\
    String error = null;
    ArrayList<String> tasks = new ArrayList<>();
    try{
        Class.forName("org.sqlite.JDBC");
        Connection con = DriverManager.getConnection("jdbc:sqlite:C:\\teste.db");
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM TASKS");
        while(rs.next()){
            tasks.add(rs.getString("name"));
        }
        rs.close();
        stmt.close();
        con.close();
    }catch(Exception ex){
        error = ex.getMessage();
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Início - JDBC</title>
    </head>
    <body>
        <h1>JDBC</h1>
        <h2>Início</h2>
        <%if(error != null){%>
        <div style="color:red"><%= error %></div>
        <%}%>
        <table border="1">
            <tr>
                <th>Nome da tarefa</th>
            </tr>
            <%for(String taskName: tasks){%>
            <tr>
                <td><%= taskName %></td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
