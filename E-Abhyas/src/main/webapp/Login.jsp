<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<%@include file="allcomponent/allcss.jsp"%>
</head>
<body>
	<%@include file="allcomponent/Navbar.jsp"%>
	<div class="container-fluid div-color">
		<div class="row">
			<div class="col-md-04 offset-md-4">
				<div class="card mt-5" style="width: 30rem;">
					<div class="card-header text-center text-white bg-custom">
						<h4>
							<i class="fa fa-user" aria-hidden="true"></i><br>Login
						</h4>
					</div>
				

<%
					String logerr = (String) session.getAttribute("Login-error");
					if (logerr != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=logerr%></div>

					<%
					session.removeAttribute("Login-error");
					}
					%>
					
					<%
					String regMsg = (String) session.getAttribute("reg-sucess");
					if (regMsg != null) {
					%>
					<div class="alert alert-success" role="alert"><%=regMsg%></div>

					<%
					session.removeAttribute("reg-sucess");
					}
					%>
					<%
					String failedmsg = (String) session.getAttribute("failedmsg");
					if (failedmsg != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=failedmsg%></div>

					<%
					session.removeAttribute("failedmsg");
					}
					%>
					<%
					String lgmsg = (String) session.getAttribute("logoutmsg");
					if (lgmsg != null) {
					%>
					<div class="alert alert-success" role="alert"><%=lgmsg%></div>

					<%
					session.removeAttribute("logoutmsg");
					}
					%>

					<div class="card-body">
						<form action="LoginServlet" method="post">
							<div class="form-group">
								<label>Enter Email Address</label> <input type="email"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="uemail">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Enter Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									name="upass">
							</div>
							<button type="submit"
								class="btn btn-primary badge-pill btn-block">Login</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="allcomponent/footer.jsp"%>

</body>
</html>