<!doctype html>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.watertanker.database.JDBCConnection"%>
<%@page import="com.watertanker.database.JDBCConnection"%>
<%@page import="java.sql.Connection"%>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

        <title>Hello, world!</title>
        <style>
            .album{
                background-color: #6d9270;
            }
            .btn{
                color:white;
            }
        </style>
    </head>  
    <body>
        <main role="main">
            <div class="album py-5 ">
                <div class="container">
                    <h2 class="text-center p-3 text-white">Tanker Avaliable</h2>

                    <div class="row text-dark">   
                        <%
                            Connection cn = JDBCConnection.getConnection();
                            String query = "select * from tanker join category where tanker.category_id = category.id";
                            PreparedStatement stmt = cn.prepareStatement(query);
                            ResultSet rs = stmt.executeQuery(query);
                            while (rs.next()) {
                        %>
                        <div class="col-md-4 ">
                            <div class="card mb-4 bg-light   ">

                                <img class="card-img-top"  src="image/tank.png" alt="Card image cap">
                                <div class="card-body px-3 py-3">


                                    <%
                                        int t_id = rs.getInt("id");
                                        String t_name = rs.getString("tanker_name");
                                        String t_liter = rs.getString("category.name");
                                        String t_price = rs.getString("category.price");
                                        int status = rs.getInt("status");

                                    %>
                                    Name: <%= t_name%><br>
                                    Capacity: <%= t_liter%><br>
                                    Price: Rs.<%= t_price%><br>
                                    <% if (status == 0) {%>
                                    Status: Avaliable<br>
                                    <%} else {%>
                                    Status: Unavaliable 
                                    <%}%> 

                                    <% if (status == 0) {%>
                                    <%
                                        Object name = session.getAttribute("s_name");
                                        if (name == null) {%>

                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group">
                                            <button onclick="alertmsg()" type="button" class="btn btn-sm btn-outline-secondary   mt-2"><a style="font-size:15px;" href="login.jsp" class="text-decoration-none text-dark">Order Now</a></button>
                                        </div>
                                    </div>
                                    <% } else {%>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-sm btn-outline-secondary   mt-2"><a style="font-size:15px;" href="booking.jsp?id=<%= t_id%>" class="text-decoration-none text-dark">Order Now</a></button>
                                        </div>
                                    </div>
                                    <%}%>
                                    <%} else {%>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group">
                                            <button type="button" class="btn  btn-sm btn-outline-secondary   mt-2"><a style="font-size:15px; color:red" href="" class="text-decoration-none text-dark">Already Booked</a></button>
                                        </div>
                                    </div>

                                    <%}%>


                                </div>
                            </div>

                        </div>
                        <%
                            }
                        %>
                    </div>

                </div>
            </div>

        </main>

        <script>
            function alertmsg() {
                alert("Please Login First");
            }
        </script>
        <!-- Optional JavaScript; choose one of the two! -->

        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

        <!-- Option 2: Separate Popper and Bootstrap JS -->
        <!--
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
        -->
    </body>
</html>