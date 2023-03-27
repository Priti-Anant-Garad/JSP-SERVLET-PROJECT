<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>
<%@include file="allcomponent/allcss.jsp"%>
</head>
<body>
	<%@include file="allcomponent/Navbar.jsp"%>
	<div class="container-fluid div-color">
		<div class="row">
			<div class="col-md-04 offset-md-4">
				<div class="card mt-4" style="width: 30rem;">
					<div class="card-header text-center text-white bg-custom">
						<h4>
							<i class="fa fa-user-plus" aria-hidden="true"></i><br>Registration
						</h4>
					</div>
					
					
				
					<%
					String FailMsg = (String) session.getAttribute("failed-msg");
					if (FailMsg != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=FailMsg%></div>

					<%
					session.removeAttribute("failed-msg");
					}
					%>
					
					<div class="card-body">
						<form action="RegisterServlet" method="get">
							<div class="form-group">
								<label>Enter User Id</label> <input type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="id">
							</div>
							<div class="form-group">
								<label>Enter Full Name</label> <input type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="name">
							</div>
							<div class="form-group">
								<label>Enter Email Address</label> <input type="email"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="email">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Enter Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									name="pass">
							</div>
							<button type="submit"
								class="btn btn-primary badge-pill btn-block">Register</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="allcomponent/footer.jsp"%>
</body>
</html>