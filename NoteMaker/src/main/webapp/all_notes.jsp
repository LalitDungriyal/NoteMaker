<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.Note"%>
<%@page import="com.helper.FactoryProvider"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Notes</title>

<%@include file="all_js_css.jsp"%>

</head>

<body>

	<div class="container-fluid m-0 p-0">

		<%@include file="navbar.jsp"%>


		<div class="row">

			<div class="column">

				<%
				Session s = FactoryProvider.getFactory().openSession();
				Query q = s.createQuery("from Note");

				List<Note> list = q.list();

				for (Note note : list) {
				%>

				<div class="card " style="width:70%; margin:3px auto;">
					<img class="card-img-top m-3" style="max-width:85px" src="img/note.png" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%=note.getTitle() %></h5>
						<p class="card-text"><%=note.getContent() %></p>
						<a href="DeleteServlet?note_id=<%=note.getId() %>" class="btn btn-danger">Delete</a>
						<a href="edit_note.jsp?note_id=<%=note.getId() %>" class="btn btn-primary">Update</a>
					</div>
				</div>


				<%
				}

				s.close();
				%>

			</div>
		</div>

	</div>

</body>
</html>