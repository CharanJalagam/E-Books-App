<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Helpline</title>
<%@ include file="allComponents/allCss.jsp"%>
<style type="text/css"">
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
<%@ include file="allComponents/navbar.jsp"%>
<div class="container p-5">
<div class="row p-5">
<div class="text-center col-md-4 offset-md-4">
<div class="card">
<div class=" card-body ">
<i class="fa-solid fa-square-phone fa-5x text-success"></i>


<h3>24*7 Service</h3>
<h4>Help Line Number</h4>
<h5>+091 8886252526</h5>
<a href="index.jsp" class="btn btn-primary text-white">Home</a>
</div>
</div>
</div>
</div>

</div>
<footer><%@ include file="allComponents/footer.jsp"%></footer>
</body>
</html>