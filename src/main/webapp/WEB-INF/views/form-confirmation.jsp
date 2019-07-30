<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="pl">
  <head>
    <%@ include file="/WEB-INF/views/commons/style.jsp" %>
  </head>
  <body>
    <header class="header--form-page">
      <nav class="container container--70">
        <ul class="nav--actions">
          <li class="logged-user">
            Witaj ${pageContext.request.userPrincipal.name}
            <ul class="dropdown">
              <li><a href="#">Profil</a></li>
              <li><a href="#">Ustawienia</a></li>
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

        <%@ include file="/WEB-INF/views/commons/header.jsp" %>
      </nav>

      <div class="slogan container container--90">
          <h2>
            Dziękujemy za przesłanie formularza Na maila prześlemy wszelkie
            informacje o odbiorze.
          </h2>
      </div>
    </header>

    <%@ include file="/WEB-INF/views/commons/footer.jsp" %>
  </body>
</html>
