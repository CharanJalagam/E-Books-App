package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutServlet
 */
public class LogoutServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = (HttpSession) request.getSession();
			session.removeAttribute("userobj");
			HttpSession session2 = (HttpSession) request.getSession();
			session.setAttribute("succMsg","Logout Successful");
			response.sendRedirect("login.jsp");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}


}
