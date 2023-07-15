<%--
  Created by IntelliJ IDEA.
  User: Cardo
  Date: 14/07/2023
  Time: 22:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>${produto.nome}</title>
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
<c:choose>
    <c:when test="${usuario_logado == null}">
        <header class="p-3 bg-dark text-white">
            <div class="container">
                <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                    <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                        <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap">
                            <use xlink:href="#bootstrap"></use></svg>
                    </a>
                    <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                        <li><a href="home" class="nav-link px-2 text-secondary">
                            <img src="https://icon-library.com/images/white-gear-icon-png/white-gear-icon-png-16.jpg"
                                 alt="" width="50" height="50" class="d-inline-block align-text-center"> Extra Bits</a></li>
                    </ul>
                </div>
                <div class="form-group order-lg-first">
                    <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
                        <input type="search" class="form-control form-control-dark text-white bg-dark"
                               placeholder="Pesquise aqui..." aria-label="Search">
                    </form>
                </div>
            </div>

                <%--    Navbar       --%>
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <!-- Container wrapper -->
                <div class="container-fluid">
                    <!-- Collapsible wrapper -->

                    <div class="text-end collapse navbar-collapse justify-content-end">
                        <a href="login"><button type="button" class="btn btn-outline-primary" >Login</button></a>
                        <a href="cadastro"><button type="button" class="btn btn-primary" >Cadastrar</button></a>
                    </div>
                    <!-- Collapsible wrapper -->
                </div>
                <!-- Container wrapper -->
            </nav>
        </header>
    </c:when>
</c:choose>
<c:choose>
    <c:when test="${usuario_logado != null}">
        <header class="p-3 bg-dark text-white">
            <div class="container">
                <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                    <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
                        <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap">
                            <use xlink:href="#bootstrap"></use></svg>
                    </a>
                    <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
                        <li><a href="home" class="nav-link px-2 text-secondary">
                            <img src="https://icon-library.com/images/white-gear-icon-png/white-gear-icon-png-16.jpg"
                                 alt="" width="50" height="50" class="d-inline-block align-text-center"> Extra Bits</a></li>
                    </ul>
                </div>
                <div class="form-group order-lg-first">
                    <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
                        <input type="search" class="form-control form-control-dark text-white bg-dark"
                               placeholder="Pesquise aqui..." aria-label="Search">
                    </form>
                </div>
            </div>
            <c:if test="${usuario_logado.permissao == 1}">
                <%--                Navbar do adm              --%>
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
                                    <li><a class="dropdown-item text-white" href="/extrabits/perfil">Editar Perfil</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item text-white" href="/extrabits/produto">Cadastrar Produto</a></li>
                                </ul>
                            </li>
                        </ul>
                        <div class="text-end">
                            <a href="carrinho">Carrinho</a>
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
                                    <li><a class="dropdown-item text-white" href="/extrabits/perfil">Editar Perfil</a></li>
                                </ul>
                            </li>
                        </ul>
                        <div class="text-end">
                            <a href="carrinho">Carrinho</a>
                            <a href="sair">Sair</a>
                        </div>
                        <!-- Collapsible wrapper -->
                    </div>
                    <!-- Container wrapper -->
                </nav>
            </c:if>
        </header>
    </c:when>
</c:choose>
<div class="container rounded bg-white mt-5 mb-5">
    <div class="row">
        <div class="col-md-3 border-right">
            <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                <img class="rounded-circle mt-5" width="150px" src="${produto.imagem}">
                <span class="font-weight-bold">${produto.nome}</span>
            </div>
            <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                <h2 style="font-size: 20px; font-weight: normal; font-family: sans-serif;">Adicionado em:
                    <input class="d-flex flex-column align-items-center text-center" type="date" value="${produto.data_adicionado}" style="border: none; background: transparent; font-weight: normal; font-family: sans-serif; font-size: 20px" disabled></h2>
            </div>
        </div>
        <div class="col-md-5 border-right">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-right">${produto.nome}</h4>
                </div>
                    <input type="hidden" name="id_produto" value="${produto.id_produto}">
                    <div class="row mt-3">
                        <div class="col-md-12">
                            <label class="labels">Categoria do produto</label>
                            <span class="form-control" style="border: none; background: transparent; font-weight: normal; font-family: sans-serif; font-size: 20px">${produto.categoria}</span>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-12">
                            <label class="labels">Descrição</label>
                            <textarea id="input-produto-descricao"  rows="3" name="descricao" class="form-control" disabled style="border: none; background: transparent; font-weight: normal; font-family: sans-serif; font-size: 20px">${produto.descricao}</textarea>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-12">
                            <label class="labels">Preço</label>
                            <input type="text" name="valor" value="${produto.valor}" class="form-control" placeholder="R$" disabled style="border: none; background: transparent; font-weight: normal; font-family: sans-serif; font-size: 20px">
                        </div>
                    </div>
                    <div class="mt-3 p-2 py-2 text-center">
                        <button class="btn btn-primary w-10 btn btn-lg " onclick="exibirMensagem()">Comprar</button>
                        <button class="btn btn-success w-10 btn btn-lg " onclick="exibirMensagem()">Adicionar ao Carrinho</button>
                        <a href="home" type="button" class="w-10 btn btn-lg btn-secondary">Voltar</a>
                    </div>
            </div>
        </div>
    </div>
</div>
<script>
    function exibirMensagem() {
    alert("Por favor, faça login antes de comprar ou adicionar ao carrinho.");
    window.location.href = "/extrabits/login"; // Substitua "pagina_de_login.html" pelo URL da sua página de login
}
    function adjustTextareaHeight(element) {
        element.style.height = 'auto';
        element.style.height = (element.scrollHeight) + 'px';
    }

    document.addEventListener('DOMContentLoaded', function() {
        var textarea = document.getElementById('input-produto-descricao');
        adjustTextareaHeight(textarea);

        textarea.addEventListener('input', function() {
            adjustTextareaHeight(this);
        });
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/autosize@4.0.2/dist/autosize.min.js"></script>
<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
