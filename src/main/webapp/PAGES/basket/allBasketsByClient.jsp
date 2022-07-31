<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
   <head>
    <meta charset="ISO-8859-1">
    <title>Reservations</title>
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
        <h2>My orders</h2>

        <table  class="table table-hover">
            <thead>
                <tr class="table-dark">
                    <th scope="col">BASKET ID</th>
                    <th scope="col">AMOUNT</th>
                    <th scope="col">ORDER STATUS</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${baskets}" var="basket">
                    <tr class="table-light">
                        <td scope="row">${basket.id}</td>
                        <td scope="row">${basket.amount}</td>
                        <td scope="row">${basket.status.name}</td>
                        <td scope="row"><a href="deleteBasket?id=${basket.id}" method="post" class="btn btn-primary" data-bs-toggle="collapse"  role="button" aria-expanded="false" aria-controls="collapseExample"> Delete </a></td>
                    </tr>

                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>