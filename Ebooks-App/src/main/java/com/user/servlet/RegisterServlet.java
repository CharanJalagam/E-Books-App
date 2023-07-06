package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDaoImpl;
import com.DB.DBConnect;
import com.entity.User;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String name=request.getParameter("fname");
			String email=request.getParameter("email");
			String phno=request.getParameter("phno");
			String password=request.getParameter("password");
			String check=request.getParameter("check");
//			System.out.println(name+""+email+""+phno+""+password);
			User us=new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			us.setPassword(password);
			
			HttpSession session=request.getSession();
			
			if(check !=null) {
				UserDaoImpl dao=new UserDaoImpl(DBConnect.getConn());
				boolean f2=dao.checkUser(email);
				if(f2) {
					boolean f=dao.userRegister(us);
					if(f) {
//						System.out.println("User register Success..");
						session.setAttribute("succMsg","Registration succesfully" );
						response.sendRedirect("register.jsp");
					}
					else {
//						System.out.println("Something went wrong");
						session.setAttribute("failedMsg","Something went wrong" );
						response.sendRedirect("register.jsp");
					}
				}
				else {
					session.setAttribute("failedMsg","Email Already Exists Try Using Another Email Id!!!" );
					response.sendRedirect("register.jsp");
				}
			}
			else {
//				System.out.println("Check the box");
				session.setAttribute("failedMsg","Please Check the box" );
				response.sendRedirect("register.jsp");
			}
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
