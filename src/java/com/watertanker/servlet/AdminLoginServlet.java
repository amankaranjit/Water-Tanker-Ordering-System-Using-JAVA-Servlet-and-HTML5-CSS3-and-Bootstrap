package com.watertanker.servlet;

import com.watertanker.database.JDBCConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String form_email = request.getParameter("email");
            String form_pass = request.getParameter("password");

            if (form_email.isEmpty() || form_pass.isEmpty()) {
                out.print("empty");
            } else {
                Connection cn = JDBCConnection.getConnection();
                Statement stmt = cn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM admin");
                while (rs.next()) {
                    String a_email = rs.getString("email");
                    String a_pass = rs.getString("password");
                    String admin_session_name = rs.getString("name");
//                    out.println(a_email);
//                    out.println(a_pass);
                    int secret_key = 5;
                    String admin_password = getDecryptedValue(a_pass, secret_key);
//                    out.println(a_email);
//                    out.println(admin_password);
//                    out.println(form_pass);
                    if ((form_email.equals(a_email)) && (form_pass.equals(admin_password))) {
                        response.sendRedirect("AddCategory.jsp");
                        HttpSession session = request.getSession();
                        session.setAttribute("s_name", admin_session_name);

                    } else {
                        out.println("error failed");
                    }

                }
            }

        } catch (Exception e) {
        }
    }

    private String getDecryptedValue(String pass, int secret_key) {
        String decrypted = "";
        for (int i = 1; i < pass.length(); i++) {
            char ch = pass.charAt(i);
            ch -= secret_key;
            decrypted = decrypted + ch;
        }
        return decrypted;
    }
}
