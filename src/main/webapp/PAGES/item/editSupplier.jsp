<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/pure-min.css">
<link rel="stylesheet" href="css/custom.css">
<title>Edit Author</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/navbar-static/">
<!-- Bootstrap core CSS -->
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/a27fadce28.js" crossorigin="anonymous"></script>

</head>
<body>
 <main>

    <%@ include file="../includes/admin-menu.jsp" %>

	<div class="container">
	<h2>Editing Author</h2>
	<hr/>
	<sf:form method="post" action="EditSupplierSubmit" modelAttribute="supplier" class="pure-form pure-form-stacked">
		<div class="mb-3">
			<sf:label class="form-label" path="name">Name:</sf:label>
			<sf:input class="form-control" path="name" required="required" size="30" maxlength="50" />
		</div>
		<div class="mb-3">
			<sf:label class="form-label" path="details">Details:</sf:label>
			<sf:input class="form-control" path="details" required="required" size="30" maxlength="50" />
		</div>
		<div>
			<sf:label path="description">Description:</sf:label>
			<sf:textarea path="description" rows="5" required="required" maxlength="1000" />
		</div>

		<br/>
		<div>
			<input type="submit" value="Update" class="pure-button pure-button-primary"/>
		</div>
		<sf:hidden path="id"/>
	</sf:form>
	</div>
    </main>
</body>
</html>