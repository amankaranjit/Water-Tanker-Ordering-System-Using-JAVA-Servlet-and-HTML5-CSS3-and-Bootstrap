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
            <div class="col-9 mt-2">
                <div class="row">
                    <!-- FORM Panel -->
                    <div class="col-md-6 mt-2 ">
                        <form action="AddTankerServlet"  method="post" onSubmit="validationForm();">
                            <div class="card">
                                <div class="card-header">
                                    Add Tanker
                                </div>
                                <div class="card-body">
                                    <!--<input type="hidden" name="id">-->
                                    <div class="form-group">
                                        <label class="control-label">Enter Tanker Name</label>
                                        <input type="text" id="fullName"  onkeyup ="fullNameValidate()" class="form-control" name="tanker_name" required>
                                        <span id="fullNameMsg"></span>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">Enter Tanker Number</label>
                                        <input type="text" class="form-control" name="tanker_number" required>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">Enter Capacity</label>
                                        <select class="custom-select browser-default" name="category_id">

                                            <%
                                                Connection con = JDBCConnection.getConnection();
                                                String query = "select * from category";
                                                PreparedStatement stmtt = con.prepareStatement(query);
                                                ResultSet rss = stmtt.executeQuery(query);
                                                while (rss.next()) {
                                            %>
                                            <option value="<%=rss.getInt("id")%>"><%=rss.getString("name")%> Gallons </option>
                                            <%}%>

                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label">Enter Price</label>
                                        <select class="custom-select browser-default" name="price">
                                            <%
                                                Connection con1 = JDBCConnection.getConnection();
                                                String query1 = "select * from category";
                                                PreparedStatement stmt1 = con1.prepareStatement(query1);
                                                ResultSet rs1 = stmt1.executeQuery(query1);
                                                while (rs1.next()) {
                                            %>
                                            <option value="<%=rs1.getInt("id")%> "> Rs.<%=rs1.getInt("price")%> </option>
                                            <%}%>
                                        </select>

                                    </div>

                                    <div class="card-footer">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <input type="submit" id="btn" class="btn btn-sm btn-primary col-sm-3 offset" onclick="alertmsg()" value="Add"> 
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>

                </div>
                <script>
                    function alertmsg() {
                        alert("Tanker added successfully");
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
        <script src="js/formvalidation.js" type="text/javascript"></script>
    </body>

</html>
