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

    <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        html,
        body {
            height: 100%;
        }

        body {
            display: flex;
            align-items: center;
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #f5f5f5;
        }

        .form-signin {
            max-width: 330px;
            padding: 15px;
        }

        .form-signin .form-floating:focus-within {
            z-index: 2;
        }

        .form-signin input[type="email"] {
            margin-bottom: -1px;
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;
        }

        .form-signin input[type="password"] {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }

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

        .b-example-divider {
            height: 3rem;
            background-color: rgba(0, 0, 0, .1);
            border: solid rgba(0, 0, 0, .15);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
        }

        .b-example-vr {
            flex-shrink: 0;
            width: 1.5rem;
            height: 100vh;
        }

        .bi {
            vertical-align: -.125em;
            fill: currentColor;
        }

        .nav-scroller {
            position: relative;
            z-index: 2;
            height: 2.75rem;
            overflow-y: hidden;
        }

        .nav-scroller .nav {
            display: flex;
            flex-wrap: nowrap;
            padding-bottom: 1rem;
            margin-top: -1px;
            overflow-x: auto;
            text-align: center;
            white-space: nowrap;
            -webkit-overflow-scrolling: touch;
        }
    </style>

    <!-- Custom styles for this template -->
    <link href="signin.css" rel="stylesheet">

</head>
<body class="text-center vh-100 bg-image"
      style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">>


<%--<nav class="navbar bg-light">--%>
<%--    <div class="container-fluid">--%>
<%--        <a class="navbar-brand" href="controlador?opcao=inicio">--%>
<%--            <img src="/docs/5.2/assets/brand/bootstrap-logo.svg" alt="" width="30" height="24" class="d-inline-block align-text-top">--%>
<%--            HardwareHere--%>
<%--        </a>--%>
<%--    </div>--%>
<%--</nav>--%>


<main class="form-signin w-100 m-auto">

    <form action="login" method="post">
        <a href="controlador?opcao=voltar"><img class="mb-4" src="https://www.pngitem.com/pimgs/m/463-4634301_hardware-logo-on-black-background-hd-png-download.png" alt="" width="72" height="57"></a>
        <h1 class="h3 mb-3 fw-normal">Por favor faça Login</h1>

        <div class="form-floating">
            <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com"  name="email" required>
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



<%--<form action="login" method="post">--%>
<%--    <label for="email" id="email"><b>Email: </b></label>--%>
<%--    <input type="text"--%>
<%--           placeholder="email"--%>
<%--           name="email" required>--%>



<%--    <form action="login" method="post" class="container-sm">--%>
<%--        <div class="row mb-3">--%>
<%--            <label for="email" class="col-sm-2 col-form-label" id="email">Email: </label>--%>

<%--                <input type="email" class="form-control" name="email" required>--%>

<%--        </div>--%>
<%--        <div class="row mb-3">--%>
<%--            <label for="senha" class="col-sm-2 col-form-label" id="senha">Senha: </label>--%>

<%--                <input type="password" class="form-control"  name="senha" required>--%>

<%--        </div>--%>
<%--        <button type="submit" value="Login" name="login" class="btn btn-primary">Login</button>--%>
<%--        <a href="controlador?opcao=cadastro"><button type="button", class="btn btn-primary" name="cadastro">Cadastre-se aqui !!!</button></a>--%>
<%--    </form>--%>




<%--    <label for="senha" id="senha"><b>Senha: </b></label>--%>

<%--    <input type="password"--%>
<%--           placeholder="senha"--%>
<%--           name="senha" required>--%>

<%--    <input type="submit" value="Login" name="login">--%>
<%--</form>--%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>

