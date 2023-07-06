<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Add Books</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f2f2;">
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
	<c:redirect url="../login.jsp"/>
	</c:if>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
					<h4 class="text-center">Add Books</h4>
					<c:if test="${not empty succMsg }">
					<h5 class="text-center text-success">${succMsg }</h5>
					<c:remove var="succMsg" scope="session"/>
					</c:if>
					<c:if test="${not empty failedMsg }">
					<h5 class="text-center text-danger">${failedMsg }</h5>
					<c:remove var="failedMsg" scope="session"/>
					</c:if>
					<form action="../BooksAdd" method="post" enctype="multipart/form-data">
					<div class="form-group">
								<label for="exampleInputEmail1">Book Name</label> <input
									name="bname"type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" >
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name</label> <input
									name="author"type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" >
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">price*</label> <input
									name="price"type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" >
							</div>
							<div class="form-group">
								<label for="inputState">Book Categories</label> <select
									id="inputState" name="categories" class="form-control"  >
									<option selected>---Select---</option>
									<option value="New">New Book</option>
									</select>
							</div>
							<div class="form-group">
								<label for="inputState">Book Status</label> <select
									id="inputState" name="status" class="form-control"  >
									<option selected>---Select---</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									</select>
							</div>
							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo</label> <input
									name="bimg"type="file" class="form-control-file" id="exampleFormControlFile1"
									aria-describedby="emailHelp" required="required" >
							</div>
							<button type="submit" class="btn btn-primary">Add</button>
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 263px;">
 <%@include file="footer.jsp"%>
 </div>
</body>
</html>