package com.libraray;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/logout")
public class Logout extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			Cookie []ck = req.getCookies();
			ck[0].setMaxAge(0);
			ck[1].setMaxAge(0);
			ck[2].setMaxAge(0); 
			
			resp.addCookie(ck[0]);
			resp.addCookie(ck[1]);
			resp.addCookie(ck[2]);
			
			resp.sendRedirect("logoutsuccess.jsp");
		} catch (Exception e) {
			resp.sendRedirect("logoutfailed.jsp");
		}
		
		
	}
}
