<%-- 
    Document   : index
    Created on : Mar 10, 2022, 10:24:22 AM
    Author     : Aman Karanjit
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.watertanker.database.JDBCConnection"%>
<%@page import="com.watertanker.database.JDBCConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Water Tanker Supply</title>

        <link rel="icon" href="image/logo.jpg" type="image/icon type">
        <style>
            body{
                background-color: #6d9270;
            }
        </style>
    </head>
    <body>
        <%
            Object u_id = session.getAttribute("s_id");
        %>
        <jsp:include page="navbar.jsp"/>
        <div class="album ">
            <div class="container " style="width: 500px;">

                <div class="row  mt-5 mb-5">
                    <div class="col">

                        <div class="card bg-light mb-2 " >
                            <h2 class="text-center p-3 text-dark ">Cart Page</h2>
                            <div class="card-body mb-2">                                
                                <form action="BookingServlet" method="post">
                                    <%
                                        Connection cn = JDBCConnection.getConnection();
//                                        System.out.println(id);
                                        Statement stmt = cn.createStatement();
                                        ResultSet rss = stmt.executeQuery("select * from booking join user where booking.user_id = user.id and user_id = '" + u_id + "' order by booking.id desc limit 1");
                                        while (rss.next()) {
                                            String name = rss.getString("user.name");
                                            String date = rss.getString("booking.date");
                                            String time = rss.getString("booking.time");
                                            String price = rss.getString("booking.b_total_price");

                                    %>

                                    <div class="row m-2 text-center" >
                                        <div class="col">
                                            <h5 class="text-left ">
                                                <p class="text-dark center" >Dear. <%= name%> your water tanker will arrive at <%= date%> at <%= time%>, your total cost is Rs.<%= price%>.  </p>
                                            </h5>
                                            <script src="https://www.paypal.com/sdk/js?client-id=AaGPDbS6gpI5fF2ANVrhk3s3mNxbFhFNlhPwwiq9gidXEQ0fJog__UNAvFKtIYbSGKVYQN6GN5gnkNQP&currency=USD&disable-funding=credit,card"></script>                  
                                        </div>
                                            <div id="paypal-payement-button">
                                            <h6>Pay with Paypal:</h5>
                                        </div>
                                    </div>
                                    <%}%>
                                </form>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>        
                                <script src="js/paypal.js" type="text/javascript"></script>
        <jsp:include page="footer.jsp"/>
    </body>
</html>

