<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/pure-min.css">
<link rel="stylesheet" href="css/custom.css">
<title>Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
<link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/navbar-static/">
</head>
<body>
	<div class="container col-xl-10 col-xxl-8 px-4 py-5">
	<div class="row align-items-center g-lg-5 py-5">

	<div class="col-lg-7 text-center text-lg-start">
       <h1 class="display-4 fw-bold lh-1 mb-3">Sign in</h1>
       <p class="col-lg-10 fs-4">Welcome to the inventory management system. This application allows client branches and warehouse admins to manage business operations  and the available stock.</p>
    </div>

	<div class="col-md-10 mx-auto col-lg-5">
	<sf:form action="LoginSubmit" method="post" modelAttribute="user" class="p-4 p-md-5 border rounded-3 bg-light">
		<div>${message}</div>
		<div class="form-floating mb-3">
			<sf:input  type="text" class="form-control" path="username" required="required"/>
			<sf:label  path="username">User Name:</sf:label>
		</div>
		<div class="form-floating mb-3">
			<sf:input type="password" class="form-control" id="floatingPassword" path="password" required="required"/>
			<sf:label path="password" for="floatingPassword">Password:</sf:label>
		</div>
		<div class="checkbox mb-3">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
		<button type="submit" class="pure-button pure-button-primary">Login</button>
		<hr class="my-4">
        <small class="text-muted">By clicking Sign up, you agree to the terms of use.</small>
	</sf:form>

	</div>
	</div>
	</div>
</body>
</html>