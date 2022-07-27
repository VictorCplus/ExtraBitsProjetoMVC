<%--
  Created by IntelliJ IDEA.
  User: Aluno
  Date: 04/05/2022
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false"%>

<html>
<head>
    <title>Autentication</title>
</head>
<body>

<%--<h2>Id da sessao: ${pageContext.session.id}</h2>--%>
<%--<h3>data de criacao: ${pageContext.session.creationTime}</h3>--%>
<%--<h3>Ultimo acesso: ${pageContext.session.lastAccessedTime}</h3>--%>

<h1>Olá ${usuario_logado.name}</h1>

    <ul>
        <li><a href="controlador?opcao=produto">Cadastrar Produto</a></li>
        <br>
        <li><a href="controlador?opcao=editarper">Editar Perfil</a></li>
    </ul>

<a href="controlador?opcao=logout"> <input type="button" value="SAIR"/></a>

</body>
</html>
