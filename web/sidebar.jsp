<%-- 
    Document   : adminSidebar
    Created on : Mar 5, 2022, 3:57:20 PM
    Author     : Aman Karanjit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link rel="icon" href="../image/logo.jpg" type="image/icon type">
        <!--<title>JSP Page</title>-->
        <style>
            .pos{
                position: fixed;
                left: 0;
            }
        </style>
    </head>
    <body>


        <div class="d-flex pos flex-column flex-shrink-0 p-3 text-white bg-dark position-fixed" style="width: 150px; height: 100%">

            <hr>
            <ul class="nav nav-pills flex-column mb-auto listed">

                <li>
                    <a href="AddCategory.jsp" class="nav-link text-white">                      
                        Add Category
                    </a>
                </li>
                <li>
                    <a href="AddTanker.jsp" class="nav-link text-white">                      
                        Add Tanker
                    </a>
                </li>             
                <li>
                    <a href="ViewTanker.jsp" class="nav-link text-white">                      
                        View Tanker
                    </a>
                </li> 
                <li>
                    <a href="adminBooking.jsp" class="nav-link text-white">                       
                        Bookings
                    </a>
                </li>
<!--                  <li>
                    <a href="queued.jsp" class="nav-link text-white">                       
                        Queued
                    </a>
                </li>-->
                <li>
                    <a href="releaseTanker.jsp" class="nav-link text-white">                       
                        Release Tanker                    
                    </a>
                </li>
                <li>
                    <!--<a href="ManageUsers.jsp"></a>-->
                    <a href="ManageUsers.jsp" class="nav-link text-white">                       
                        Users
                    </a>
                </li>
            </ul>
            <hr>

        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
</html>