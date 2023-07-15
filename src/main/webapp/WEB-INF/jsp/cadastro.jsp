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
<c:choose>
    <c:when test="${usuario_logado == null}">
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cadastro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <script type="text/javascript" src="js/jquery-1.2.6.min.js"></script>
    <script type="text/javascript" src="js/jquery.maskedinput.min.js"/></script>
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
            <a href="home" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
            </a>

            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                <li><a href="home" class="nav-link px-2 text-secondary"><img src="https://icon-library.com/images/white-gear-icon-png/white-gear-icon-png-16.jpg" alt="" width="50" height="50" class="d-inline-block align-text-center"> Extra Bits</a></li>
            </ul>
        </div>
    </div>
</header>
<section class="vh-100% bg-image"
         style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">
    <div class="mask d-flex align-items-center h-100 gradient-custom-3">
        <div class="container h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                    <div class="card" style="border-radius: 15px;">
                        <div class="card-body p-5">
                            <h2 class="text-uppercase text-center mb-5">Cadastrar uma conta</h2>

                            <form action="/extrabits/cadastro" method="post" id="formularioCadastro">

                                <div class="form-outline mb-4">
                                    <input type="text" id="nome" class="form-control form-control-lg" name="nome" required/>
                                    <label class="form-label" for="nome">Seu Nome</label>
                                </div>

                                <div class="form-outline mb-4">
                                    <input type="email" id="email" class="form-control form-control-lg" name="email" required/>
                                    <label class="form-label" for="email">Seu Email</label>
                                </div>

                                <div class="form-outline mb-4">
                                    <input type="text" id="cpf" oninput="mascara(this)" class="form-control form-control-lg" name="cpf" required/>
                                    <label class="form-label" for="cpf">Seu CPF  *Digite apenas números.</label>
                                </div>

                                <div class="form-outline mb-4">
                                    <input type="text" id="telefone" onkeydown="return mascaraTelefone(event)" class="form-control form-control-lg" name="telefone" required/>
                                    <label class="form-label" for="telefone">Seu Telefone  *Digite apenas números.</label>
                                </div>

                                <div class="form-outline mb-4">
                                    <input type="date" id="data_nascimento" class="form-control form-control-lg" name="data_nascimento" required/>
                                    <label class="form-label" for="data_nascimento">Sua Data de Nascimento</label>
                                </div>

                                <div class="form-outline mb-4">
                                    <input type="password" id="passwd" class="form-control form-control-lg" name="senha" required/>
                                    <label class="form-label" >Sua Senha</label>
                                </div>

                                <div class="form-outline mb-4">
                                    <input type="password" id="passwdConfirmar" class="form-control form-control-lg" />
                                    <label class="form-label" >Repita sua senha</label>
                                </div>

                                <div class="d-flex justify-content-center">
<%--                                    <input type="submit" value="CADASTRAR" name="cadastro">--%>
                                    <button type="button" name="cadastro" value="Cadastrar" onclick="checarSenha()"
                                            class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Cadastrar</button>
                                </div>
                                <p class="text-center text-muted mt-5 mb-0">Já possui uma conta ? <a href="login"
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

<script>
    function checarSenha() {
        var inputPasswd = document.querySelector("#passwd");
        var inputPasswdConfirmar = document.querySelector("#passwdConfirmar");
        var passwd = inputPasswd.value;
        var passwdConfirmar = inputPasswdConfirmar.value;
        if (passwd == passwdConfirmar) {
            document.getElementById("formularioCadastro").submit();
        } else {
            alert("As senhas não coincidem!");
        }
    }
    function mascara(i){

        var v = i.value;

        if(isNaN(v[v.length-1])){ // impede entrar outro caractere que não seja número
            i.value = v.substring(0, v.length-1);
            return;
        }

        i.setAttribute("maxlength", "14");
        if (v.length == 3 || v.length == 7) i.value += ".";
        if (v.length == 11) i.value += "-";

    }
    function mascaraTelefone(event) {
        let tecla = event.key;
        let telefone = event.target.value.replace(/\D+/g, "");

        if (/^[0-9]$/i.test(tecla)) {
            telefone = telefone + tecla;
            let tamanho = telefone.length;

            if (tamanho >= 12) {
                return false;
            }

            if (tamanho > 10) {
                telefone = telefone.replace(/^(\d\d)(\d{5})(\d{4}).*/, "($1) $2-$3");
            } else if (tamanho > 5) {
                telefone = telefone.replace(/^(\d\d)(\d{4})(\d{0,4}).*/, "($1) $2-$3");
            } else if (tamanho > 2) {
                telefone = telefone.replace(/^(\d\d)(\d{0,5})/, "($1) $2");
            } else {
                telefone = telefone.replace(/^(\d*)/, "($1");
            }

            event.target.value = telefone;
        }

        if (!["Backspace", "Delete"].includes(tecla)) {
            return false;
        }
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>
    </c:when>
    <c:otherwise>
        <c:redirect url="home"></c:redirect>
    </c:otherwise>
</c:choose>