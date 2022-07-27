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
<html>
<head>
    <title>Perfil</title>
</head>
<body>
<h1>Editar perfil....</h1>

<form action="user_controller" method="post">
    <input type="hidden" name="id" value="${usuario_logado.id}">
    <input type="text" value="${usuario_logado.name}" name="nome" id="nome">
    <input type="text" value="${usuario_logado.email}" name="email" id="email">
    <input type="text" value="${usuario_logado.senha}" name="senha" id="senha">

    <input type="hidden" name="opcao" value="editar">
    <input type="submit" value="Salvar">
</form>



<%--<button><a href="controlador?opcao=opcao">Voltar</a></button>--%>
<a href="controlador?opcao=voltar"> <input type="button" value="VOLTAR"/></a>
<br>
<a href="controlador?opcao=logout"> <input type="button" value="SAIR"/></a>
</body>
</html>
