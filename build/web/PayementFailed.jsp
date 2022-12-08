<%-- 
    Document   : PayementSuccessfull
    Created on : Mar 18, 2022, 10:01:03 PM
    Author     : Aman Karanjit
--%>

<%@page import="com.watertanker.database.JDBCConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <jsp:include page="navbar.jsp"/>
        <%
            Connection conn = JDBCConnection.getConnection();
            Statement st = conn.createStatement();
            ResultSet rs = null;
        %>
        <%
            Object u_id = session.getAttribute("s_id");
        %>
        <%
            int dbvehicle_id = 0;
            int dbuser_id = 0;
            int db_booking_id = 0;
            Connection cn = JDBCConnection.getConnection();
            Statement stmt = cn.createStatement();
            ResultSet rss = stmt.executeQuery("select * from booking join user where booking.id = user.id and user.id = '" + u_id + "' order by booking.id desc limit 1");
            while (rss.next()) {
                db_booking_id = rss.getInt("b_id");
                dbvehicle_id = rss.getInt("s_id");
                dbuser_id = rss.getInt("u_id");

        %>       
        <% }
            stmt.executeUpdate("DELETE FROM booking where id ='" + db_booking_id + "'");
            System.out.println("Booking is deleted due to payment failure");
        %>
        <div class="center mt-4" style=" margin-bottom:25px;">
            <!--<img src="assets/img/success.png" class="img-center" height="300px;" alt=""/>-->         
            <div class="center bg-info text-light" style="width: 500px;">                
                <img src="image/paypallogo.png" alt="Paris" class="img-center" style="width: 50%">
                <h4 class="text-center text-light mt-2">Booking Failed</h4>                

                <h5 class="text-center text-light mt-2 p-3">Dear user your booking is failed due to unsuccessful payment, please try again.</h5>  

                <button class="btn text-light mt-2" style="background-color:darkblue;margin-left: 75px; border-radius: 30px; width:340px; "><a href="Profile.jsp" class="text-light"> Visit Profile</a></button>                                          
            </div>

        </div>
        <div class="footer">
            <jsp:include page="footer.jsp"/>

        </div>
    </body>
</html>
