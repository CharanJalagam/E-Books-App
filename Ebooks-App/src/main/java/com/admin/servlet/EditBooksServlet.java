package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;

/**
 * Servlet implementation class EditBooksServlet
 */
public class EditBooksServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(request.getParameter("id"));
			String bookName=request.getParameter("bname");
			String author=request.getParameter("author");
			String price=request.getParameter("price");
			String status=request.getParameter("status");
			
			BookDtls b=new BookDtls();
			b.setBookId(id);
			b.setBookname(bookName);
			b.setAuthor(author);
			b.setPrice(price);
			b.setStatus(status);
			
			BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
			boolean f=dao.updateEditBooks(b);
			HttpSession session=request.getSession();
			if(f) {
				session.setAttribute("succMsg", "Book Updated Succesfully ");
				response.sendRedirect("admin/allbooks.jsp");
			}
			else {
				session.setAttribute("failedMsg", "Something went wrong ");
				response.sendRedirect("admin/allbooks.jsp");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
