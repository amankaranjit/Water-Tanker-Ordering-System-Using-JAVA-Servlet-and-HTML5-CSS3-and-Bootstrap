<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <title>Admin Login Page</title>
        <link rel="icon" href="image/tanker.png" type="image/icon type">
        <link href="css/signup.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>    
        <jsp:include page="navbar.jsp"/>

        <div class="container mb-5 ">

            <div class="row justify-content-center">
                <div class="col-md-5">
                    <div class="card">
                        <h2 class="card-title text-center">Admin Login</h2>
                        <div class="card-body py-md-4">
                            <form _lpchecked="1" method="post" action="AdminLoginServlet">

                                <div class="form-group">
                                    <input type="email" class="form-control" id="email" placeholder="Email" name="email" required>
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" id="password" placeholder="Password" name="password" required>
                                </div>
                                <div class="d-flex flex-row align-items-center justify-content-between">
                                    <!--<a href="#">Login</a>-->
                                    <input type="submit" class="btn btn-primary" onclick="alertmsg()">                                    
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function alertmsg() {
                alert("Admin Login Successful!!");
            }
        </script>
        <jsp:include page="footer.jsp"/>
    </body>
</html>