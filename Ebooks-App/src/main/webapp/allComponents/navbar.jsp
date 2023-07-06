<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<style type="text/css">
.mlt{
margin-left: 10px;
}
</style>
<div class="container-fluid"
	style="height: 10px; background-color: #303f9f"></div>

<div class="container-fluid p-3 bg-light">
	<div class="row">
		<div class="col-md-3 text-success">

			<h3>
				<i class="fa-sharp fa-solid fa-book">&nbsp</i>E-Reads
			</h3>
		</div>
		<div class="col-md-6 ">
			<form action="search.jsp" method="post" class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search" name="ch">
				<button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
		<c:if test="${not empty userobj }">
			<div class="col-md-3 pl-3">
			<a href="checkout.jsp"><i class="fa-solid fa-cart-plus fa-2x"></i></a>
				<a href="" class="btn btn-success"><i
					class="fa-solid fa-user">&nbsp</i>${userobj.name}</a> <a
					href="LogoutServlet" class="btn btn-primary"><i
					class="fa-solid fa-right-to-bracket">&nbsp</i>Logout</a>
			</div>
		</c:if>


		<c:if test="${empty userobj }">
			<div class="col-md-2 ml-5 pl-5 ">
				<a href="login.jsp" class="btn btn-success "><i
					class="fa-solid fa-user">&nbsp</i>Login</a> <a href="register.jsp"
					class="btn btn-primary"><i class="fa-solid fa-right-to-bracket">&nbsp</i>Register</a>
			</div>
		</c:if>
	</div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp"><i class="fa-solid fa-house fa-1x"></i>
					Home <span class="sr-only">(current)</span>
			</a></li>

			<li class="nav-item active"><a class="nav-link"
				href="all_recent_book.jsp"><i class="fa-solid fa-book-open-reader">&nbsp</i>Recent
					Book</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="all_new_book.jsp"><i class="fa-solid fa-book-open-reader">&nbsp</i>New
					Book</a></li>
			<li class="nav-item active"><a class="nav-link "
				href="all_old_book.jsp"><i class="fa-solid fa-book-open-reader">&nbsp</i>Old
					Book</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<a href="setting.jsp"class="btn btn-light my-2 my-sm-0" type="submit">
				<i class="fa-solid fa-gear ">&nbsp</i>Settings
			</a>
			<a href="helpline.jsp"class="btn btn-light my-2 my-sm-0 ml-1" type="submit">
				<i class="fa-solid fa-address-book ">&nbsp</i>Contact us
			</a>
			
		</form>
	</div>
</nav>