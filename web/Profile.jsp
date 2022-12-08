<%-- 
    Document   : Profile.jsp
    Created on : May 23, 2022, 10:45:12 AM
    Author     : Rishan Dash
--%>
<%@page import="com.watertanker.database.JDBCConnection"%>
<%@page import="java.sql.Statement"%>

<!doctype html>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <link href="assets/stylesheet/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Profile Page</title>

        <link rel="icon" href="image/tanker.png" type="image/icon type">
        <!--Bootstrap Css-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>
    <body>
        <style>
            .navbar{
                background-color: rgb(21, 172, 231);
                height: 70px;

            }
            .navbar a{
                color: white;
            }
            .navbar .mid{
                margin-left: 250px;
            }


        </style>
    </head>
<body>
    <div><%@include file="navbar.jsp" %></div>
    <%
        Object user_id = session.getAttribute("s_id");
    %>
    <%
        Connection cn = JDBCConnection.getConnection();
    %>


    <div class="album ">
        <div class="container ">


            <div class="row " style="width:390px; float: left; margin-top: 50px;">
                <div class="col">
                    <div class="card bg-light mb-2">
                        <%
                            Statement stmt = cn.createStatement();
                            ResultSet rs = stmt.executeQuery("select * from user where id = '" + user_id + "'");
                            while (rs.next()) {
                                String user_name = rs.getString("name");
                                String contact = rs.getString("contact");
                                String email = rs.getString("email");
                        %>
                        <form action="UpdateProfileServlet" method="post" onsubmit="return validateForm()">
                            <div class="row m-3">
                                <div class="col">
                                    <label>Full Name</label>
                                    <input type="text" class="form-control" placeholder="" name="full_name" value="<%= user_name%>" required>
                                </div>
                                <div class="col">
                                    <label>Contact</label>
                                    <input type="text" class="form-control" placeholder="" name="contact" value="<%= contact%>" required>
                                </div>
                            </div>
                            <div class="row m-3">

                                <div class="col">
                                    <label>Email</label>
                                    <input type="text" class="form-control" name="email" value="<%= email%>"  required readonly/>

                                </div>
                            </div>
                            <div class="">
                                <div class="btn-group px-6 mb-2">

                                    <button type="submit" class="btn px-3 btn-secondary" style="margin-left: 35px;">Update</button>
                                </div>
                            </div>

                        </form>
                        <% }%>

                    </div>
                </div>

            </div><!-- profile div ends -->

            <div class="row " style="width:740px; float: right; margin-top: 50px;">
                <div class="col">
                    <div class="card bg-light mb-2">
                        <h3 class="font-weight-bold text-center">Recent Booking</h3>
                        <table class="table">
                            <thead class="thead-dark">
                                <tr align="center" >
                                       <th scope="col">Tanker Name</th>
                                    <th scope="col">Delivery Date</th>
                                    <th scope="col">Delivery Time</th>
                                    <th scope="col">Total Price</th>                                 
                                    <th scope="col">Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    String query = "select * from booking join user on booking.user_id = user.id join tanker on booking.tanker_id = tanker.id where user.id = '" + user_id + "'";
                                    PreparedStatement pstmt = cn.prepareStatement(query);
                                    ResultSet rss = pstmt.executeQuery(query);
                                    while (rss.next()) {
                                    String tankerName = rss.getString("tanker.tanker_name");
                                    String time = rss.getString("booking.time");
                                        String price = rss.getString("booking.b_total_price");
                                        String datein = rss.getString("booking.date");
                                        int status = rss.getInt("booking.status");

                                %>
                                <tr>
                                    <td class="text-center"><b><%= tankerName%></td>                                    
                                    <td class="text-center"><b><%= datein%></td>
                                   <td class="text-center"><b><%= time%></td>
                                    <td class="text-center"><b>Rs.<%= price%></td>
                                  
                                    <td class="text-center">
                                        <% if (status == 0) {%>
                                        <span class="badge badge-danger bg-secondary    ">Pending</span>
                                        <% } else if (status == 1) {%>
                                        <span class="badge badge-primary bg-primary">Accepted</span>

                                        <%} else if (status == 2) {%>
                                        <span class="badge badge- bg-danger">Queued</span>
                                        <%} else {%>
                                        <span class="badge badge- bg-secondary">Checkout</span>
                                        <% } %>
                                    </td>
                                </tr>

                                <% }%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </div>




</body>
</html>


