<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/pure-min.css">
<link rel="stylesheet" href="css/custom.css">
<title>All Suppliers</title>
</head>
<body>
 <main>

    <%@ include file="../includes/admin-menu.jsp" %>

    <div class="container">
	<h1>Suppliers</h1>
	<hr/>

	<table class="pure-table pure-table-bordered pure-table-striped">
		<thead>
			<tr>
				<th>Name</th>
				<th>Details</th>
				<th>Description </th>
				<th>Warehouse </th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${suppliers}" var="supplier">
				<tr>
					<td><a href="EditSupplier?id=${supplier.id}">${supplier.name}</a></td>
					<td>${supplier.details}</td>
					<td>${supplier.description}</td>
					<td>
                      <c:forEach items="${supplier.warehouses}" var="address">
                    	 <div>${address.warehouse} ${address.postcode}</div>
                      </c:forEach>
                    </td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	</div>
 </main>
</body>
</html>
