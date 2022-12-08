package com.watertanker.servlet;

import com.watertanker.database.JDBCConnection;
import com.helper.EmailSender;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class queueBookingServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {

            Connection conn = JDBCConnection.getConnection();

            String userid = request.getParameter("id");
            int id = Integer.parseInt(userid);

            Statement stmt;

            try {
                stmt = conn.createStatement();

                String query = "select * from booking join user on booking.user_id = user.id"
                        + " join tanker on booking.tanker_id = tanker.id join category on tanker.category_id = category.id where booking.id = '" + id + "'";

                PreparedStatement preparedstmt;
                preparedstmt = conn.prepareStatement(query);
                ResultSet rs = preparedstmt.executeQuery();

                stmt.executeUpdate("update booking, tanker set booking.status = 3, tanker.status = 0 where booking.tanker_id = tanker.id  and booking.id= '" + id + "'");
                response.sendRedirect("adminBooking.jsp");
            } catch (SQLException ex) {
                Logger.getLogger(MailSenderServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
    }

}
