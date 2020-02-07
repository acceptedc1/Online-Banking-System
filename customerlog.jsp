<%-- 
    Document   : customerlog.jsp
    Created on : Jun 29, 2019, 2:54:51 PM
    Author     : Srini-w10
--%>
<%
    if(request.getSession().getAttribute("accno")!=null)
    {
        response.sendRedirect("custhome.jsp");
    }
%>


    
    <!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.5">
    <title>Signin Template · Bootstrap</title>

    <link rel="canonical" href="bootstrap-4.3.1-dist">

    <!-- Bootstrap core CSS -->
<link href="bootstrap-4.3.1-dist" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    <!-- Custom styles for this template -->
    <link href="signin.css" rel="stylesheet">
  </head>
  <body class="text-center">
    <form class="form-signin" action="custlog.jsp">
  <img class="mb-4" src="Logo-1561698424784.png" alt="" width="72" height="72">
  <h1 class="h3 mb-3 font-weight-normal">Customer Login</h1>
  <label for="number" class="sr-only">Account No.</label>
  <input type="text" name="accno" class="form-control" placeholder="Account no." required autofocus>
  <label for="inputPassword" class="sr-only">Password</label>
  <input type="password" name="pass" class="form-control" placeholder="Password" required>
  <div class="checkbox mb-3">
    <label>
      <input type="checkbox" value="remember-me"> Remember me
    </label>
  </div>
  <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
  <p class="mt-5 mb-3 text-muted">&copy; 2019-2020</p>
</form>
</body>
</html>
