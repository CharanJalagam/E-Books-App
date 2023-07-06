<%@page import="com.entity.User"%>
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

.mrl{
margin-left: 35px;
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
<%
	User u = (User) session.getAttribute("userobj");
	%>
	<%@ include file="allComponents/navbar.jsp"%>
	<div class="text-center mt-3">
<h3>Recent Books</h3>
</div>
	<div class="container-fluid">
		<div class="row p-2">


			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getAllRecentBook();
			for (BookDtls b : list2) {
			%>

			<div class="col-md-3">
				<div class="card crd-ho mt-3">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b.getPhotoName()%>"
							style="width: 130px; height: 170px" class="img-thumblin">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<%
						if (b.getBookCategory().equals("Old")) {
						%>
						<p>
							Category:
							<%=b.getBookCategory()%></p>
						<div class="row text-center ">
							<div class="mrl">
								<a href="view_books.jsp?bid=<%=b.getBookId()%>"
									class="btn btn-success btn-sm ml-5"id="oldviews">View Details</a> <a href=""
									class="btn btn-danger btn-sm ml-1"><i
									class="fa-solid fa-indian-rupee-sign"></i>&nbsp<%=b.getPrice()%></a>
							</div>
						</div>
						<%
						} else {
						%>
						<p>
							Category:
							<%=b.getBookCategory()%></p>
						<div class="row text-center mrl">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger mrl btn-sm ml-2">Add
								Cart</a>
							<%
							} else {
							%>
							<a
								href="cartServlet?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm ml-2">Add Cart</a>
							<%
							}
							%>
								 <a
									href="view_books.jsp?bid=<%=b.getBookId()%>"
									class="btn btn-success btn-sm ml-1">View Details</a> <a href=""
									class="btn btn-danger btn-sm ml-1"><i
									class="fa-solid fa-indian-rupee-sign"></i>&nbsp<%=b.getPrice()%></a>
							
						</div>
						<%
						}
						%>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
	<footer>
	<%@ include file="allComponents/footer.jsp"%>
	</footer>

</body>
</html>