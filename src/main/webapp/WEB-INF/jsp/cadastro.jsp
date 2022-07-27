<%--
  Created by IntelliJ IDEA.
  User: Aluno
  Date: 20/05/2022
  Time: 16:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!doctype html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cadastro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

    <style>
        .gradient-custom-3 {
            /* fallback for old browsers */
            background: #84fab0;

            /* Chrome 10-25, Safari 5.1-6 */
            background: -webkit-linear-gradient(to right, rgba(132, 250, 176, 0.5), rgba(143, 211, 244, 0.5));

            /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
            background: linear-gradient(to right, rgba(132, 250, 176, 0.5), rgba(143, 211, 244, 0.5))
        }
        .gradient-custom-4 {
            /* fallback for old browsers */
            background: #84fab0;

            /* Chrome 10-25, Safari 5.1-6 */
            background: -webkit-linear-gradient(to right, rgba(132, 250, 176, 1), rgba(143, 211, 244, 1));

            /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
            background: linear-gradient(to right, rgba(132, 250, 176, 1), rgba(143, 211, 244, 1))
        }
    </style>
</head>
<body>

<header class="p-3 bg-dark text-white">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a href="controlador?opcao=voltar" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
            </a>

            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                <li><a href="controlador?opcao=voltar" class="nav-link px-2 text-secondary"><img src="https://www.pngitem.com/pimgs/m/463-4634301_hardware-logo-on-black-background-hd-png-download.png" alt="" width="50" height="50" class="d-inline-block align-text-center"> ToolsWare</a></li>
            </ul>
        </div>
    </div>
</header>

<script>
    function checarSenha() {
        var inputPasswd = document.querySelector("#passwd");
        var inputPasswdConfirmar = document.querySelector("#passwdConfirmar");
        var passwd = inputPasswd.value;
        var passwdConfirmar = inputPasswdConfirmar.value;
        if (passwd == passwdConfirmar){
            document.getElementById("formularioCadastro").submit();
        }
        else{
            alert("As senhas não coincidem!");
        }
    }
</script>

<section class="vh-100 bg-image"
         style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">
    <div class="mask d-flex align-items-center h-100 gradient-custom-3">
        <div class="container h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                    <div class="card" style="border-radius: 15px;">
                        <div class="card-body p-5">
                            <h2 class="text-uppercase text-center mb-5">Cadastrar uma conta</h2>

                            <form action="cadastro_usuario" method="post" id="formularioCadastro">

                                <div class="form-outline mb-4">
                                    <input type="text" id="form3Example1cg" class="form-control form-control-lg" name="nomecadastro" required/>
                                    <label class="form-label" for="form3Example1cg">Seu Nome</label>
                                </div>

                                <div class="form-outline mb-4">
                                    <input type="email" id="form3Example3cg" class="form-control form-control-lg" name="emailcadastro" required/>
                                    <label class="form-label" for="form3Example3cg">Seu Email</label>
                                </div>

                                <div class="form-outline mb-4">
                                    <input type="password" id="passwd" class="form-control form-control-lg" name="senhacadastro" required/>
                                    <label class="form-label" >Senha</label>
                                </div>

                                <div class="form-outline mb-4">
                                    <input type="password" id="passwdConfirmar" class="form-control form-control-lg" />
                                    <label class="form-label" >Repita sua senha</label>
                                </div>

                                <div class="d-flex justify-content-center">
<%--                                    <input type="submit" value="CADASTRAR" name="cadastro">--%>
                                    <button type="submit" name="cadastro" value="Cadastrar" onclick="checarSenha()"
                                            class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Cadastrar</button>
                                </div>

                                <p class="text-center text-muted mt-5 mb-0">Já possui uma conta ? <a href="controlador?opcao=login"
                                                                                                        class="fw-bold text-body"><u>Faça Login</u></a></p>
                            </form>

                            <c:if test="${not empty erro}">
                                <h2>
                                    <b>${erro}</b>
                                </h2>
                            </c:if>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%--<form action="cadastro" method="post" >--%>
<%--    <h1>Cadastro Usuário</h1>--%>
<%--    <div class="mb-3">--%>
<%--        <label class="form-label" for="exampleInputnome" >Nome:</label>--%>
<%--        <input type="text" class="form-control" id="exampleInputnome" aria-describedby="nomeHelp" name="nomecadastro" required>--%>
<%--        <div id="nomeHelp" class="form-text">Digite aqui o nome.</div>--%>
<%--    </div>--%>
<%--    <div class="mb-3">--%>
<%--        <label for="exampleInputEmail1" class="form-label">Email:</label>--%>
<%--        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="emailcadastro" required>--%>
<%--        <div id="emailHelp" class="form-text">Nunca compartilharemos seu e-mail com mais ninguém.</div>--%>
<%--    </div>--%>
<%--    <div class="row g-3 align-items-center">--%>
<%--        <div class="col-auto">--%>
<%--            <label for="inputPassword6" class="col-form-label">Senha:</label>--%>
<%--            <input type="password" id="inputPassword6" class="form-control" aria-describedby="passwordHelpInline" name="senhacadastro" required>--%>
<%--            <span id="passwordHelpInline" class="form-text">--%>
<%--             Deve ter de 3 a 20 caracteres.--%>
<%--            </span>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <input type="submit" value="CADASTRAR" name="cadastro">--%>

<%--    <a href="controlador?opcao=voltar"> <input type="button" value="VOLTAR"/></a>--%>

<%--</form>--%>

<%--<c:if test="${not empty erro}">--%>
<%--    <h2>--%>
<%--        <b>${erro}</b>--%>
<%--    </h2>--%>
<%--</c:if>--%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>