<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/navbar-static/">
<!-- Bootstrap core CSS -->
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

  <div class="container py-4">
    <%@ include file="../includes/client-menu.jsp" %>
	<div>${message}</div>

	<sf:form id="submit-quantity" action="submit-quantity" method="post" >
		<div class="card">
       		<div class="card-body">
       		    <h3>Please enter quantity </h3>

       		    <br>

	       		<div class="form-floating mb-3">
                    <input  type="number" class="form-control" id="floatingInput" name="requestedQuantity" required="required"/>
                    <label for="floatingInput" name="requestedQuantity">Quantity</label>
				</div>
				<br>
				<div class="form-group" style={{ padding-top: 20% }}>
				<button class="btn btn-primary btn-lg" type="submit" >Enter</button>
				 <input type="hidden" value="${id}" name="id" method="post"> 
				</div>
		    </div>
		</div>
	</sf:form>
  </div>
</body>
</html>