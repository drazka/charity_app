<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<nav class="container container--70">
    <c:if test="${pageContext.request.userPrincipal.name == null}">
        <ul class="nav--actions">
            <li><a href="/login" class="btn btn--small btn--without-border">Zaloguj</a></li>
            <li><a href="/register" class="btn btn--small btn--highlighted">Załóż konto</a></li>
        </ul>
        <ul>
            <li><a href="#start" class="btn btn--without-border active">Start</a></li>
            <li><a href="#information" class="btn btn--without-border">O co chodzi?</a></li>
            <li><a href="#about" class="btn btn--without-border">O nas</a></li>
            <li><a href="#help" class="btn btn--without-border">Fundacje i organizacje</a></li>
            <li><a href="#contact" class="btn btn--without-border">Kontakt</a></li>
        </ul>
    </c:if>
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <ul class="nav--actions">
            <li class="logged-user">
                Witaj ${pageContext.request.userPrincipal.name}
                <ul class="dropdown">
                    <li><a href="/profil">Profil</a></li>
                    <li><a href="/password">Zmiana hasła</a></li>
                    <li><a href="#">Moje zbiórki</a></li>
                    <li>
                        <form id="logoutForm" method="POST" action="${contextPath}/logout">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </form>
                        <a onclick="document.forms['logoutForm']
                  .submit()">Logout</a>
                    </li>
                </ul>
            </li>
        </ul>

        <ul>
            <li><a href="/#start" class="btn btn--without-border active">Start</a></li>
            <li><a href="/#information" class="btn btn--without-border">O co chodzi?</a></li>
            <li><a href="/donation" class="btn btn--without-border">Oddaj niepotrzebne rzeczy</a></li>
            <li><a href="/#about" class="btn btn--without-border">O nas</a></li>
            <li><a href="/#help" class="btn btn--without-border">Fundacje i organizacje</a></li>
            <li><a href="/#contact" class="btn btn--without-border">Kontakt</a></li>
            <sec:authorize access="hasRole('ADMIN')">
                <li><a href="/admin/" class="btn btn--without-border">Strona Administratora</a></li>
            </sec:authorize>
        </ul>
    </c:if>
</nav>
<c:if test="${pageContext.request.userPrincipal.name == null}">
<div class="slogan container container--90">
    <div class="slogan--item">
        <h1>
            Zacznij pomagać!<br/>
            Oddaj niechciane rzeczy w zaufane ręce
        </h1>
    </div>
</div>
</c:if>
<c:if test="${pageContext.request.userPrincipal.name != null}">
<div class="slogan container container--90">
    <div class="slogan--item">
        <h1>
            Oddaj rzeczy, których już nie chcesz<br />
            <span class="uppercase">potrzebującym</span>
        </h1>
    </div>
</div>
</c:if>