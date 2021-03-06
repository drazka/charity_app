<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="pl">
<head>
    <%@ include file="/WEB-INF/views/commons/style.jsp" %>
</head>
<body>
<header>
    <%@ include file="/WEB-INF/views/commons/header.jsp" %>
</header>

<section class="login-page">
    <h2>Zmień hasło</h2>
    <h3>UWAGA: po zmianie hasła zostaniesz poproszony o ponowne zalogowanie się</h3>
    <form:form method="POST" modelAttribute="user" class="bg-light p-5 contact-form">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <input type="password" name="oldPassword" id="oldPassword" placeholder="Stare hasło" >
            </div>
        <spring:bind path="password">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="password" path="password" class="form-control" placeholder="Nowe hasło"
                            autofocus="true"></form:input>
                <form:errors path="password"></form:errors>
            </div>
        </spring:bind>
        <spring:bind path="passwordConfirm">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input type="password" path="passwordConfirm" class="form-control" placeholder="Powtórz nowe hasło"
                            autofocus="true"></form:input>
                <form:errors path="passwordConfirm"></form:errors>
            </div>
        </spring:bind>
        <form:hidden name="userId" path="id"/>
        <div class="form-group form-group--buttons">
            <button class="btn" type="submit">Zmień hasło</button>
        </div>
    </form:form>
</section>

<%@ include file="/WEB-INF/views/commons/footer.jsp" %>
</body>
</html>
