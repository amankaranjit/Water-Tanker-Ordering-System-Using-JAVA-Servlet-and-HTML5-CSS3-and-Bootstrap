<%-- 
    Document   : Delete
    Created on : Mar 14, 2022, 9:51:45 PM
    Author     : Aman Karanjit
--%>

<%@page import="java.sql.Statement"%>
<%@page import="com.watertanker.database.JDBCConnection"%>
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
            String userid = request.getParameter("id");
            int id = Integer.parseInt(userid);
            Connection conn = JDBCConnection.getConnection();
            Statement stmt = conn.createStatement();
            stmt.executeUpdate("delete from category where id= '" + id + "'");

            response.sendRedirect("AddCategory.jsp");

        %>
    </body>
</html>
