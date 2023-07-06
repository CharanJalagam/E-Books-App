<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recent Books</title>
<%@include file="allComponents/allCss.jsp"%>
<style type="text/css">
.back-img {
	height: 50vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}

.custom {
	font-size: 44px;
	color: #7986cb;
}

.crd-ho:hover {
	background-color: #fcf7f7;
}
#oldview{
margin-left: 85px;
}
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
<body>
	<%@ include file="allComponents/navbar.jsp"%>
	<div class="text-center mt-3">
<h3>Old Books</h3>
</div>
	<div class="container-fluid">
		<div class="row p-2">


			<%
			BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list3 = dao3.getAllOldBook();
			for (BookDtls b : list3) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho mt-3">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>

						<p>
							Category:
							<%=b.getBookCategory()%></p>
						<div class="row ">
							<div class="text-center">
								<a href="view_books.jsp?bid=<%=b.getBookId()%>" id="oldview"class="btn btn-success btn-sm ">View Details</a>
								<a href="" class="btn btn-danger btn-sm ml-1"><i
									class="fa-solid fa-indian-rupee-sign"></i>&nbsp<%=b.getPrice()%></a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
	</div>
	<footer><%@ include file="allComponents/footer.jsp"%></footer>
	
</body>
</html>