/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.watertanker.servlet;

import com.watertanker.database.JDBCConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Aman Karanjit
 */
public class CategoryServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         try {
            Connection cn = JDBCConnection.getConnection();
            String c_name = request.getParameter("name");
            String sprice = request.getParameter("price");
            int price = Integer.parseInt(sprice);
//            System.out.println(c_name);
            String insertQuery = "INSERT INTO category(name,price) values(?,?)";
            PreparedStatement stmt = cn.prepareStatement(insertQuery);

            stmt.setString(1, c_name);
            stmt.setInt(2, price);
            stmt.execute();
            response.sendRedirect("AddCategory.jsp");
//            RequestDispatcher rd = request.getRequestDispatcher("../AddCategory.jsp");            
//            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
