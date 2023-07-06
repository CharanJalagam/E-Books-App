package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DAO.BookOrderImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.Book_Order;
import com.entity.Cart;

public class OrderServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session=request.getSession();
			int id=Integer.parseInt(request.getParameter("id"));
			String name=request.getParameter("username");
			String email=request.getParameter("email");
			String phno=request.getParameter("phno");
			String address=request.getParameter("address");
			String landmark=request.getParameter("landmark");
			String city=request.getParameter("city");
			String state=request.getParameter("state");
			String pincode=request.getParameter("pincode");
			String payment=request.getParameter("payment");
			String fullAdd=address+","+landmark+","+city+","+state+","+pincode;
			
			
			
			CartDAOImpl dao= new CartDAOImpl(DBConnect.getConn());
			List<Cart>blist=dao.getBookByUser(id);
			if(blist.isEmpty()) {
				session.setAttribute("failedMsg", "No Items in Cart");
				response.sendRedirect("checkout.jsp");
			}
			else {
				BookOrderImpl dao2=new BookOrderImpl(DBConnect.getConn());
				Book_Order o=null;
				int i=dao2.getOrderNo();
				Random r=new Random();
				ArrayList<Book_Order>orderlist=new ArrayList<Book_Order>();
				for(Cart c:blist) {
					o=new Book_Order();
					i++;
					o.setOrderId("Book-ORD-00"+i);
					o.setUserName(name);
					o.setEmail(email);
					o.setPhno(phno);
					o.setFullAdd(fullAdd);
					o.setBookName(c.getBookName());
					o.setAuthor(c.getAuthor());
					o.setPrice(c.getPrice()+"");
					o.setPayment(payment);
					orderlist.add(o);
					
				}
				
				if("noselect".equals(payment)) {
					session.setAttribute("failedMsg", "Please Choose a Payment Method");
					response.sendRedirect("checkout.jsp");
				}
				else {
					boolean f=dao2.saveOrder(orderlist);
					if(f) {
						response.sendRedirect("order_success.jsp");
					}
					else {
						session.setAttribute("failedMsg", "Your Order Failed");
						response.sendRedirect("checkout.jsp");
					}
				}
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
