<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<%@include file="allcomponent/allcss.jsp"%>
</head>
<body>
	<%@include file="allcomponent/Navbar.jsp"%>
	<div class="container-fluid div-color">
		<div class="text-center">
			<h1 class="text-Black">
				<br> <br> <br> <br> <i
					class="fa fa-graduation-cap" aria-hidden="true"></i> E-Abhyas <br>
				<h5 class="text-Black">
					<i class="fa fa-book" aria-hidden="true"></i> Save Your Notes
				</h5>
			</h1>
			<br> <a href="Login.jsp" class="btn btn-dark my-2 my-sm-0 mr-3"
				type="submit"><i class="fa fa-user-circle-o" aria-hidden="true"></i>
				Login </a> <a href="Register.jsp" class="btn btn-dark my-2 my-sm-0"
				type="submit"><i class="fa fa-user-plus" aria-hidden="true"></i>
				Register </a>
		</div>
	</div>
	<%@include file="allcomponent/footer.jsp"%>
</body>
</html>
