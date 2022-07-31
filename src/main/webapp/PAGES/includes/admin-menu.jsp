<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/navbar-static/">
<!-- Bootstrap core CSS -->
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/a27fadce28.js" crossorigin="anonymous"></script>


	    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      body {
        min-height: 100vh;
        min-height: -webkit-fill-available;
      }

      html {
        height: -webkit-fill-available;
      }

      main {
        display: flex;
        flex-wrap: nowrap;
        height: 100vh;
        height: -webkit-fill-available;
        max-height: 100vh;
        overflow-x: auto;
        overflow-y: hidden;
      }

      .b-example-divider {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .bi {
        vertical-align: -.125em;
        pointer-events: none;
        fill: currentColor;
      }

      .dropdown-toggle { outline: 0; }

      .nav-flush .nav-link {
        border-radius: 0;
      }

      .btn-toggle {
        display: inline-flex;
        align-items: center;
        padding: .25rem .5rem;
        font-weight: 600;
        color: rgba(136, 46, 46, 0.65);
        background-color: transparent;
        border: 0;
      }
      .btn-toggle:hover,
      .btn-toggle:focus {
        color: rgba(0, 0, 0, .85);
        background-color: #d2f4ea;
      }

      .btn-toggle::before {
        width: 1.25em;
        line-height: 0;
        content: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='rgba%280,0,0,.5%29' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M5 14l6-6-6-6'/%3e%3c/svg%3e");
        transition: transform .35s ease;
        transform-origin: .5em 50%;
      }

      .btn-toggle[aria-expanded="true"] {
        color: rgba(0, 0, 0, .85);
      }
      .btn-toggle[aria-expanded="true"]::before {
        transform: rotate(90deg);
      }

      .btn-toggle-nav a {
        display: inline-flex;
        padding: .1875rem .5rem;
        margin-top: .125rem;
        margin-left: 1.25rem;
        text-decoration: none;
      }
      .btn-toggle-nav a:hover,
      .btn-toggle-nav a:focus {
        background-color: #d2f4ea;
      }

      .scrollarea {
        overflow-y: auto;
      }

      .fw-semibold { font-weight: 600; }
      .lh-tight { line-height: 1.25; }

    </style>

  </head>
  <body>

          <div class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark" style="width: 280px;">
            <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">

              <span class="fs-4">Admin account</span>
            </a>

            <hr>

            <ul class="nav nav-pills flex-column mb-auto">
              <li class="nav-item">
                <a href="AdminHome" class="nav-link text-white" aria-current="page">
                  Home
                </a>
              </li>
              <li>
                <a href="AllItems" class="nav-link text-white">

                  Inventory
                </a>
              </li>
              <li>
                <a href="AllBaskets" class="nav-link text-white">

                  Orders
                </a>
              </li>
              <li>
                <a href="AllSuppliers" class="nav-link text-white">

                  Suppliers
                </a>
              </li>
              <li>
                <a href="UserProfile" class="nav-link text-white">
                 My profile
                </a>
              </li>

            </ul>

            <hr>


            <a href="Logout" class="d-flex align-items-center text-white text-decoration-none"  aria-expanded="false">
                <img src="https://images.unsplash.com/photo-1562907550-096d3bf9b25c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80" alt="" width="32" height="32" class="rounded-circle me-2">
                <strong>Logout</strong>
            </a>

            </div>

          </div>
          <div class="b-example-divider"></div>

</body>
