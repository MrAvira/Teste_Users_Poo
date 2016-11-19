<%@page import="java.util.ArrayList"%>
<%@page import="com.projeto05.quiz.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.projeto05.quiz.Quiz"%>

<%
    HttpSession sessao = request.getSession();
    if (request.getParameter("nome") != null && request.getParameter("nome") != "") {
        sessao.setAttribute("sessao", request.getParameter("nome"));
        ArrayList<Users> user = Quiz.getUser();
        boolean isNewUser = false;
        for (Users u : user) {
            if (u.getName().equals(request.getParameter("nome"))) {
                isNewUser = true;
            }
            if (isNewUser) {
                Quiz newU = new Quiz();
                newU.setUser(request.getParameter("nome"));
                break;
            }
        }
        response.sendRedirect("home.jsp");
    } else if (request.getParameter("sair") != null) {
        sessao.setAttribute("sessao", "none");
        response.sendRedirect("home.jsp");
    } else {
        response.sendRedirect("home.jsp");
    }
%>
