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
        <!--<img src="image/logo.jpg" alt=""/>-->
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

        <title>Hello, world!</title>
        <style>
            .album{
                background-color: #6d9270;
            }
        </style>
    </head>  
    <body>
        <main role="main">
            <div class="album py-5 ">
                <div class="container">
                    <h2 class="text-center p-3 text-white">Tanker Avaliable</h2>

                    <div class="row">   
                        <%
                            Connection cn = JDBCConnection.getConnection();
                            String query = "select * from tanker";
                            PreparedStatement stmt = cn.prepareStatement(query);
                            ResultSet rs = stmt.executeQuery(query);
                            while (rs.next()) {
                        %>
                        <div class="col-md-4 ">
                            <div class="card mb-4 bg-secondary text-light  ">

                                <img class="card-img-top"  src="image/logo.jpg" alt="Card image cap">
                                <div class="card-body">


                                    <%
                                        int t_id = rs.getInt("t_id");
                                        String t_name = rs.getString("t_name");
                                        String t_liter = rs.getString("t_liter");
                                        String t_price = rs.getString("t_price");

                                    %>
                                    Name: <%= t_name%><br>
                                    Capacity: <%= t_liter%>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="btn-group">
                                            <button type="button" class="btn btn-sm  btn-outline-light mt-2">View</button>
                                        </div>
                                    </div>

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