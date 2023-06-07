package com.libraray;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/search")
public class SearchPage extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			PrintWriter out = resp.getWriter();

			String scontent = req.getParameter("scontent");
			req.setAttribute("data", scontent);
			req.getRequestDispatcher("searchpage.jsp").forward(req, resp);

		} catch (Exception e) {
			resp.sendRedirect("searchdisable.jsp");
		}

	}
}
