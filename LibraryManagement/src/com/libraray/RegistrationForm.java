package com.libraray;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/registrationform")
public class RegistrationForm extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String sname = req.getParameter("sname");
		String sid = req.getParameter("sid");
		String sphone = req.getParameter("sphone");
		String semail = req.getParameter("semail");
		String spass1 = req.getParameter("spass1");
		String spass2 = req.getParameter("spass2");
		if (spass1.equals(spass2)) {

			Connection con = null;

			try {
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management", "root", "password");
				PreparedStatement ps = con.prepareStatement(
						"insert into students_info(sname,sid,sphone,semail,spass1,spass2) values(?,?,?,?,?,?)");

				ps.setString(1, sname);
				ps.setString(2, sid);
				ps.setString(3, sphone);
				ps.setString(4, semail);
				ps.setString(5, spass1);
				ps.setString(6, spass2);

				int rowcount = ps.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					resp.sendRedirect("login.jsp");
					con.close();
				} catch (SQLException e) {

					e.printStackTrace();
				}
			}

		} else {
			resp.sendRedirect("samepass.jsp");
		}
	}

}
