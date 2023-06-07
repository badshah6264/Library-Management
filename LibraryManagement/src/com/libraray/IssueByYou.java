package com.libraray;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/issuebyyou")
public class IssueByYou extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ArrayIndexOutOfBoundsException,ServletException, IOException {
		try {
			Cookie []ck = req.getCookies();
			if(ck[1].getValue() == null){
				resp.sendRedirect("loginfirst.jsp");
			}else {
				String scontent = ck[1].getValue();
				/* System.out.println(ck[1].getValue()); */
				req.setAttribute("data", scontent);
				req.getRequestDispatcher("issuebyyou.jsp").forward(req, resp);
			}
		} catch (Exception e) {
			resp.sendRedirect("loginfirst.jsp");
		}
		
		
		
		
		
	}
}
