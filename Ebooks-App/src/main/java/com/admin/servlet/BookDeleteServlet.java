package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;

public class BookDeleteServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(request.getParameter("id"));
			BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
			boolean f=dao.deleteBooks(id);
			HttpSession session=request.getSession();
			if(f) {
				session.setAttribute("succMsg", "Book Deleted Succesfully ");
				response.sendRedirect("admin/allbooks.jsp");
			}
			else {
				session.setAttribute("failedMsg", "Something went wrong ");
				response.sendRedirect("admin/allbooks.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}


}
