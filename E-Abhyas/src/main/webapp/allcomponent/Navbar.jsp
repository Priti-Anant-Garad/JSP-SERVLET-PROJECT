<%@page import="linkcode.model.Register"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom navbar-custom">
	<a class="navbar-brand" href="#"><i class="fa fa-graduation-cap"
		aria-hidden="true"></i> E-Abhyas</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<%
		Register reg = (Register) session.getAttribute("RegDetail");
		if (reg != null) {
		%>
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="UserHome.jsp"><i
					class="fa fa-home" aria-hidden="true"></i> Home <span
					class="sr-only">(current)</span></a></li>
			<li class="nav-item"><a class="nav-link" href="AddNotes.jsp"><i
					class="fa fa-plus-square" aria-hidden="true"></i> Add Notes</a></li>
			<li class="nav-item"><a class="nav-link" href="ShowNotes.jsp"><i
					class="fa fa-address-book-o" aria-hidden="true"></i> Show Notes</a></li>
		</ul>
		<a href="Login.jsp" class="btn btn-light my-2 my-sm-0 mr-2"
			data-toggle="modal" data-target="#exampleModal" type="submit"><i
			class="fa fa-user-circle-o" aria-hidden="true"></i> <%=reg.getName()%></a>
		<a href="LogoutServlet" class="btn btn-light my-2 my-sm-0"
			type="submit"><i class="fa fa-user-plus" aria-hidden="true"></i>
			Logout</a>


		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header ">
						<h5 class="modal-title" id="exampleModalLabel">
							<h4 class="col-md-2">Profile</h4>
						</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="container ">
							<h2 class="col-md-2 text-left">
								<i class="fa fa-user" aria-hidden="true"></i>
							</h2>
							<table class="table">
								<tbody>
									<tr>
										<th>User ID</th>
										<td><%=reg.getId()%></td>
									</tr>
									<tr>
										<th>Full Name</th>
										<td><%=reg.getName()%></td>
									</tr>
									<tr>
										<th>Email ID</th>
										<td><%=reg.getEmail()%></td>
									</tr>
								</tbody>
							</table>
							<div class="modal-footer col-md-12 text-left">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close Details</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<%
		} else {
		%>

		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="Home.jsp"><i
					class="fa fa-home" aria-hidden="true"></i> Home <span
					class="sr-only">(current)</span></a></li>
			<li class="nav-item"><a class="nav-link" href="AddNotes.jsp"><i
					class="fa fa-plus-square" aria-hidden="true"></i> Add Notes</a></li>
			<li class="nav-item"><a class="nav-link" href="ShowNotes.jsp"><i
					class="fa fa-address-book-o" aria-hidden="true"></i> Show Notes</a></li>
		</ul>
		<a href="Login.jsp" class="btn btn-light my-2 my-sm-0 mr-2"
			type="submit"><i class="fa fa-user-circle-o" aria-hidden="true"></i>
			Login</a> <a href="Register.jsp" class="btn btn-light my-2 my-sm-0"
			type="submit"><i class="fa fa-user-plus" aria-hidden="true"></i>
			Register</a>

		<%
		}
		%>



	</div>

</nav>