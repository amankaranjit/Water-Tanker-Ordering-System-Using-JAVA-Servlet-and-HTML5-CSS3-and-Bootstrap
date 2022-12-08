<%-- 
    Document   : ViewTanker
    Created on : Mar 14, 2022, 11:00:54 PM
    Author     : Aman Karanjit
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.watertanker.database.JDBCConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
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
                <div class="row">
                    <!-- FORM Panel -->

                    <div class="col-md-7 ">
                        <div class="card ">
                            <div class="card-body">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                        <tr>                                           

                                            <th class="text-center">Name</th>
                                            <th class="text-center">Capacity</th>                                            
                                            <th class="text-center">Price</th>  
                                            <th class="text-center">Status</th> 
                                            <th class="text-center">Operation</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            Connection cn = JDBCConnection.getConnection();
                                            String squery = "select * from tanker join category where tanker.category_id = category.id";
                                            PreparedStatement stmt = cn.prepareStatement(squery);
                                            ResultSet rs = stmt.executeQuery(squery);
                                            while (rs.next()) {
                                        %>

                                        <%
                                            int t_id = rs.getInt("id");
                                            String tanker_name = rs.getString("tanker_name");
                                            String category_name = rs.getString("category.name");
                                            int price = rs.getInt("category.price");
                                            int status = rs.getInt("status");
                                            String statusInString = "";
                                            if (status == 0) {
                                                statusInString = "Avaliable";
                                            } else {
                                                statusInString = "Unvaliable";
                                            }
                                        %>
                                        <tr>                            
                                            <td class="text-center">
                                                <p class="text-capitalize"> <b><%= tanker_name%></b></p>
                                            </td>

                                            <td class="text-center">
                                                <p class="text-capitalize"> <b><%= category_name%></b></p>
                                            </td>
                                            <td class="text-center">
                                                <p class="text-capitalize"> <b><%= price%></b></p>
                                            </td>
                                            <td class="text-center">
                                                <p class="text-capitalize"> <b><%= statusInString%></b></p>
                                            </td>
                                            <td class="text-center">
                                                <a href="DeleteTanker.jsp?id=<%=rs.getString("id")%>" onclick="alertmsg()" class="btn btn-danger">Delete</a>
                                            </td>
                                        </tr>
                                        <%}%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <script>
                    function alertmsg() {
                        alert('Do you want to delete this tanker?');
                    }
                </script>
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
