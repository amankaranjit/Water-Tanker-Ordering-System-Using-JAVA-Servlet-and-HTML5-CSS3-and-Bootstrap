<%-- 
    Document   : releaseButton
    Created on : Mar 18, 2022, 1:11:44 PM
    Author     : Aman Karanjit
--%>

<%@page import="com.watertanker.database.JDBCConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String b_id = request.getParameter("id");
            int id = Integer.parseInt(b_id);
//            System.out.println("id"+id);
            Connection conn = JDBCConnection.getConnection();
            Statement stmt = conn.createStatement();
            stmt.executeUpdate("update booking, tanker set booking.status = 3, tanker.status = 0 where booking.tanker_id = tanker.id  and tanker.id= '" + id + "'");

            response.sendRedirect("adminBooking.jsp");
        %>
    </body>
</html>
