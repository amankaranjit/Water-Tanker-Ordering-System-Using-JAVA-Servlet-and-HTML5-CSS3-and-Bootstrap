<%-- 
    Document   : ManageUsers
    Created on : Mar 10, 2022, 9:06:40 PM
    Author     : Aman Karanjit
--%>
<%-- 
    Document   : AddTanker
    Created on : Mar 10, 2022, 12:52:31 PM
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
            <div class=" mt-2" style="margin-left: 100px;">

                <!-- Table Panel -->
                <div class="col-md-10 " style="margin-left: 50px">
                    <div class="card ">
                        <div class="card-body">
                            <table class="table table-bordered table-hover">
                                <thead>
                                    <tr>                                           
                                        <th class="text-center">Name</th>
                                        <th class="text-center">Email</th>                                            
                                        <th class="text-center">Address</th>    
                                        <th class="text-center">Contact</th> 
                                        <th class="text-center">Operation</th>
                                        <!--<th class="text-center">Booking Date</th>-->                                            

                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        Connection cn = JDBCConnection.getConnection();
                                        String query = "select * from user";
                                        PreparedStatement stmt = cn.prepareStatement(query);
                                        ResultSet rs = stmt.executeQuery(query);
                                        while (rs.next()) {
                                    %>

                                    <%
                                        int id = rs.getInt("id");
                                        String name = rs.getString("name");
                                        String email = rs.getString("email");
                                        String address = rs.getString("address");
                                        String contact = rs.getString("contact");
//                                            int t_status = rs.getInt("t_status");
//                                            String date = rs.getString("date");
//                                            Blob img = rs.getBlob("cover_img");

                                    %>


                                    

                                        <td class="text-center">
                                            <p class="text-capitalize"> <b><%= name%></b></p>
                                        </td>

                                        <td class="text-center">
                                            <p class="text"> <b><%= email%></b></p>
                                        </td>
                                        <td class="text-center">
                                            <p class="text-capitalize"> <b><%= address%></b></p>
                                        </td>
                                        
                                        <td class="text-center">
                                            <p class="text-capitalize"> <b><%= contact%></b></p>
                                        </td>
                                        <td class="text-center">
                                            <a href="DeleteUsers.jsp?id=<%=rs.getString("id")%>" class="btn btn-danger">Delete</a>
                                            <a href="EditUsers.jsp?id=<%=rs.getString("id")%>" class="btn btn-primary">Edit</a>                                           
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
    </div>



    <script type="text/javascript">
        function validationForm() {
            let a = document.forms['myForm']["name"].value;
            let c = document.forms['myForm']["price"].value;
            let d = document.forms['myForm']["image"].value;


            if (a === "" || c === "" || d === "") {
                alert("Fields must be filled out");
                return false;
            }

        }
    </script>
</body>

</html>
