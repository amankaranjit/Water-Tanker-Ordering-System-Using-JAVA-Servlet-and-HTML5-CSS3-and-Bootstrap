<%-- 
    Document   : DeleteTanker
    Created on : Mar 10, 2022, 9:03:43 PM
    Author     : Aman Karanjit
--%>

<%@page import="com.watertanker.database.JDBCConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="../assets/img/logo.png" type=".image/icon type">
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            String userid = request.getParameter("id");
            int id = Integer.parseInt(userid);
            Connection conn = JDBCConnection.getConnection();
            Statement stmt = conn.createStatement();
            stmt.executeUpdate("delete from tanker where id= '" + id + "'");

            response.sendRedirect("ViewTanker.jsp");

        %>
    </body>
</html>