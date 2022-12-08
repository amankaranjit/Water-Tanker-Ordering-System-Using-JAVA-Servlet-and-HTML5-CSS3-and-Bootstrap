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
            <div class="col-2">
                <%@include file="sidebar.jsp" %>
            </div>
            <div class="col-9 mt-2" style="width: 80%;">
                <div class="row">
                    <!-- Table Panel -->
                    <div class="col-12 ">
                        <div class="card ">
                            <div class="card-body">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th scope="col">Name</th>
                                            <th scope="col">Email</th>
                                            <th scope="col">Delivery Date</th>
                                            <th scope="col">Delivery Time</th>
                                            <th scope="col">Vehicle Name</th>
                                            <th scope="col"> Total Price</th>
                                            <th scope="col">Status</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            Connection cn = JDBCConnection.getConnection();
                                            String query = "select * from booking join user on booking.user_id = user.id join tanker on booking.tanker_id = tanker.id ";
                                            PreparedStatement stmt = cn.prepareStatement(query);
                                            ResultSet rs = stmt.executeQuery(query);

                                            while (rs.next()) {
                                                int booking_id = rs.getInt("booking.id");
                                                int id = rs.getInt("tanker.id");
                                                String email = rs.getString("user.email");
                                                String name = rs.getString("user.name");
                                                String tanker_number = rs.getString("tanker.tanker_number");
                                                String date = rs.getString("booking.date");
                                                int price = rs.getInt("booking.b_total_price");
                                                int status = rs.getInt("booking.status");
                                                String time = rs.getString("booking.time");


                                        %>

                                        <tr>
                                            <td><%= name%></td>
                                            <td><%= email%></td>
                                            <td><%= date%></td>
                                            <td><%= time%></td>
                                            <td><%= tanker_number%></td>
                                            <td>Rs.<%= price%></td>
                                            <%if (status == 0) {%>
                                            <td><span class="badge badge-dark ">Pending</span></td>
                                            <td>
                                                <a href="MailSenderServlet?id=<%=rs.getInt("booking.id")%>"><button type="submit" class="btn btn-primary m-1">Accept</button></a>
                                                <a href="queueBooking.jsp?id=<%= rs.getInt("booking.id")%>"><button type="submit" class="btn btn-success m-1">Queue</button></a>
                                                <a href="rejectBooking.jsp?id=<%= rs.getInt("booking.id")%>"><button type="submit" class="btn btn-danger m-1">Reject</button></a>
                                            </td>
                                            <%} else if (status == 1) {%>
                                            <td ><span class="badge badge-primary">Accepted</span></td>


                                            <%} else if (status == 2) {%>
                                            <td><span class="badge badge-secondary">Queued</span></td>
                                            <td> <a href="MailSenderServlet?id=<%=rs.getInt("booking.id")%>"><button type="submit" class="btn btn-primary m-1">Accept</button></a></td>
                                            <%} else if (status == 3) {%>
                                            <td><span class="badge badge-success">Check out</span></td>

                                            <% } else { %>
                                            <td> <span class="badge badge-danger">Rejected</span></td>

                                            <%}%>
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
        </div>

    </body>
</html>
