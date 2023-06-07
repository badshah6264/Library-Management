package com.libraray;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addbooks")
public class AddBooks extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			Cookie[] ck = req.getCookies();

			if (ck[1].getValue() != null) {
				String bookname = req.getParameter("bookname");
				String authorname = req.getParameter("authorname");

				Connection con = null;

				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management", "root",
							"password");
					PreparedStatement ps = con
							.prepareStatement("insert into all_books(bookname,authorname) values(?,?)");

					ps.setString(1, bookname);
					ps.setString(2, authorname);

					int rowcount = ps.executeUpdate();
					resp.sendRedirect("addedsuccess.jsp");
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					try {

						con.close();
					} catch (SQLException e) {

						e.printStackTrace();
					}
				}

			} else {

				resp.sendRedirect("loginfirst.jsp");
			}

		} catch (Exception e) {
			resp.sendRedirect("loginfirst.jsp");
		}

	}
}
