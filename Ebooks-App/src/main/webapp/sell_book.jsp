<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sell Book</title>
<%@ include file="allComponents/allCss.jsp"%>
<style text="text/css">
body{
    min-height: 100vh;
    display: flex;
    flex-direction: column;
}
footer{
    margin-top: auto;
}
</style>
</head>
<body style="background-color: #f0f1f2;">
<c:if test="${empty userobj }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>
	<%@ include file="allComponents/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-4">
					<div class="card-body">
					<h5 class="text-center text-primary p-1"> Sell Old Book</h5>
					<c:if test="${not empty succMsg }">
					<h5 class="text-center text-success">${succMsg }</h5>
					<c:remove var="succMsg" scope="session"/>
					</c:if>
					<c:if test="${not empty failedMsg }">
					<h5 class="text-center text-danger">${failedMsg }</h5>
					<c:remove var="failedMsg" scope="session"/>
					</c:if>
					<form action="AddOldBook" method="post" enctype="multipart/form-data">
					<input type="hidden" value="${userobj.email }" name="user">
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
								<label for="exampleFormControlFile1">Upload Photo</label> <input
									name="bimg"type="file" class="form-control-file" id="exampleFormControlFile1"
									aria-describedby="emailHelp" required="required" >
							</div>
							<button type="submit" class="btn btn-primary">Sell</button>
							
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer>
	<%@ include file="allComponents/footer.jsp"%>
	</footer>
</body>
</html>