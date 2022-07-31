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
<title>All Book Stock</title>
</head>
<body>
  <div class="container py-4">
	<%@ include file="../includes/client-menu.jsp" %>
	<h2>All Product Stock</h2>


	<span class="form-error">${message}</span>
	<table class="table table-hover  pure-table pure-table-bordered ">
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
				<tr class="table-warning">
					<td>${item.title}</td>
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
					<td scope="row">
                       <a class="badge bg-primary" href="addQuantity?id=${item.id}&id=${basket.id}"> Add </a>
                    </td>
				</tr>
			</c:forEach>
		</tbody>		
	</table>

	<a class="btn btn-success" href="checkout"> Checkout</a>
  </div>

</body>
</html>
