<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Note</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>

	<div class="container-fluid m-0 p-0">

		<%@include file="navbar.jsp"%>

		<h1>Please fill your note details..</h1>

		<form action="SaveNoteServlet" method="post">
			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label">Note Title
					</label> <input name="title" required type="text" class="form-control"
					id="title" >
			</div>
			<div class="mb-3">
				<label for="content" class="form-label">Note Content</label>
				<textarea required placeholder="Enter text here"
					name="content"
					id="content"
					class="form-control"
					style="height:250px"
				></textarea>
			</div>
			<div class="text-center">
				<button type="submit" class="btn btn-primary">Add</button>
			</div>
		</form>

	</div>


</body>
</html>