package com.watertanker.servlet;

import com.watertanker.database.JDBCConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EditUsers extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Connection cn = JDBCConnection.getConnection();
        String u_id = request.getParameter("id");
        int id = Integer.parseInt(u_id);
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String query = "update user set name = ?, email = ?, address = ? where id = '" + id + "'";
        PreparedStatement preparedStmt;
        try {
            preparedStmt = cn.prepareStatement(query);
            preparedStmt.setString(1, name);
            preparedStmt.setString(2, email);
            preparedStmt.setString(3, address);
            preparedStmt.executeUpdate();
            response.sendRedirect("ManageUsers.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(EditUsers.class.getName()).log(Level.SEVERE, null, ex);
        }

        // execute the java preparedstatement
    }
    
}
