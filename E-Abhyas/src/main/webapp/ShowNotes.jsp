<%@page import="linkcode.service.NotesImpl"%>
<%@page import="linkcode.model.Post"%>
<%@page import="java.util.List"%>
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
<title>Show Notes</title>
<%@include file="allcomponent/allcss.jsp"%>
</head>
<body>
	<%@include file="allcomponent/Navbar.jsp"%>
	<%
	String updateMsg = (String) session.getAttribute("updateMsg");
	if (updateMsg != null) {
	%>
	<div class="alert alert-success" role="alert"><%=updateMsg%></div>

	<%
	session.removeAttribute("updateMsg");

	}
	%>
	<%
	String DeleteMsg = (String) session.getAttribute("DeleteMsg");
	if (DeleteMsg != null) {
	%>
	<div class="alert alert-danger" role="alert"><%=DeleteMsg%></div>

	<%
	session.removeAttribute("DeleteMsg");

	}
	%>
	<%
	String r = (String) session.getAttribute("WrongMsg1");
	if (r != null) {
	%>
	<div class="alert alert-danger" role="alert"><%=r%></div>

	<%
	session.removeAttribute("WrongMsg1");

	}
	%>
	<%
	String invalid = (String) session.getAttribute("invalid");
	if (invalid != null) {
	%>
	<div class="alert alert-danger" role="alert"><%=invalid%></div>

	<%
	session.removeAttribute("invalid");

	}
	%>
	
	<div class="conatiner-fluid div-color">
		<h2 class="text-center">
			<b>ALL NOTES</b>
		</h2>
		<br>
		<div class="col-md-12">
			<%
			if (reg3 != null) {

				NotesImpl rdao = new NotesImpl();
				List<Post> post = rdao.searchAll(reg3.getId());
				for (Post po : post) {
			%>
			<div class="card">
				<div class="card-header text-success">
					<b>Published By : <%=reg3.getName()%></b>
				</div>
				<div class="card-body">
					<h5 class="card-title"><%=po.getTitle()%></h5>
					<p class="card-text"><%=po.getContent()%></p>
					<div class="container text-center mt-2">
						<a href="edit.jsp?course_code=<%=po.getCourse_code()%>"
							class="btn btn-primary mr-2">EDIT NOTE</a> <a
							href="deleteservlet?course_code=<%=po.getCourse_code() %>" class="btn btn-danger mr-2">DELETE</a>
					</div>
				</div>
				<div class="card-footer text-success">
					<b>Published Date : <%=po.getNotes_date()%></b>
				</div>
			</div>
			<br>
			<%
			}
			}
			%>
		</div>
	</div>
	<%@include file="allcomponent/footer.jsp"%>

</body>
</html>