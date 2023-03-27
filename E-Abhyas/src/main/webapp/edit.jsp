<%@page import="linkcode.service.NotesImpl"%>
<%@page import="linkcode.model.Post"%>
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
<title>Edit Notes</title>
<%@include file="allcomponent/allcss.jsp"%>
</head>
<body>

<%
String course_code=request.getParameter("course_code");
NotesImpl rdao = new NotesImpl();
Post p = rdao.getData(course_code);
%>

	<%@include file="allcomponent/Navbar.jsp"%>
	<div class="conatiner-fluid div-color">
		<br> <br> <br>
		<h1 class="text-center">
			<i class="fa fa-plus-square" aria-hidden="true"></i> Edit Your Note
		</h1>
		<div class="container">
			<div class="row">
				<div class="col-md-12">

					<form action="EditNotesServlet" method="post">
					<input type="hidden" value="<%=course_code%>" name="course_code">
						<div class="form-group">
							<label for="exampleInputEmail1"><b>Note Title</b></label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="title" required="required" value="<%=p.getTitle() %>">
						</div>
						<div class="form-group">
							<label for="exampleFormControlTextarea1"><b>Note
									Content</b></label>
							<textarea class="form-control" id="exampleFormControlTextarea1"
								rows="9" name="content" required="required"><%=p.getContent() %></textarea>
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