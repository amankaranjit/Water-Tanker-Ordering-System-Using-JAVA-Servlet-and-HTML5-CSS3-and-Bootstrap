package com.watertanker.servlet;

import com.watertanker.database.JDBCConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String form_email = request.getParameter("email");
            String form_pass = request.getParameter("password");

            if (form_email.isEmpty() || form_pass.isEmpty()) {
                request.setAttribute("error", "Field is Empty");
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.include(request, response);
            } else {
                Connection cn = JDBCConnection.getConnection();
                Statement stmt = cn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM user where email = '" + form_email + "' ");
                if (rs.next()) {
                    String u_email = rs.getString("email");
                    String u_pass = rs.getString("password");
                    int session_id = rs.getInt("id");
                    String session_name = rs.getString("name");
                    String session_contact = rs.getString("contact");

                    int secret_key = 5;
                    String user_password = getDecryptedValue(u_pass, secret_key);

                    if ((form_email.equals(u_email)) && (form_pass.equals(user_password))) {
                        response.sendRedirect("index.jsp");
                        HttpSession session = request.getSession();
                        session.setAttribute("s_id", session_id);
                        session.setAttribute("s_email", u_email);
                        session.setAttribute("s_name", session_name);
                        session.setAttribute("s_contact", session_contact);
                    } else {
                        out.print("error");
//                        response.sendRedirect("Error.jsp");
                    }

                } else {
//                    response.sendRedirect("Error.jsp");
                    out.print("error");
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
