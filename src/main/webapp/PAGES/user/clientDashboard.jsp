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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/navbar-static/">
<!-- Bootstrap core CSS -->
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

    <main>
      <div class="container py-4">
      <%@ include file="../includes/client-menu.jsp" %>

        <div class="p-5 mb-4 bg-light rounded-3">
          <div class="container-fluid py-5">
            <h1 class="display-5 fw-bold">Start a new order</h1>
            <p class="col-md-8 fs-4">Click here to place an new order. Our warehouse admins will review and dispatch it within 24 hours. </p>
            <a class="btn btn-primary btn-lg" type="button" href="open-order">Start order</a>
          </div>
        </div>

        <div class="row align-items-md-stretch">
          <div class="col-md-6">
            <div class="h-100 p-5 text-white bg-dark rounded-3">
              <h2>View your orders</h2>
              <p>Click here to view your order, along with the status updated from our warehouse admins</p>
              <a class="btn btn-outline-light" type="button" href="basketsByClient">View Orders</a>
            </div>
          </div>
          <div class="col-md-6">
            <div class="h-100 p-5 bg-light border rounded-3">
              <h2>Go to your profile</h2>
              <p>Click here to view your profiles details and credentials</p>
              <a class="btn btn-outline-secondary" type="button" href="UserProfile">My profile</a>
            </div>
          </div>
        </div>



        <footer class="pt-3 mt-4 text-muted border-top"/>


      </div>
    </main>


</body>
</html>