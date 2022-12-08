<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.watertanker.database.JDBCConnection"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

        <title>Book Now</title>
    </head>
    <body class="bg-light">
        <%
            Object s_id = session.getAttribute("s_id");
        %>
        <jsp:include page="navbar.jsp"/>
        <div class="m-5  ">
            <form method="post" action="bookingServlet">

                <%
                    String t_id = request.getParameter("id");
                    int id = Integer.parseInt(t_id);
                    Connection cn = JDBCConnection.getConnection();
                    String query = "SELECT * from tanker INNER JOIN category ON tanker.category_id=category.id where tanker.id='" + id + "'";
                    PreparedStatement stmt = cn.prepareStatement(query);
                    ResultSet rs = stmt.executeQuery(query);
                    while (rs.next()) {
                        String tanker_name = rs.getString("tanker.tanker_name");
                        int tanker_price = rs.getInt("category.price");
                        String category_name = rs.getString("category.name");

                %>
                <input type="hidden" value="<%= s_id%>" name="user_id" />
                <input type="hidden" value="<%= id%>" name="tanker_id" />
                <div class="form-group">
                    <label for="exampleInputEmail1">Tanker Name</label>
                    <input type="text" class="form-control" name ="tanker_name" aria-describedby="emailHelp" placeholder="" value="<%= tanker_name%>" readonly/>                  
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Delivery Date</label>
                    <input type="date" class="form-control date_picker" placeholder="" name="date" minDate =" 0 "  required>

                    <!--<input type="date" id="delivery_date" class="form-control date_picker" name="date" required >-->
                </div>
                <div>
                    <label for="exampleInputPassword1">Delivery Time</label>
                    <input type="time" class="form-control" min="timeofNow()" name="time" required>
                </div>  
                <div class="form-group">
                    <label for="exampleInputPassword1">Price</label>
                    <input type="text" class="form-control" name="price" placeholder="" value="<%= tanker_price%>" readonly/>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Category</label>
                    <input type="text" class="form-control" id="exampleInputPassword1" placeholder="" value="<%= category_name%>" readonly/>
                </div>
                <button type="submit" class="btn btn-primary">Book</button>

                <%  }%>
            </form>
            <script>
                let today = new Date();
                let dd = String(today.getDate()).padStart(2, '0');
                let mm = String(today.getMonth() + 1).padStart(2, '0');
                let yyyy = today.getFullYear();

                today = yyyy + '-' + mm + '-' + dd;
                $('.date_picker').attr('min', today);
            </script>
            <script src="js/bootstrap.min.js" type="text/javascript"></script>
        </div>
        <div class="mar">
            <jsp:include page="footer.jsp"/>
        </div>
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>