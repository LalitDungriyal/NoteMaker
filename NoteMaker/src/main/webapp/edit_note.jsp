<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@page import="com.helper.FactoryProvider,com.entities.Note,org.hibernate.Session"%>
<title>Edit a Note</title>

	<%@include file="all_js_css.jsp"%>

</head>
<body>

	<div class="container-fluid m-0 p-0">
	
		<%@include file="navbar.jsp" %>


		<h1>Please fill Details to update your note..</h1>

		<% 
		
			int noteId=Integer.parseInt(request.getParameter("note_id"));
			
			Session s=FactoryProvider.getFactory().openSession();
			
			Note note=(Note)s.get(Note.class,noteId);
		
			
		%>




		<form action="UpdateServlet" method="post">
		
			<input value="<%=note.getId() %>" name="noteId" type="hidden" />
		
			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label">Note Title
					</label> <input name="title" required type="text" class="form-control"
					id="title"
					value="<%=note.getTitle() %>"
					 >
			</div>
			<div class="mb-3">
				<label for="content" class="form-label">Note Content</label>
				<textarea required placeholder="Enter text here"
					name="content"
					id="content"
					class="form-control"
					style="height:250px"
				><%=note.getContent() %></textarea>
			</div>
			<div class="text-center">
				<button type="submit" class="btn btn-success">Save your Note</button>
			</div>
		</form>

	
	</div>


</body>
</html>