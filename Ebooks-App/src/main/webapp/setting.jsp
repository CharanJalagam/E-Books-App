<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Settings</title>
<%@include file="allComponents/allCss.jsp"%>
<style type="text/css">
body{
    min-height: 100vh;
    display: flex;
    flex-direction: column;
}
footer{
    margin-top: auto;
}
a{
text-decoration:none;
color:black;
}
a:hover{
text-decoration:none;
}
</style>
</head>
<body style="background-color: #f7f7f7">
<c:if test="${empty userobj }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>
	<%@ include file="allComponents/navbar.jsp"%>
	<div class="container">
	
	<h2 class="text-center mt-3">Hello,${userobj.name }</h2>
	
		
		<div class="row p-4">
			<div class="col-md-6">
				<a href="sell_book.jsp">
					<div class="card">
						<div class="card-body text-center">
						<div class="text-primary"><i class="fa-solid fa-book-open fa-3x"></i></div>
						
						<h3>Sell Old Book</h3>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-6">
				<a href="edit_profile.jsp">
					<div class="card">
						<div class="card-body text-center">
						<div class="text-primary"><i class="fa-solid fa-address-card fa-3x"></i></div>
						
						<h4>Login & Security (Edit Profile)</h4>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-4 mt-3">
				<a href="old_book.jsp">
					<div class="card">
						<div class="card-body text-center ">
						<div class="text-warning"><i class="fa-solid fa-book fa-3x"></i></div>
						
						<h4>Old Books</h4>
						<p>Remove old books</p>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4 mt-3">
				<a href="order.jsp">
					<div class="card">
						<div class="card-body text-center ">
						<div class="text-danger"><i class="fa-solid fa-box-open fa-3x"></i></div>
						
						<h4>My Orders</h4>
						<p>Track Orders</p>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4 mt-3">
				<a href="helpline.jsp">
					<div class="card">
						<div class="card-body text-center ">
						<div class="text-primary"><i class="fa-solid fa-phone-volume fa-3x"></i></div>
						
						<h4>Help Center</h4>
						<p>24*7 Service</p>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
	<footer>
        <div class=" container-fluid text-center text-white p-3 mt-2" style="background-color: #303f9f;">
<h5>Design and Developed by Charan</h5>
</div>
        
    </footer>
</body>
</html>