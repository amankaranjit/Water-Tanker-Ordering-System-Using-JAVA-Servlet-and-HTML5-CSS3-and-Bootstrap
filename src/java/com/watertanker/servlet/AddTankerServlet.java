package com.watertanker.servlet;

import com.watertanker.database.JDBCConnection;
import java.io.IOException;
import java.nio.file.Paths;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.ParseException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;

public class AddTankerServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();
        try {

            Connection cn = JDBCConnection.getConnection();
            String t_name = request.getParameter("tanker_name");
            String t_number = request.getParameter("tanker_number");
//            String t_price = request.getParameter("t_price");
            String ccategory_id = request.getParameter("category_id");
            int category_id = Integer.parseInt(ccategory_id);
            String insertQuery = "INSERT INTO tanker(tanker_name,category_id,tanker_number) values(?,?,?)";
            PreparedStatement stmt = cn.prepareStatement(insertQuery);

            stmt.setString(1, t_name);
            stmt.setInt(2, category_id);
            stmt.setString(3, t_number);

            stmt.execute();

            response.sendRedirect("ViewTanker.jsp");
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

}
