<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/pure-min.css">
<link rel="stylesheet" href="css/custom.css">
<title>Add new Item</title>
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
    <h2>Add new item</h2>
    <hr/>
	<span class="form-error">${errorMessage}</span>

	<div class="container">
	<br/>
	<sf:form class="row g-3" method="post" action="EditOrAddItemSubmit" modelAttribute="item">

		<div class="container">
		<div class="row">
             <div class="col">
                <sf:label path="title">Title:</sf:label>
                <sf:input class="form-control" path="title" type="text" required="required" size="40" maxlength="100"/>
            </div>
            <div class="col">
                <sf:label path="productCode">Product Code:</sf:label>
                <sf:input class="form-control" path="productCode" type="text" required="required" size="16" maxlength="16"/>
            </div>
		</div>
		</div>

		<div class="container">
		<div class="row">
            <div class="col">
                <sf:label path="stock">Stock:</sf:label>
                <sf:input class="form-control" path="stock" type="text" required="required" size="5" maxlength="6"/>
            </div>
            <div class="col">
                <sf:label path="price">Price:</sf:label>
                <sf:input class="form-control" path="price" type="text" required="required" size="6" maxlength="8"/>
            </div>
		</div>
		</div>

		<br/>

		<div>
			<sf:label path="dateUpdated">Update Date:</sf:label>
			<sf:input class="form-control" path="dateUpdated" type="date" value="${item.dateUpdated}" required="required"/>
		</div>

        <br/>

		<div class="container">
        <div class="row">
            <div class="col">
               <sf:label path="suppliers">Suppliers:</sf:label>
               <sf:select class="form-control" path="suppliers" items="${allSuppliers}" itemLabel="name" itemValue="id" multiple="multiple" required="required"/>
            </div>
            <div class="col">
               <sf:label path="categories">Categories:</sf:label>
               <sf:select class="form-control" path="categories" items="${categories}" itemLabel="name" multiple="multiple" required="required"/>
            </div>
        </div>
        </div>

		<p>
			<input type="submit" value="Add" class="pure-button pure-button-primary"/>
			<input type="submit" value="Cancel" name="cancel" class="pure-button" onclick="history.go(-1); return false;"/>
		</p>
	</sf:form>
	</div>
	</div>
	</main>
</body>
</html>