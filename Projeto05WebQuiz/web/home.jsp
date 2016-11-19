<%@page import="com.projeto05.quiz.Quiz"%>
<%@page import="com.projeto05.quiz.Users"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/header.jspf" %>
<%
    HttpSession sessao = request.getSession();
    ArrayList<Users> user = Quiz.getUser();
    if(sessao.getAttribute("user")==null){
        sessao.setAttribute("user", user);
    }
    user = (ArrayList<Users>) sessao.getAttribute("user");
%>
<h2>Regra de três simples é um processo prático para resolver problemas que envolvam quatro valores dos quais conhecemos três deles. </h2>
<p>Devemos, portanto, determinar um valor a partir dos três já conhecidos.</p>
<p>Passos utilizados numa regra de três simples:</p>
<ul>
    <li> 1º) Construir uma tabela, agrupando as grandezas da mesma espécie em colunase mantendo na mesma linha as grandezas de espécies diferentes em correspondência.</li>
    <li> 2º) Identificar se as grandezas são diretamente ou inversamente proporcionais.</li>
    <li>3º) Montar a proporção e resolver a equação.</li>
</ul>
<p>Vamos Praticar!!</p>

<%if (sessao.getAttribute("sessao") == "none" || sessao.getAttribute("sessao") == null) {%>
<h3 align="center">Insira Seu Nome Para Brincar! :)</h3>
<form align="center" action="sessao.jsp" class="form-inline">
    <div class="form-group">
        <label for="nome">Nome:</label>
        <input type="text" name="nome" id="nome" class="form-control" autofocus/>
        <input type="submit" value="Entrar" name="Entrar" class="btn btn-success" id="login"/>
    </div>
</form>
<%} else {%>

<form action="sessao.jsp" class="form-inline">
    <label for="end"> Nome:<%=sessao.getAttribute("sessao")%></label>
    <input type="submit" name="sair" value="Sair" class="btn btn-success"/>
</form>
    <form action="teste.jsp" method="post">
        <input type="hidden" name="nomeHome" value="<%=sessao.getAttribute("sessao")%>"/>
        <input class="btn btn-success" type="submit" value="Iniciar Teste"/>               
    </form>

<%}%>

<table class="table">
    <tr>
        <th>NOME</th>
        <th>ULTIMA NOTA</th>
        <th>MEDIA</th>
        <th>QTD TESTES</th>
        <th>SOMA %</th>
        <th></th>
    </tr>
    <% for (Users u : user) {%>
    <tr>
    <form action="teste.jsp" method="Post">
        <td><input type="text" name="nomeHome" class="form-control" value="<%=u.getName()%>" readonly/></td>
        <td><%= 100.0 * u.getUserLastGrade()%>%</td>
        <td><%= 100.0 * u.getUserGradeAverage()%>%</td>
        <td><%= u.getUserTestsCount()%></td>
        <td><%= 100.0 * u.getUserTestsGradeSum()%>%</td>
        <%if(u.getUserType()!= 1){%>
        <td><input class="btn btn-success" type="submit" value="Iniciar Teste"/></td>
        <%}else{%>
        <td></td>
        <%}%>
    </form>
</tr>
<%}%>
</table>


