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

public class MailSenderServlet extends HttpServlet {

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
                while (rs.next()) {
                    String email = rs.getString("user.email");
//                    out.print(email);
                   
                    String fullName = rs.getString("user.name");
                    String tanker_no = rs.getString("tanker.tanker_number");
                    int totalPrice = rs.getInt("booking.b_total_price");

                    String datein = rs.getString("booking.date");
                    String time = rs.getString("booking.time");
                    String category = rs.getString("category.name");
                    final String emailSubject = "Booking accepted!!!";
                    final String emailMessage = "<p>Hi <b>" + fullName + "</b>,</p><br/>Your Water tanker <b>" + tanker_no + "</b>(" + category + ") have been "
                            + " successfully booked for <b>" + datein + "</b> at <b>" + time + " <b> for Rs." + totalPrice + "</b>. ";
//                    out.print(emailMessage);
                    boolean status = EmailSender.sendMail(email, emailSubject, emailMessage);
                    if (status == true) { 
                       
                        stmt.executeUpdate("update booking, tanker set booking.status = 1, tanker.status = 1 where booking.tanker_id = tanker.id  and booking.id= '" + id + "'");
                        response.sendRedirect("adminBooking.jsp");
                    }

                }

            } catch (SQLException ex) {
                Logger.getLogger(MailSenderServlet.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
    }

}
