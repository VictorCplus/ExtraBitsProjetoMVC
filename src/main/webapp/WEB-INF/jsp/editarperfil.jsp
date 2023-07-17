<%--
  Created by IntelliJ IDEA.
  User: Cardo
  Date: 28/06/2022
  Time: 23:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Perfil</title>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/album/">
    <style>
        body {
            background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp')
        }
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
        .form-control:focus {
            box-shadow: none;
            border-color: #84fab0
        }
        .labels {
            font-size: 11px
        }
        .olho {
            cursor: pointer;
            left: 160px;
            position: absolute;
            width: 20px;
        }
        h1 {
            color: #b48608;
            font-family: 'Droid serif', serif;
            font-size: 36px;
            font-weight: 400;
            font-style: italic;
            line-height: 44px;
            margin: 0 0 12px;
            text-align: center;
        }
        a {
            color: #ffffff;
        }
    </style>
</head>
<body class="gradient-custom-3 vh-100% bg-image">
<header class="p-3 bg-dark text-white">
    <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
            <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
            </a>
            <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                <li>
                    <a href="home" class="nav-link px-2 text-secondary">
                        <img src="https://icon-library.com/images/white-gear-icon-png/white-gear-icon-png-16.jpg" alt="" width="50" height="50" class="d-inline-block align-text-center">
                        Extra Bits
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <%--                Navbar do adm              --%>
    <c:if test="${usuario_logado.permissao == 1}">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <!-- Container wrapper -->
            <div class="container-fluid">
                <div
                        class="collapse navbar-collapse justify-content-center"
                        id="navbarCenteredExample"
                ><!-- Left links -->
                </div>
                <ul class="navbar-nav mb-2 mb-lg-0">
                    <!-- Navbar dropdown -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            Menu
                        </a>
                        <ul class="dropdown-menu bg-dark" aria-labelledby="navbarScrollingDropdown">
                            <li><a class="dropdown-item text-white" href="/extrabits/home">Página Inicial</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item text-white" href="/extrabits/produto">Cadastrar Produto</a></li>
                        </ul>
                    </li>
                </ul>
                <div class="text-end">
                    <a href="vendas">Vendas</a>
                    <a href="sair">Sair</a>
                </div>
                <!-- Collapsible wrapper -->
            </div>
            <!-- Container wrapper -->
        </nav>
    </c:if>
    <%--                Navbar do usuario/cliente              --%>
    <c:if test="${usuario_logado.permissao == 0}">
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <!-- Container wrapper -->
            <div class="container-fluid">
                <div
                        class="collapse navbar-collapse justify-content-center"
                        id="navbarCenteredExample"
                ><!-- Left links -->
                </div>
                <ul class="navbar-nav mb-2 mb-lg-0">
                    <!-- Navbar dropdown -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            Menu
                        </a>
                        <ul class="dropdown-menu bg-dark" aria-labelledby="navbarScrollingDropdown">
                            <li><a class="dropdown-item text-white" href="/extrabits/home">Página Inicial</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item text-white" href="/extrabits/compras">Compras</a></li>
                        </ul>
                    </li>
                </ul>
                <div class="text-end">
                    <a href="/extrabits/carrinho">Carrinho</a>
                    <a href="sair">Sair</a>
                </div>
                <!-- Collapsible wrapper -->
            </div>
            <!-- Container wrapper -->
        </nav>
    </c:if>
</header>
<div class="container rounded bg-white mt-5 mb-5">
    <div class="row">
        <div class="col-md-3 border-right">
            <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                <img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg">
                <span class="font-weight-bold">${usuario_logado.nome}</span>
                <span class="text-black-50">${usuario_logado.email}</span>
            </div>
            <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                <h2 style="font-size: 20px; font-weight: normal; font-family: sans-serif;">Criada em:
                    <input class="d-flex flex-column align-items-center text-center" type="date" value="${usuario_logado.data_cadastro}" style="border: none; background: transparent; font-weight: normal; font-family: sans-serif; font-size: 20px;" disabled></h2>
            </div>
            <div class="d-flex flex-column align-items-center text-center p-3 py-10">
                <form action="/extrabits/deletar" method="post">
                    <div>
                        <input type="hidden" name="id" value="${usuario_logado.id_usuario}">
                        <button class="w-90 btn btn-lg btn-danger" type="submit" name="deletar" onclick="return confirm('Deseja excluir sua conta? Cuidado, essa ação não pode ser desfeita após confirmada!')">Deletar Conta</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-md-5 border-right">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-right">Opções de Perfil</h4>
                </div>
                <form action="/extrabits/editarperf" method="post">
                    <input type="hidden" name="id" value="${usuario_logado.id_usuario}">
                    <div class="row mt-2">
                        <div class="col-md-12">
                            <label class="labels">Nome</label>
                            <input type="text" class="form-control" value="${usuario_logado.nome}" name="nome" id="nome">
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-12">
                            <label class="labels">Email</label>
                            <input type="email" class="form-control" value="${usuario_logado.email}" name="email" id="email">
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-12">
                            <label class="labels">CPF</label>
                            <input type="text" oninput="mascara(this)" class="form-control" value="${usuario_logado.cpf}" name="cpf" id="cpf">
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-12">
                            <label class="labels">Senha</label>
                            <input type="password" class="form-control" value="${usuario_logado.senha}" name="senha" id="pass">
                            <img src="https://cdn0.iconfinder.com/data/icons/ui-icons-pack/100/ui-icon-pack-14-512.png" id="olho" width="5%">
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-12">
                            <label class="labels">Telefone</label>
                            <input type="text" onkeydown="return mascaraTelefone(event)" class="form-control" value="${usuario_logado.telefone}" name="telefone" id="telefone">
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-12">
                            <label class="labels">Data de Nascimento</label>
                            <input type="date" class="form-control" value="${usuario_logado.data_nascimento}" name="data_nascimento" id="data_nascimento">
                        </div>
                    </div>
                    <div class="mt-3 p-2 py-2 text-center">
                        <button type="submit" name="editarperf" class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Salvar Perfil</button>
                        <a href="home" type="button" class="w-10 btn btn-lg btn-secondary">Cancelar</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script>
    document.getElementById('olho').addEventListener('mousedown', function() {
        document.getElementById('pass').type = 'text';
    });

    document.getElementById('olho').addEventListener('mouseup', function() {
        document.getElementById('pass').type = 'password';
    });

    // Para que o password não fique exposto após mover a imagem.
    document.getElementById('olho').addEventListener('mousemove', function() {
        document.getElementById('pass').type = 'password';
    });

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
<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>