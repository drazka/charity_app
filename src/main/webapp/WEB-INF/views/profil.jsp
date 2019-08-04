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
    <h2>Twoje dane</h2>
    <form:form method="POST" modelAttribute="user" class="bg-light p-5 contact-form">
        <spring:bind path="firstName">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <h3 for="inputFirstName">Imię</h3>
                <form:input type="text" path="firstName" class="form-control" placeholder="First Name"
                            autofocus="true" id="inputFirstName"></form:input>
                <form:errors path="firstName"></form:errors>
            </div>
        </spring:bind>
        <spring:bind path="lastName">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <h3 for="inputFirstName">Nazwisko</h3>
                <form:input type="text" path="lastName" class="form-control" placeholder="Last Name"
                            autofocus="true"></form:input>
                <form:errors path="lastName"></form:errors>
            </div>
        </spring:bind>
        <spring:bind path="username">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <h3 for="inputFirstName">Login</h3>
                <form:input type="text" path="username" class="form-control" placeholder="Username"
                            autofocus="true"></form:input>
                <form:errors path="username"></form:errors>
            </div>
        </spring:bind>
        <spring:bind path="email">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <h3 for="inputFirstName">Email</h3>
                <form:input type="text" path="email" class="form-control" placeholder="email"
                            autofocus="true"></form:input>
                <form:errors path="email"></form:errors>
            </div>
        </spring:bind>
        <form:hidden path="password"></form:hidden>
        <div class="form-group form-group--buttons">
            <button class="btn" type="submit">Akceptuj zmiany</button>
            <a href="/password" class="btn">Zmień hasło</a>
        </div>
    </form:form>
</section>

<%@ include file="/WEB-INF/views/commons/footer.jsp" %>
</body>
</html>
