<%-- 
    Document   : AddCategory
    Created on : Mar 14, 2022, 9:26:51 PM
    Author     : Aman Karanjit
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.watertanker.database.JDBCConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Category</title>
        <style>
            .control-label{
                color:black;
            }
            .form-group > input{
                width: 100%;
            }
        </style>
    </head>
    <body>
        <div><!<!-- navbartop start -->
            <%@include file="adminnav.jsp" %>
        </div><!-- navbartop ends -->

        <div class="row">
            <div class="col-3">

                <%@include file="sidebar.jsp" %>
            </div>
            <div class="col-9 mt-2">
                <div class="row">
                    <!-- FORM Panel -->
                    <div class="col-md-4 ">
                        <form action="CategoryServlet"  method="post" onSubmit="validationForm();">
                            <div class="card">
                                <div class="card-header">
                                    Add Category
                                </div>
                                <div class="card-body">
                                    <input type="hidden" name="id">
                                    <div class="form-group">
                                        <label class="control-label">Enter Capacity (In Gallons)</label>
                                        <input type="text" class="form-control"  onkeypress="return isNumberKey(event)" maxlength="10" name="name" required>                                        
                                    </div>

                                    <div class="form-group">
                                        <label class="control-label">Enter Price</label>
                                        <input type="text" class="form-control"  onkeypress="return isNumberKey(event)" maxlength="10" name="price" placeholder="Rs." required>                                        
                                    </div>

                                </div>
                                <script>
                                    function isNumberKey(evt)
                                    {
                                        var charCode = (evt.which) ? evt.which : event.keyCode
                                        if (charCode > 31 && (charCode < 48 || charCode > 57))
                                            return false;

                                        return true;
                                    }
                                </script>
                                <div class="card-footer">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <button class="btn btn-sm btn-primary col-sm-3 offset" type="submit" onclick="alertmsg()"> Add</button>                                          
                                            <script>
                                                function alertmsg(){
                                                    alert('Category added successfully.');
                                                }
                                            </script>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>         
                    <div class="col-7  pr-2">
                        <div class="card ">
                            <div class="card-body">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                        <tr>                                           
                                            <th class="text-center">Category</th>                                            
                                            <th class="text-center">Price</th>   
                                            <th class="text-center">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            Connection cn = JDBCConnection.getConnection();
                                            String query = "select * from category";
                                            PreparedStatement stmt = cn.prepareStatement(query);
                                            ResultSet rs = stmt.executeQuery(query);
                                            while (rs.next()) {
                                        %>

                                        <%
                                            String name = rs.getString("name");
                                            int price = rs.getInt("price");
                                        %>


                                        <tr>                            
                                            <td class="text-center">
                                                <p class="text-capitalize"><b><%= name%> Gallons</b></p>
                                            </td>

                                            <td class="text-center">
                                                <p class="text-capitalize"> <b>Rs. <%= price%></b></p>
                                            </td>
                                            <td class="text-center">
                                                <a href="Delete.jsp?id=<%=rs.getString("id")%>" class="btn btn-danger" onclick="deletemsg()">Delete</a>                                        
                                            </td>
                                    <script>
                                        function deletemsg() {
                                            alert('Do you want to delete this category?');
                                        }
                                    </script>
                                    </tr>
                                    <%}%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
