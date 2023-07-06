<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Book</title>
<%@include file="allComponents/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
<%
User u=(User)session.getAttribute("userobj"); %>
	<%@ include file="allComponents/navbar.jsp"%>
	<%
	int bid=Integer.parseInt(request.getParameter("bid"));
	BookDAOImpl dao=new BookDAOImpl(DBConnect.getConn());
	BookDtls b=dao.getBookById(bid);
	%>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 text-center p-5 border  bg-white">
				<img src="books/<%=b.getPhotoName() %>" style="height: 170px; width: 130px"><br>
				<h4 class="mt-3">Book Name:<span class="text-success"> <%=b.getBookname() %></span> </h4>
				<h4>Author Name:<span class="text-success"> <%=b.getAuthor() %></span> </h4>
				<h4>Category: <span class="text-success"> <%=b.getBookCategory() %></span></h4>
			</div>
			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=b.getBookname() %></h2>
				
				<%
				if("Old".equals(b.getBookCategory())){%>
				<h5 class="text-primary">Contact Seller</h5>
				<h5 class="text-primary"><i class="fa-solid fa-envelope"></i> Email: <%=b.getEmail() %></h5>
				<%}
				%>
				<div class="row">
				<div class="col-md-4 text-danger text-center p-2">
				<i class="fa-solid fa-money-bill-1-wave fa-2x"></i>
				<p>Cash On Delivery</p>
				</div>
				<div class="col-md-4 text-danger text-center p-2">
				<i
						class="fa-solid fa-rotate-left fa-2x"></i> 
						<p>Return Available</p>
				</div>
				<div class="col-md-4 text-danger text-center p-2">
				<i
						class="fa-solid fa-truck-ramp-box fa-2x"></i>
						<p>Free Shipping</p>
				</div>
					  
				</div>
				<%
				if("Old".equals(b.getBookCategory())){
					%>
					<div class="text-center pt-2">
				<a href="index.jsp" class="btn btn-success"><i class="fa-solid fa-cart-plus"></i>Continue Shopping</a>
				<a href="" class="btn btn-danger"><i
								class="fa-solid fa-indian-rupee-sign"></i>&nbsp200</a>
				</div>
				<%	
				}else{
					%>
					
					
					<div class="text-center pt-2">
					<%if(u==null) 
						{%>
						<a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add Cart</a>
						<%}else{ %>
						<a href="cartServlet?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-primary  ml-2">Add Cart</a>
						<%} %>
					<a href="" class="btn btn-danger"><i
									class="fa-solid fa-indian-rupee-sign"></i>&nbsp200</a>
					</div>
					<%
				}
				%>
				
			</div>
		</div>
	</div>
</body>
</html>