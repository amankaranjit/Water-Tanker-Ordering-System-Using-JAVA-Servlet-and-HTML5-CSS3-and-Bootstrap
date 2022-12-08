<!doctype html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <style>
            .newnav {
                margin-left: 155px;
            }

            .login {
                margin-left: 300px;
            }
        </style>
        <title>Welcome to Water Tanker Service</title>
    <!--<img src="image/tanker.png" alt=""/>-->
        <link rel="icon" href="image/tanker.png" type="image/icon type">
    </head>

    <body>
        <%
            Object name = session.getAttribute("s_name");
            if (name == null) {
        %>
        <nav class="navbar navbar-expand-lg navbar-light bg-secondary px-5 ">
            <div class="container-fluid ">
                <a class="navbar-brand py-2 text-light" href="#">
                    <img src="image/tanker.png" width="95" height="55"> Water Tanker Service
                </a>

                <div class="collapse navbar-collapse  newnav">
                    <div class="navbar-nav  ">
                        <a class="nav-link active text-light px-5" aria-current="page" href="index.jsp">Home</a>
                        <a class="nav-link active text-light px-3" href="aboutus.jsp">About Us</a>
                        <!--<a class="nav-link active text-light px-3" href="#">Service</a>-->                    
                        <a class="nav-link active text-light px-4 login" href="login.jsp" >Login</a>
                        <a class="nav-link active text-light px-4 signup" href="signup.jsp">Signup</a>
                    </div>
                </div>
            </div>
        </nav>
        <%} else {%>
        <nav class="navbar navbar-expand-lg navbar-light bg-secondary px-5 ">
            <div class="container-fluid ">
                <a class="navbar-brand py-2 text-light" href="#">
                    <img src="image/tanker.png" width="95" height="55"> Water Tanker Service
                </a>

                <div class="collapse navbar-collapse  newnav">
                    <div class="navbar-nav  ">
                        <a class="nav-link active text-light px-5" aria-current="page" href="index.jsp">Home</a>
                        <a class="nav-link active text-light px-3" href="aboutus.jsp">About Us</a>                                                
                        <a class="nav-link active text-light" style="padding-left: 350px" href="Profile.jsp" ><%= name%></a>
                        <a class="nav-link active text-light px-4" href="Logout.jsp" >Logout</a>
                    </div>
                </div>
            </div>
        </nav>
        <%}%>
        <!-- Option 1: Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

        <!-- Option 2: Separate Popper and Bootstrap JS -->
        <!--
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
        -->
    </body>

</html>