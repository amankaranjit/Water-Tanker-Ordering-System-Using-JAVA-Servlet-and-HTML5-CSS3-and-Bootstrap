package com.watertanker.servlet;

import com.watertanker.database.JDBCConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class JDBCConnectionServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Connection conn = JDBCConnection.getConnection();
        if (conn != null) {
            out.print("<h1> Connected</h1>");
        } else {
            out.print("<h1>Not   Connected</h1>");
        }
    }
}
