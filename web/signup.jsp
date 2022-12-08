<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

        <link rel="icon" href="image/tanker.png" type="image/icon type">
        <title>Sign Up Page </title>
        <link href="css/signup.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>    <jsp:include page="navbar.jsp"/>

        <div class="container" style="margin-bottom: 70px;">

            <div class="row justify-content-center ">
                <div class="col-md-5">
                    <div class="card">
                        <h2 class="card-title text-center">Register</h2>
                        <div class="card-body py-md-4">
                            <form _lpchecked="1" action="SignUpServlet" method="post">
                                <div class="form-group">
                                    <input type="text" class="form-control" id="name" placeholder="Name" name="name" required>
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control" id="email" placeholder="Email" name="email" required>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" id="contact" placeholder="Contact" onkeypress="return isNumberKey(event)" maxlength="10" name="contact" required>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" id="address" placeholder="Addresss"name="address" required>
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" id="password" placeholder="Password" name="password"  maxlength="10" required>
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-control" id="confirm-password" placeholder="Confirm-password" name="cpassword"  maxlength="10" required>
                                </div>
                                <div class="d-flex flex-row align-items-center justify-content-between">
                                    <a href="login.jsp" class="text-decoration-none">Login</a>
                                    <input type="submit" class="btn btn-primary" onclick="alertmsg()" value="Register"/>
                                </div>
                            </form>
                            <script>
                                function alertmsg() {
                                    alert("Sign Up Successfull");
                                }
                                function isNumberKey(evt)
                                {
                                    var charCode = (evt.which) ? evt.which : event.keyCode
                                    if (charCode > 31 && (charCode < 48 || charCode > 57))
                                        return false;

                                    return true;
                                }
                            </script>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="mt-3">
            <jsp:include page="footer.jsp"/>    
        </div>

    </body>
</html>