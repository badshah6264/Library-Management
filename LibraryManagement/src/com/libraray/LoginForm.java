package com.libraray;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/loginform")
public class LoginForm extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String sid = req.getParameter("sid");
		String spass1 = req.getParameter("spass1");
		

		Connection con = null;

		try {
			PrintWriter out = resp.getWriter();
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management", "root", "password");

			PreparedStatement ps1 = con.prepareStatement("select * from students_info where sid = ?");
			
			ps1.setString(1, sid);

			ResultSet rs = ps1.executeQuery();

			if (rs.next() == true) {
				if(spass1.equals(rs.getString(6))) {
					
					/* Create Cookies */
					Cookie ck1 = new Cookie("id",sid);
					Cookie ck2 = new Cookie("pass",spass1);
					resp.addCookie(ck1);
					resp.addCookie(ck2);
					
					resp.sendRedirect("loginsuccess.jsp");
				}else {
					resp.sendRedirect("correctpassword.jsp");
				}
			}
			else { resp.sendRedirect("correctpassword.jsp"); }
			 

		} catch (Exception e) {
			resp.sendRedirect("loginfailed.jsp");
		} finally {
			try {
				
				con.close();
			} catch (SQLException e) {

				resp.sendRedirect("loginfailed.jsp");
			}
		}

	}
	}

