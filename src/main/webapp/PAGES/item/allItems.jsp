<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/pure-min.css">
<link rel="stylesheet" href="css/custom.css">
<title>Inventory</title>
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
	<h2>Inventory</h2>
	<hr/>
    <span class="form-error">${errorMessage}</span>

	<table class="table table-bordered table-hover">
		<thead>
			<tr>
			    <th align="left">Title</th>
			    <th align="left">Product Code</th>
			    <th align="left">Update Date</th>
			    <th align="left">Stock</th>
			    <th align="left">Price</th> 
			    <th align="left">Suppliers</th>
			    <th align="left">Categories</th>
			</tr>
		<thead>
		<tbody>
			<c:forEach items="${items}" var="item">
				<tr class="table-primary">
					<td scope="row">
						<a class="badge bg-secondary" href="EditItem?id=${item.id}">
							${item.title}
						</a>
					</td>
					<td>${item.productCode}</td>
					<td>${item.updateDateFormatted}</td>
					<td>${item.stock}</td>
					<td>${item.priceFormatted}</td>
					<td>
                    	<c:forEach items="${item.suppliers}" var="supplier">
                    		<div>${supplier.name}</div>
                    	</c:forEach>
                    </td>
					<td>
						<c:forEach items="${item.categories}" var="category">
							<div>${category.name}</div>
						</c:forEach>
					</td>
				</tr>
			</c:forEach>
		</tbody>		
	</table>
	<br/>
	<div>
       <form action="AddItem" class="pure-form pure-form-stacked">
           <p><input type="submit" value="Add an Item" class="pure-button pure-button-primary"/></p>
       </form>
    </div>

	</div>



 </main>
</body>
</html>
