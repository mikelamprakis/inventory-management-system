<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/pure-min.css">
<link rel="stylesheet" href="css/custom.css">
<title>Main Administration Page</title>
</head>
<body>
 <main>
    <%@ include file="../includes/admin-menu.jsp" %>
    <div class="container">

        <h1>Main Administration Page</h1>
        <hr/>

          <div class="bg-light p-5 rounded">
            <h1>Hello ${user.username}</h1>
            <p class="lead">This is the main administrator page. Please use the sidebar menu to navigate around the inventory  system.
             </p>
            <p class="lead"></p>
            <a class="btn btn-lg btn-primary" href="AllBaskets" role="button">View Orders &raquo;</a>
          </div>


    </div>
 </main>
</body>
</html>