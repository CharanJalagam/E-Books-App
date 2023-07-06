package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;

/**
 * Servlet implementation class DeleteOldBook
 */
public class DeleteOldBook extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String em=request.getParameter("em");
			int id=Integer.parseInt(request.getParameter("id"));
			BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
			boolean f=dao.oldBookDelete(em, "Old",id);
			HttpSession session=request.getSession();
			
			if(f) {
				session.setAttribute("succMsg", "OldBook Deleted Succesfully");
				response.sendRedirect("old_book.jsp");
			}
			else {
				session.setAttribute("failedMsg", "Something wrong on server");
				response.sendRedirect("old_book.jsp");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
