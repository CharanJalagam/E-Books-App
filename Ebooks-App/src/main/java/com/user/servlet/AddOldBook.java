package com.user.servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;

/**
 * Servlet implementation class BooksAdd
 */
@MultipartConfig()
public class AddOldBook extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String bookName=request.getParameter("bname");
			String author=request.getParameter("author");
			String price=request.getParameter("price");
			String categories="Old";
			String status="Active";
			Part part=request.getPart("bimg");
			String fileName=part.getSubmittedFileName();
			String useremail=request.getParameter("user");
			BookDtls b=new BookDtls(bookName,author,price,categories,status,fileName,useremail);
			BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
			
			
			boolean f=dao.addBooks(b);
			HttpSession session= request.getSession();
			if(f) {
				String path=getServletContext().getRealPath("")+"books";
				 
				File file=new File(path);
				part.write(path+ File.separator+fileName);			
				
				session.setAttribute("succMsg", "Book Added Successfully");
				response.sendRedirect("sell_book.jsp");
			}
			else {
				session.setAttribute("failedMsg", "Something went wrong");
				response.sendRedirect("sell_book.jsp");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
