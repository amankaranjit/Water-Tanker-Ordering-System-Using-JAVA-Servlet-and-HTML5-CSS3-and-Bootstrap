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
public class SignUpServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            Connection cn = JDBCConnection.getConnection();
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String contact = request.getParameter("contact");
            String password = request.getParameter("password");
            String cpassword = request.getParameter("cpassword");
            String address = request.getParameter("address");
            System.out.println(name);
            System.out.println(email);
            System.out.println(password);
            int secret_key = 5;
            String encrypt = getEncryptedValue(password, secret_key);
            System.out.println("Orignal_value:" + password);
            System.out.println("encrypted value:" + encrypt);
            if (name.isEmpty() || email.isEmpty() || password.isEmpty() || cpassword.isEmpty()) {
                System.out.println("Datafield is empty, insertion failed");
            } else {
                if (password.equals(cpassword)) {
                    String insertQuery = "INSERT INTO user(name,email,address,contact,password) values(?,?,?,?,?)";
                    PreparedStatement stmt = cn.prepareStatement(insertQuery);

                    stmt.setString(1, name);
                    stmt.setString(2, email);
                    stmt.setString(3, address);
                    stmt.setString(4, contact);
                    stmt.setString(5, encrypt);
                    stmt.executeUpdate();
                    System.out.println("Inserted");
                    RequestDispatcher rddd = request.getRequestDispatcher("login.jsp");
                    rddd.include(request, response);
                } else {
                    RequestDispatcher rddd = request.getRequestDispatcher("signup.jsp");                   
                    rddd.include(request, response);
                    out.println("<script> alert('Signup Failed Please Retry Again')</script>");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

     private String getEncryptedValue(String password, int secret_key) {
        String encrypt = " ";
        for (int i = 0; i < password.length(); i++) {

            char ch = password.charAt(i);
            ch += secret_key;
            encrypt = encrypt + ch;
        }

        return encrypt;

    }
}
