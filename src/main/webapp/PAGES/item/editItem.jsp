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
<title>Editing a Book</title>
</head>
<body>
  <main>

    <%@ include file="../includes/admin-menu.jsp" %>


    <div class="container">
    <h2>Edit item</h2>
    <hr/>
	<span class="form-error">${errorMessage}</span>

	<div class="container">
	<br/>

	<span class="form-error">${errorMessage}</span>
	<sf:form method="post" action="EditOrAddItemSubmit" modelAttribute="item" class="pure-form pure-form-stacked">

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


		<sf:hidden path="id"/>
		<br/>
		<p>
			<input type="submit" value="Update" class="pure-button pure-button-primary"/>
			<input type="submit" value="Cancel" name="cancel" class="pure-button"/>
		</p>
	</sf:form>
	</div>
	</div>
	</main>
</body>
</html>