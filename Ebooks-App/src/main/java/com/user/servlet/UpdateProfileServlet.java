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
 * Servlet implementation class UpdateProfileServlet
 */
public class UpdateProfileServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(request.getParameter("id"));
			String name=request.getParameter("fname");
			String email=request.getParameter("email");
			String phno=request.getParameter("phno");
			String password=request.getParameter("password");
			UserDaoImpl dao=new UserDaoImpl(DBConnect.getConn());
			HttpSession session=request.getSession();
			User us=new User();
			us.setId(id);
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			boolean f=dao.checkPassword(id, password);
			if(f) {
				boolean f2=dao.updateProfile(us);
				if(f2) {
					session.setAttribute("succMsg","Profile Updated Succesfully" );
					response.sendRedirect("edit_profile.jsp");
				}
				else {
					session.setAttribute("failedMsg","Something wrong on server" );
					response.sendRedirect("edit_profile.jsp");
				}
			}
			else {
				session.setAttribute("failedMsg","Your Password is Incorrect" );
				response.sendRedirect("edit_profile.jsp");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}


}
