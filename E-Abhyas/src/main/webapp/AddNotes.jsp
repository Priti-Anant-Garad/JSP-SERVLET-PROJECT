<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Register reg3 = (Register) session.getAttribute("RegDetail");
{
	if (reg3 == null) {
		response.sendRedirect("Login.jsp");
		session.setAttribute("Login-error", "Please Login...!");
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Notes</title>
<%@include file="allcomponent/allcss.jsp"%>
</head>
<body>
	<%@include file="allcomponent/Navbar.jsp"%>
	<div class="conatiner-fluid div-color">
		<br> <br> <br>
		<h1 class="text-center">
			<i class="fa fa-plus-square" aria-hidden="true"></i> Add Your Notes
		</h1>
		<div class="container">
			<%
			String regnMsg = (String) session.getAttribute("add-sucess");
			if (regnMsg != null) {
			%>
			<div class="alert alert-success" role="alert"><%=regnMsg%></div>

			<%
			session.removeAttribute("add-sucess");
			}
			%>
			<%
			String failnmsg = (String) session.getAttribute("failnmsg");
			if (failnmsg != null) {
			%>
			<div class="alert alert-danger" role="alert"><%=failnmsg%></div>

			<%
			session.removeAttribute("fail-msg");
			}
			%>
			<div class="row">


				<div class="col-md-12">

					<form action="AddNotesServlet" method="post">
					
						<div class="form-group">
							<%
							reg = (Register) session.getAttribute("RegDetail");
							if (reg != null) {
							%>
							<input type="hidden" value="<%=reg.getId()%>" name="uid">
							<%
							}
							%>
							
							<label for="exampleInputEmail1"><b>Note Title</b></label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="title" required="required">
						</div>
						<div class="form-group">
							<label for="exampleFormControlTextarea1"><b>Note
									Content</b></label>
							<textarea class="form-control" id="exampleFormControlTextarea1"
								rows="9" name="content" required="required"></textarea>
						</div>
						<div class="container text-center">
							<button type="submit" class="btn btn-primary">ADD</button>
						</div>

					</form>

				</div>
			</div>
		</div>
	</div>

	<%@include file="allcomponent/footer.jsp"%>
</body>
</html>