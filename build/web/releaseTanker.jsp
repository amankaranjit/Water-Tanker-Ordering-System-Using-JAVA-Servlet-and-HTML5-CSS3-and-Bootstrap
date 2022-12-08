<%-- 
    Document   : Booking
    Created on : Mar 10, 2022, 12:52:22 PM
    Author     : Aman Karanjit
--%>
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
        <div>
            <%@include file="adminnav.jsp" %>
        </div>
        
        <div class="row">
            <div class="col-3">
                <%@include file="sidebar.jsp" %>
            </div>
            <div class="col-9 mt-2">

                <!-- Table Panel -->
                <div class="col-md-9 pr-2">
                    <div class="card ">
                        <div class="card-body">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>                                           
                                        <!--<th class="text-center">ID</th>-->                                          
                                        <th class="text-center">Name</th>
                                        <th class="text-center">Tanker Number</th>                                            
                                        <th class="text-center">Date</th> 
                                        <th class="text-center">Total Price</th>
                                        <th class="text-center">Action</th>                                            

                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        Connection cn = JDBCConnection.getConnection();
                                        String query = "select * from booking join user on booking.user_id = user.id join tanker on booking.tanker_id = tanker.id where tanker.status=1";
                                        PreparedStatement stmt = cn.prepareStatement(query);
                                        ResultSet rs = stmt.executeQuery(query);
                                        while (rs.next()) {
                                    %>

                                    <%
                                        int id = rs.getInt("tanker.id");
                                        String name = rs.getString("user.name");
                                        String tanker_number = rs.getString("tanker.tanker_number");
                                        String date = rs.getString("booking.date");
                                        int price = rs.getInt("booking.b_total_price");

                                    %>


                                    <tr>   
<!--                                        <td class="text-center">
                                            <p class="text-capitalize"> <b><%= id%></b></p>
                                        </td>-->
                                        <td class="text-center">
                                            <p class="text-capitalize"> <b><%= name%></b></p>
                                        </td>

                                        <td class="text-center">
                                            <p class="text-capitalize"> <b><%= tanker_number%></b></p>
                                        </td>

                                        <td class="text-center">
                                            <p class="text"> <b><%= date%></b></p>
                                        </td>
                                        <td class="text-center">
                                            <p class="text-capitalize"> <b><%= price%></b></p>
                                        </td>

                                        <td class="text-center">
                                            <a href="releaseButton.jsp?id=<%=rs.getInt("tanker.id")%>" class="btn btn-primary">Release</a>                                          
                                        </td>
                                    </tr>
                                    <%}%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- Table Panel -->
            </div>


        </div>
    </body>
</html>
