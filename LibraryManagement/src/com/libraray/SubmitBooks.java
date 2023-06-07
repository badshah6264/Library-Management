package com.libraray;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/submitbooks")
public class SubmitBooks extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Cookie[] ck = req.getCookies();

			if (ck[1].getValue() != null) {
				String sname = req.getParameter("sname");
				String sid = req.getParameter("sid");
				String bookid = req.getParameter("bookid");
				String bookname = req.getParameter("bookname");
				String authorname = req.getParameter("authorname");

				Connection con = null;

				try {
					PrintWriter out = resp.getWriter();
					Class.forName("com.mysql.cj.jdbc.Driver");
					con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management", "root",
							"password");

					PreparedStatement ps1 = con
							.prepareStatement("select * from issued_books where bookid = ? AND sid = ?");
					ps1.setString(1, bookid);
					ps1.setString(2, sid);

					ResultSet rs = ps1.executeQuery();

					if (rs.next() == true) {

						PreparedStatement ps2 = con
								.prepareStatement("delete from issued_books where bookid = ? AND sid = ?");
						ps2.setString(1, bookid);
						ps2.setString(2, sid);

						int rc = ps2.executeUpdate();
					} else {
						resp.sendRedirect("loginfirst.jsp");
					}

				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					try {
						resp.sendRedirect("submitsuccess.jsp");
						con.close();
					} catch (SQLException e) {
						resp.sendRedirect("submitfailed.jsp");
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
