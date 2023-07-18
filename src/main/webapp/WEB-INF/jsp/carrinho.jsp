<%--
  Created by IntelliJ IDEA.
  User: Cardo
  Date: 15/07/2023
  Time: 00:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<c:choose>
  <c:when test="${usuario_logado != null && usuario_logado.permissao == 0}">
<html lang="pt-br">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
  <title>Carrinho</title>
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
                  <li><a class="dropdown-item text-white" href="/extrabits/perfil">Editar Perfil</a></li>
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
  </c:when>
</c:choose>
<main>
  <div class="container rounded bg-white mt-5 mb-5">
    <h1 class="mb-4 p-4">Seu Carrinho de Compras</h1>
    <form action="/extrabits/comprar" method="post">
      <input type="hidden" name="id_usuario" value="${usuario_logado.id_usuario}" />
      <div class="row">
        <div class="col text-center"><h5>Imagem</h5></div>
        <div class="col text-center"><h5>Nome</h5></div>
        <div class="col text-center"><h5>Preço</h5></div>
      </div>
      <ul class="list-group">
        <c:if test="${not empty produtosNoCarrinho}">
        <c:forEach items="${produtosNoCarrinho}" var="produto">
          <li class="list-group-item cart-product">
            <div class="d-flex align-items-center">
              <div class="text-center" style="flex: 1;">
                <img src="${produto.imagem}" alt="${produto.nome}" width="50" height="50">
              </div>
              <div class="text-center" style="flex: 1;">${produto.nome}</div>
              <div class="text-center cart-product-price" style="flex: 1;">R$ ${produto.valor}</div>
              <button type="button" class="btn btn-danger btn-sm btn-de-remover" data-id-produto="${produto.id_produto}">Remover</button>
            </div>
          </li>
        </c:forEach>
      </ul>
      <div class="mt-3 d-flex justify-content-center p-2">
        <button type="submit" class="btn btn-primary mr-2">Comprar</button>
        <a href="/extrabits/home" type="button" class="btn btn-secondary">Voltar</a>
      </div>
      </c:if>
      <c:if test="${empty produtosNoCarrinho}">
        <div class="mt-3 d-flex justify-content-center p-2">
          <a href="/extrabits/home" type="button" class="btn btn-secondary p-2">Voltar</a>
        </div>
      </c:if>
    </form>
    <div id="totalPrice" class="mt-3 d-flex justify-content-end p-4">
      <span></span>
    </div>
  </div>
</main>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
  // Função de remover do carrinho
  $(document).ready(function() {
    $(".btn-de-remover").click(function(event) {
      event.preventDefault(); // Evita o comportamento padrão do botão de enviar

      // Captura o ID do produto a ser removido a partir do atributo data-id-produto
      var id_produto = $(this).data("id-produto");

      // Realiza a solicitação AJAX para remover o produto do carrinho
      $.ajax({
        type: "GET",
        url: "/extrabits/remover-do-carrinho?id_produto=" + id_produto,
        success: function(data) {
          // Recarrega a página para atualizar a lista após a remoção do produto
          location.reload();
        },
        error: function() {
          alert("Ocorreu um erro ao remover o produto do carrinho.");
        }

      });
    });
    calcularTotalCarrinho();
  });
  // Função para calcular o total do carrinho
  function calcularTotalCarrinho() {

    const precoElements = document.querySelectorAll(".cart-product-price");

    let totalCarrinho = 0;


    precoElements.forEach((element) => {

      const precoText = element.innerText;
      const preco = parseFloat(precoText.replace("R$ ", "").replace(",", "."));
      totalCarrinho += preco;
    });

    const totalFormatted = totalCarrinho.toFixed(2);


    document.getElementById("totalPrice").innerText = `Total: R$ `+totalFormatted;
  }

</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
  </c:when>
  <c:otherwise>
    <c:redirect url="home"></c:redirect>
  </c:otherwise>
</c:choose>
