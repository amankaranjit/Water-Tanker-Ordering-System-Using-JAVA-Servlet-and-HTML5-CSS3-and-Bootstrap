<%-- 
    Document   : Booking
    Created on : Mar 10, 2022, 12:52:22 PM
    Author     : Aman Karanjit
--%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.watertanker.database.JDBCConnection"%>
<%@page import="com.watertanker.database.JDBCConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Admin Panel</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="icon" href="../image/logo.jpg" type="image/icon type">
    </head>
    <body>
     <%
            String userid = request.getParameter("id");
            int id = Integer.parseInt(userid);
            Connection conn = JDBCConnection.getConnection();
            Statement stmt = conn.createStatement();
            stmt.executeUpdate("update booking set status =2 where id= '" + id + "'");
            response.sendRedirect("queued.jsp");

        %>
    </body>
</html>
