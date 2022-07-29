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

<form action="/extrabits/editarperf" method="post">
    <input type="hidden" name="id" value="${usuario_logado.id_usuario}">
    <input type="text" value="${usuario_logado.nome}" name="nome" id="nome">
    <input type="text" value="${usuario_logado.email}" name="email" id="email">
    <input type="text" value="${usuario_logado.cpf}" name="cpf" id="cpf">
    <input type="text" value="${usuario_logado.senha}" name="senha" id="senha">
    <input type="text" value="${usuario_logado.telefone}" name="telefone" id="telefone">
    <input type="date" value="${usuario_logado.data_nascimento}" name="data_nascimento" id="data_nascimento">

    <input type="hidden" name="opcao" value="editar">
    <input type="submit" value="Salvar">
</form>


<%--const data = '2020-10-20'.split('-').reverse().join('/');--%>

<h1>Conta criada em <input type="date" value="${usuario_logado.data_cadastro}" style="border: none; background: transparent; font-weight: bold; font-family: 'Arial Black'; font-size: large" disabled></h1>

<%--<button><a href="controlador?opcao=opcao">Voltar</a></button>--%>
<a href="home"> <input type="button" value="VOLTAR" /></a>
</body>
</html>
