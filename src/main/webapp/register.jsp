<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/pure-min.css">
<link rel="stylesheet" href="css/custom.css">
<title>Register</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/navbar-static/">
<!-- Bootstrap core CSS -->
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/a27fadce28.js" crossorigin="anonymous"></script>

</head>
<body>

    <div class="container">
    <br/>
    <br/>

    <div class="col-md-10 mx-auto col-lg-5">
	<sf:form action="RegisterSubmit" method="post" modelAttribute="user" class="p-4 p-md-5 border rounded-3 bg-light">
		<h1>Register</h1>
		<hr/>
		<div>${message}</div>

		<div>
			<sf:label path="username">User Name:</sf:label>
			<sf:input class="form-control" type="text" path="username" required="required"/>
		</div>
		<br/>
		<div>
			<sf:label path="password">Password:</sf:label>
			<sf:input class="form-control" type="password" path="password" required="required"/>
		</div>
		<br/>

		<div class="col">
           <sf:label path="userType">Type:</sf:label>
           <sf:select class="form-control" path="userType" items="${types}" itemLabel="name" required="required"/>
        </div>

        <br/>
		<button type="submit" class="pure-button pure-button-primary">Register</button>
	</sf:form>
	</div>
	</div>


</body>
</html>