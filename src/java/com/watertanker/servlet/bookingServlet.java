package com.watertanker.servlet;

import com.watertanker.database.JDBCConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class bookingServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Connection cn = JDBCConnection.getConnection();
        String tanker_id = request.getParameter("tanker_id");

        int t_id = Integer.parseInt(tanker_id);

        String user_id = request.getParameter("user_id");
        int u_id = Integer.parseInt(user_id);

       

        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String t_price = request.getParameter("price");
        int price = Integer.parseInt(t_price);

        String insertQuery = "insert into booking(tanker_id,date,time,user_id,b_total_price) values(?,?,?,?,?)";
        PreparedStatement stmt;
        try {
            stmt = cn.prepareStatement(insertQuery);
            stmt.setInt(1, t_id);
            stmt.setString(2, date);
            stmt.setString(3, time);
            stmt.setInt(4, u_id);
            stmt.setInt(5, price);
            stmt.execute();
            response.sendRedirect("cartPage.jsp");
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

}
