<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">



<title>Insert title here</title>
</head>
<body>

  <div class="container py-4">
    <%@ include file="../includes/client-menu.jsp" %>
    <h2>Checkout Page</h2>
	
	<div>${message}</div>
	<table class="table table-hover">
		<thead>
			<tr class="table-dark">
				<th scope="col">ITEM ID</th>
				<th scope="col">TITLE</th>
				<th scope="col">QUANTITY</th>
				<th scope="col">PRICE</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${fullOrder}" var="itemOrder">
		
				<tr class="table-primary">
					<td scope="row">${itemOrder.itemId}</td>
					<td scope="row">${itemOrder.itemTitle}</td>
					<td scope="row">${itemOrder.itemQuantity}</td>
					<td scope="row">${itemOrder.itemOrderCost}</td>
				</tr>
				
			</c:forEach>
		</tbody>
	</table>

	<hr/>
    <br/>

	<div class="badge bg-warning text-dark" ><h3>Total amount : ${amount}</h3></div>

	<br/>
	<br/>

    <div class="form-row">
         <form action="SubmitOrder">
                <p><input type="submit" value="Submit" class="btn btn-success"/></p>
         </form>
         <form action="CancelOrder">
            <p><input type="Submit" value="Cancel" class="btn btn-secondary"/></p>
         </form>
    <div>

  </div>



</body>
</html>