<%-- 
    Document   : PayementSuccessfull
    Created on : Mar 18, 2022, 10:01:03 PM
    Author     : Aman Karanjit
--%>
<%@page import="com.watertanker.database.JDBCConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Connection conn = JDBCConnection.getConnection();
    Statement st = conn.createStatement();
    ResultSet rs = null;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Smart Car Rental</title>
    </head>
    <style>
        .navbar a{
            color: white;
        }
        .navbar .mid{
            margin-left: 250px;
        }
     
        .center{
            margin: auto;
            width: 50%;
            border: 3px solid none;
            padding: 10px;
        }
        .img-center{
            display: block;
            margin-left: auto;
            margin-right: auto;
            width: 50%;
        }
        table tr td{
            border: 1px solid;
            padding:5px;
        }

    </style>
    <body>
        <%
            Object u_id = session.getAttribute("s_id");
        %>
        <jsp:include page="navbar.jsp"/>
        <div>
            <%
                Connection cn = JDBCConnection.getConnection();
                Statement stmt = cn.createStatement();
                ResultSet rss = stmt.executeQuery("select * from booking join user where booking.user_id = user.id and user_id = '" + u_id + "' order by booking.id desc limit 1");
                while (rss.next()) {
                    String s_price = rss.getString("b_total_price");
                    String pickup_date = rss.getString("date");
                    String time = rss.getString("time");                    
                    int price = Integer.parseInt(s_price);
                    String address = rss.getString("address");
                    String uname = rss.getString("user.name");
            %>


        </div>

        <div class="center mt-4" style=" margin-bottom:25px;">
            <!--<img src="assets/img/success.png" class="img-center" height="300px;" alt=""/>-->         
            <div class="center bg-info text-light" style="width: 500px;">
                <h4 class="text-center text-light">Payement Recipt</h4>                
                <img src="image/paypallogo.png" alt="Paris" class="img-center" style="width: 50%">
                <table style="width: 400px;" class="text-center text-light center mt-4">                 


                    <tr>
                        <td>Name</td>
                        <td><%= uname %></td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td><%= address%></td>
                    </tr>
                    <tr>
                        <td>Amount</td>
                        <td>Rs.<%= price%></td>                        
                    </tr>
                    <tr>
                        <td>Payment Status</td>
                        <td ><span class="badge badge-primary" style="font-size: 15px;">Successful</span></td>
                    </tr>
                </table>
                <%
                    }
                %>
                <button class="btn text-light mt-2" style="background-color:darkblue;margin-left: 75px; border-radius: 30px; width:340px; "><a href="Profile.jsp" class="text-light"> Visit Profile</a></button>                                          
            </div>

        </div>
        <div class="footer">
            <jsp:include page="footer.jsp"/>

        </div>
    </body>
</html>
