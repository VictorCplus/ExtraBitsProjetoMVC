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
<!DOCTYPE html>
<c:choose>
    <c:when test="${usuario_logado != null && usuario_logado.permissao == 1}">
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
</header>

<div class="container rounded bg-white mt-5 mb-5">
    <div class="row">
        <div class="col-md-3 border-right">
            <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                <img class="rounded-circle mt-5" width="150px" src="${produto.imagem}">
                <span class="font-weight-bold">${produto.nome}</span>
            </div>
            <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                <h2 style="font-size: 20px; font-weight: normal; font-family: sans-serif;">Adicionado em:
                    <input class="d-flex flex-column align-items-center text-center" type="date" value="${produto.data_adicionado}" style="border: none; background: transparent; font-weight: normal; font-family: sans-serif; font-size: 20px;" disabled></h2>
            </div>
            <div class="d-flex flex-column align-items-center text-center p-3 py-10">
                <form action="/extrabits/deletarProduto" method="post">
                    <div>
                        <input type="hidden" name="id_produto" value="${produto.id_produto}">
                        <button class="w-90 btn btn-lg btn-danger" type="submit" name="remover" onclick="return confirm('Deseja remover este produto? Cuidado, essa ação não pode ser desfeita após confirmada!')">Remover</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-md-5 border-right">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-right">Editando produto: ${produto.nome}</h4>
                </div>
                <form action="/extrabits/editProduto" method="post">
                    <input type="hidden" name="id_produto" value="${produto.id_produto}">
                    <div class="row mt-2">
                        <div class="col-md-12">
                            <label class="labels">Nome</label>
                            <input type="text" class="form-control" value="${produto.nome}" name="nome" id="nome">
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-md-12">
                            <label class="labels" for="imagem" >Link da imagem do produto: </label>
                            <input type="text" id="imagem" class="form-control form-control-lg" value="${produto.imagem}" name="imagem">
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-12">
                            <label class="labels">Categoria do produto: ${produto.categoria}</label>
                            <div class="col-md-12">
                                <label for="categoria-select">Selecione outra categoria:</label>
                                <select name="categoria" id="categoria-select">
                                    <option value="">Selecionar</option>
                                    <option value="Placas de videos">Placa de vídeo</option>
                                    <option value="Processadores">Processador</option>
                                    <option value="Fontes">Fonte</option>
                                    <option value="Memorias">Memórias</option>
                                    <option value="Water Coolers">Water Cooler</option>
                                    <option value="Placas Maes">Placa Mãe</option>
                                    <option value="SSD/HD">SSD/HD</option>
                                    <option value="Outros">Outros</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-12">
                            <label class="labels">Descrição:</label>
                            <textarea id="input-produto-descricao" rows="3" name="descricao" class="form-control">${produto.descricao}</textarea>
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col-md-12">
                            <label class="labels">Preço</label>
                            <input type="text" name="valor" value="${produto.valor}" class="form-control" placeholder="R$">
                        </div>
                    </div>
                    <div class="mt-3 p-2 py-2 text-center">
                        <button type="submit" name="editarperf" class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Confirmar</button>
                        <a href="home" type="button" class="w-10 btn btn-lg btn-secondary">Cancelar</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
    </c:when>
    <c:otherwise>
        <c:redirect url="home"></c:redirect>
    </c:otherwise>
</c:choose>