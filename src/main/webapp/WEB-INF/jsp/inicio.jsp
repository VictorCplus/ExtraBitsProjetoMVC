<%--
  Created by IntelliJ IDEA.
  User: Aluno
  Date: 01/06/2022
  Time: 16:00
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false"%>

<!doctype html>
<html lang="pr-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Extra Bits</title>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/album/">
    <link href="<c:url value="/css/inicio.css"/>" type="text/css" rel="stylesheet">
    <style>
        h1 { color: #b48608; font-family: 'Droid serif', serif; font-size: 36px; font-weight: 400;
            font-style: italic; line-height: 44px; margin: 0 0 12px; text-align: center; }
        a {color: #ffffff;}
    </style>
</head>
<body>
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
                        <%-- Movida para dentro da div --%>
                        <%-- Verificar se o usuário está logado e exibir a mensagem --%>
                    <c:if test="${usuario_logado != null}">
                        <div class="text-end">
                            <h1>Olá ${usuario_logado.nome}</h1>
                        </div>
                    </c:if>
                        <%-- ... --%>
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

<main>
    <%--    Imagens dos slides nessa area--%>
        <section class="py-5 text-center container">
            <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <c:forEach items="${produtos}" var="produto" varStatus="status">
                        <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
                            <img class="img-slide d-block w-100" src="${produto.imagem}" alt="">
                        </div>
                    </c:forEach>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </section>
    <%--    Parte produto usuario deslogado --%>
        <c:choose>
            <c:when test="${usuario_logado == null}">
    <div class="album py-5 bg-dark" style="--bs-bg-opacity: .9">
        <div class="container">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                <c:forEach items="${produtos}" var="produto">
                    <form action="/extrabits/verProduto" method="post" id="submitForm_${produto.id_produto}">
                        <input type="hidden" name="id_produto" value="${produto.id_produto}" />
                    <div class="col">
                        <div class="card shadow-sm zoom">
                            <a href="#" onclick="document.getElementById('submitForm_${produto.id_produto}').submit();">
                                <svg class="bd-placeholder-img card-img-top" text-decoration="teste" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                                    <title>${produto.nome}</title>
                                    <image class="img-responsive" href="${produto.imagem}" height="100%" width="100%"/>
                                    <text class="text-item fw-semibold" x="50%" y="92%" fill="#ff6200">${produto.nome}</text>
                                </svg>
                            </a>
                            <div class="card-body">
                                <h5 class="card-title">Categoria: ${produto.categoria}</h5>
                                <p class="card-text description">${produto.descricao}</p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <p class="fw-bold" style="color: #ff6200;">R$ ${produto.valor}</p>
                                    </div>
                                    <div>
                                        <button class="btn btn-primary" type="submit" >Visualizar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </form>
                </c:forEach>
            </div>
        </div>
    </div>
            </c:when>
        </c:choose>
        <%--        Parte produtos do adm     --%>
        <c:choose>
            <c:when test="${usuario_logado != null && usuario_logado.permissao == 1}">
                <div class="album py-5 bg-dark" style="--bs-bg-opacity: .9">
                    <div class="container">
                        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                            <c:forEach items="${produtos}" var="produto">
                                <form action="/extrabits/editarProduto" method="post" id="submitForm_${produto.id_produto}">
                                    <input type="hidden" name="id_produto" value="${produto.id_produto}" />
                                    <div class="col">
                                        <div class="card shadow-sm zoom">
                                            <a href="#" onclick="document.getElementById('submitForm_${produto.id_produto}').submit();">
                                                <svg class="bd-placeholder-img card-img-top" text-decoration="teste" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                                                    <title>${produto.nome}</title>
                                                    <image class="img-responsive" href="${produto.imagem}" height="100%" width="100%" />
                                                    <text class="text-item fw-semibold" x="50%" y="92%" fill="#ff6200">${produto.nome}</text>
                                                </svg>
                                            </a>
                                            <div class="card-body">
                                                <h5 class="card-title">Categoria: ${produto.categoria}</h5>
                                                <p class="card-text description">${produto.descricao}</p>
                                                <div class="d-flex justify-content-between align-items-center">
                                                    <div>
                                                        <p class="fw-bold" style="color: #ff6200;">R$ ${produto.valor}</p>
                                                    </div>
                                                    <div>
                                                        <button class="btn btn-primary" type="submit">Editar</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </c:when>
        </c:choose>
        <%--        Parte produtos do usuario/cliente     --%>
        <c:choose>
            <c:when test="${usuario_logado != null && usuario_logado.permissao == 0}">
                <div class="album py-5 bg-dark" style="--bs-bg-opacity: .9">
                    <div class="container">
                        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                            <c:forEach items="${produtos}" var="produto">
                                <form action="/extrabits/verProduto" method="post" id="submitForm_${produto.id_produto}">
                                    <input type="hidden" name="id_produto" value="${produto.id_produto}" />
                                <div class="col">
                                    <div class="card shadow-sm zoom">
                                        <a href="#" onclick="document.getElementById('submitForm_${produto.id_produto}').submit();">
                                            <svg class="bd-placeholder-img card-img-top" text-decoration="teste" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false">
                                                <title>${produto.nome}</title>
                                                <image class="img-responsive" href="${produto.imagem}" height="100%" width="100%"/>
                                                <text class="text-item fw-semibold" x="50%" y="92%" fill="#ff6200">${produto.nome}</text>
                                            </svg>
                                        </a>
                                        <div class="card-body">
                                            <h5 class="card-title">Categoria: ${produto.categoria}</h5>
                                            <p class="card-text description">${produto.descricao}</p>
                                            <div class="d-flex justify-content-between align-items-center">
                                                <div>
                                                    <p class="fw-bold" style="color: #ff6200;">R$ ${produto.valor}</p>
                                                </div>
                                                <div>
                                                    <button class="btn btn-primary" onclick="exibirMensagem()">Comprar</button>
                                                    <button class="btn btn-success" onclick="exibirMensagem()">Adicionar ao Carrinho</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </form>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </c:when>
        </c:choose>
</main>
<footer class="text-muted py-5 bg-dark">
    <div class="container">
        <p class="float-end mb-1">
            <a href="#"><img src="https://thypix.com/wp-content/uploads/2020/04/white-arrow-61-700x700.png" align="right" width="10%" height="10%"></a>
        </p>
        <p class="mb-1 text-light">Garantimos sua compra com 100% de segurança.</p>
        <p class="mb-0 text-light">Precisa de ajuda ?<a href="/"> Clique aqui </a> ,ou converse um de nossos atendentes <a href="../getting-started/introduction/">no nosso chat</a>.</p>
    </div>
</footer>
<script>
    const descriptions = document.querySelectorAll('.card-text.description');
    const maxDescriptionLength = 140; // Tamanho máximo da descrição em caracteres

    descriptions.forEach((description) => {
        const text = description.textContent;
        if (text.length > maxDescriptionLength) {
            const truncatedText = text.slice(0, maxDescriptionLength) + '...';
            description.textContent = truncatedText;
        }
    });

    function exibirMensagem() {
        alert("Por favor, faça login antes de comprar ou adicionar ao carrinho.");
        window.location.href = "login"; // Substitua "pagina_de_login.html" pelo URL da sua página de login
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
