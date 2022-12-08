<%-- 
    Document   : AddTanker
    Created on : Mar 10, 2022, 12:52:31 PM
    Author     : Aman Karanjit
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.watertanker.database.JDBCConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--<link rel="icon" href="../image/logo.jpg" type="image/icon type">-->
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
                    <div class="col-md-4 ">
                        <div class="card-header">
                            Edit Users
                        </div>

                        <div class="card">
                            <div class="card-body">
                                <%
                                    String userid = request.getParameter("id");

                                    int id = Integer.parseInt(userid);
//                                    System.out.println(id);
                                    Connection cn = JDBCConnection.getConnection();
                                    String query = "select * from user where id  = '" + id + "'";
                                    PreparedStatement stmt = cn.prepareStatement(query);
                                    ResultSet rs = stmt.executeQuery(query);
                                    while (rs.next()) {
                                        String name = rs.getString("name");
                                        String email = rs.getString("email");
                                        String address = rs.getString("address");

                                        String contact = rs.getString("contact");
//                                        System.out.println(name);

                                %>
                                <form method="post" action="EditUsers">
                                    <input type="hidden" name="id" value="<%= id%>">
                                    <div class="form-group">
                                        <label class="control-label">Enter  Name</label>
                                        <input type="text" class="form-control" name="name" value="<%= name%>" required>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">Enter Email</label>
                                        <input type="email" class="form-control" name="email" value="<%=email%>" required>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">Enter Address</label>
                                        <input type="text" class="form-control" name="address" value="<%= address%>" required>

                                    </div>
                             

                                    <div class="form-group">
                                        <label class="control-label">Contact</label>
                                        <input type="text" class="form-control" name="address" value="<%= contact%>" required>

                                    </div>

                                    <div class="card-footer">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <input type="submit" class="btn btn-sm btn-primary col-sm-3 offset" value="Edit"> 
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                <%    }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- FORM Panel -->
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
