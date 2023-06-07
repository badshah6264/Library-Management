package com.libraray;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/issuebooks")
public class IssueBooks extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			Cookie []ck = req.getCookies();
			
			if(ck[1].getValue() != null){
				String sname = req.getParameter("sname");
				String sid = req.getParameter("sid");
				String bookid = req.getParameter("bookid");
				String bookname = req.getParameter("bookname");
				String authorname = req.getParameter("authorname");

				Connection con = null;

				try {
					PrintWriter out = resp.getWriter();
					Class.forName("com.mysql.cj.jdbc.Driver");
					con = DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management", "root", "password");

					PreparedStatement ps1 = con.prepareStatement("select * from all_books where bookid = ?");
					ps1.setString(1, bookid);

					ResultSet rs = ps1.executeQuery();

					if (rs.next() == true) {

						
						DateFormat formatter = new SimpleDateFormat("dd/MM/yy");
					      Calendar obj = Calendar.getInstance();
					      String strDate = formatter.format(obj.getTime()); 
							/* System.out.println(strDate); */
						 

						PreparedStatement ps2 = con.prepareStatement(
								"insert into issued_books(bookid,bookname,authorname,issuedby,issueddate,sid) values(?,?,?,?,?,?)");
						ps2.setString(1, bookid);
						ps2.setString(2, bookname);
						ps2.setString(3, authorname);
						ps2.setString(4, sname);
						ps2.setString(5, strDate); 
						ps2.setString(6, sid);
						
						int rc = ps2.executeUpdate();
						resp.sendRedirect("issuesuccess.jsp");
					}
					else { resp.sendRedirect("loginfirst.jsp"); } 
					 

				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					try {
						/* resp.sendRedirect("issuesuccess.jsp"); */
						con.close();
					} catch (SQLException e) {

						e.printStackTrace();
					}
				}
			}else {
				resp.sendRedirect("loginfirst.jsp");
			

		}
		} catch (Exception e) {
			resp.sendRedirect("loginfirst.jsp");
		}
		}
}
