<%--
  Created by IntelliJ IDEA.
  User: Aluno
  Date: 04/05/2022
  Time: 15:49
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false"%>


<!doctype html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <link href="<c:url value="/css/login.css"/>" type="text/css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="signin.css" rel="stylesheet">

</head>
<body class="text-center vh-100 bg-image"
      style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">>


<main class="form-signin w-100 m-auto">

    <form action="login" method="post">
        <a href="home"><img class="mb-4" src="https://icon-library.com/images/white-gear-icon-png/white-gear-icon-png-16.jpg

" alt="" width="72" height="57"></a>
        <h1 class="h3 mb-3 fw-normal">Por favor faça Login</h1>

        <div class="form-floating">
            <input type="email" class="form-control" id="floatingInput" placeholder="nome@exemplo.com"  name="email" required>
            <label for="floatingInput">Email:</label>
        </div>
        <div class="form-floating">
            <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="senha" required>
            <label for="floatingPassword">Senha:</label>
        </div>

        <div class="checkbox mb-3">
            <label>
                <input type="checkbox" value="remember-me"> Lembre-me
            </label>
        </div>
        <button class="w-100 btn btn-lg btn-primary" type="submit" value="Login" name="login">Login</button>
    </form>
    <br>
    <a href="home"><button class="w-50 btn btn-lg btn-danger" value="Voltar" name="voltar">Voltar</button></a>

    <c:if test="${not empty erro}">
        <h2>
            <b>${erro}</b>
        </h2>
    </c:if>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>

