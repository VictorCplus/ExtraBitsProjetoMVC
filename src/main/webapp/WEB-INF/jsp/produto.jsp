<%--
  Created by IntelliJ IDEA.
  User: Aluno
  Date: 11/05/2022
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<c:choose>
    <c:when test="${usuario_logado != null && usuario_logado.permissao == 1}">
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Produto</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="js/jquery-1.2.6.min.js"></script>
    <script type="text/javascript" src="js/jquery.maskedinput.min.js"></script>
    <style>
        .gradient-custom-3 {
            /* fallback for old browsers */
            background: #84fab0;
            /* Chrome 10-25, Safari 5.1-6 */
            background: -webkit-linear-gradient(to right, rgba(132, 250, 176, 0.5), rgba(143, 211, 244, 0.5));
            /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
            background: linear-gradient(to right, rgba(132, 250, 176, 0.5), rgba(143, 211, 244, 0.5));
        }
        .gradient-custom-4 {
            /* fallback for old browsers */
            background: #84fab0;
            /* Chrome 10-25, Safari 5.1-6 */
            background: -webkit-linear-gradient(to right, rgba(132, 250, 176, 1), rgba(143, 211, 244, 1));
            /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
            background: linear-gradient(to right, rgba(132, 250, 176, 1), rgba(143, 211, 244, 1));
        }
        .custom__form input {
            opacity: 0;
            height: 0;
        }
        .custom__image-container {
            display: flex;
            flex-wrap: wrap;
            gap: 0.5rem;
        }
        .custom__image-container label {
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 150%;
            cursor: pointer;
            width: 100px;
            height: 100px;
            border: solid 1px black;
            border-radius: 5px;
            object-fit: cover;
        }
        .custom__image-container img {
            width: 100px;
            height: 100px;
            border: solid 1px black;
            border-radius: 5px;
            object-fit: cover;
        }
        a {color: #ffffff;}
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
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <div class="collapse navbar-collapse justify-content-center" id="navbarCenteredExample"></div>
            <ul class="navbar-nav mb-2 mb-lg-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Menu
                    </a>
                    <ul class="dropdown-menu bg-dark" aria-labelledby="navbarScrollingDropdown">
                        <li><a class="dropdown-item text-white" href="/extrabits/home">Página Inicial</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item text-white" href="/extrabits/perfil">Editar Perfil</a></li>
                    </ul>
                </li>
            </ul>
            <div class="text-end">
                <a href="vendas">Vendas</a>
                <a href="sair">Sair</a>
            </div>
        </div>
    </nav>
</header>
<div class="container rounded bg-white mt-5 mb-5">
    <form action="/extrabits/produto" method="post" id="formProduto">
        <h1 class="text-center mb-4 p-4">Cadastro de Produto:</h1>
        <div class="d-flex justify-content-center">
            <div class="col-sm-6">
                <div class="form-outline mb-4">
                    <label class="form-label" for="imagem">Coloque um link de imagem que corresponda com o produto</label>
                    <input type="text" id="imagem" class="form-control form-control-lg" name="imagem">
                </div>
                <div class="form-outline mb-4">
                    <label class="form-label" for="nome">Nome do Produto</label>
                    <input type="text" id="nome" class="form-control form-control-lg" name="nome" required>
                </div>
                <div class="form-outline mb-4">
                    <label for="categoria-select">Selecione uma categoria:</label>
                    <select name="categoria" id="categoria-select">
                        <option value="">Selecionar</option>
                        <option value="Placas de videos">Placa de vídeo</option>
                        <option value="Processadores">Processador</option>
                        <option value="Fontes">Fonte</option>
                        <option value="Memorias">Memórias</option>
                        <option value="Water Coolers">Water Cooler</option>
                        <option value="Placas Maes">Placa Mãe</option>
                        <option value="SSD/HD">SSD/HD</option>
                    </select>
                </div>
                <div class="form-group mb-4">
                    <label for="input-produto-descricao">Descrição:</label>
                    <textarea id="input-produto-descricao" rows="3" name="descricao" class="form-control"></textarea>
                </div>
                <div class="col-sm-3">
                    <div class="form-group">
                        <label for="input-produto-preco">Preço:</label>
                        <input id="input-produto-preco" type="text" name="valor" class="form-control" placeholder="R$">
                    </div>
                </div>
            </div>
        </div>
        <div class="mt-3 p-2 py-2 text-center">
            <button class="btn btn-success btn-block btn-lg gradient-custom-4 text-body" type="submit">Cadastrar</button>
            <a href="home" type="button" class="w-10 btn btn-lg btn-secondary">Voltar</a>
        </div>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
    </c:when>
    <c:otherwise>
    <c:redirect url="home"></c:redirect>
    </c:otherwise>
</c:choose>