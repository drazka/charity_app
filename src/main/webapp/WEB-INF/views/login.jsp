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
  <header>
  <%@ include file="/WEB-INF/views/commons/header.jsp" %>
  </header>

      <section class="login-page">
      <h2>Zaloguj się</h2>

      <form method="POST">
        <div class="form-group" ${error != null ? 'has-error' : ''}">
        <span>${message}</span>
        <input name="username" type="text" class="form-control" placeholder="Username"
               autofocus="true"/>
        <input name="password" type="password" class="form-control" placeholder="Password"/>
        <span>${error}</span>
        <a href="#" class="btn btn--small btn--without-border reset-password">Przypomnij hasło</a>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>


        </div>

        <div class="form-group form-group--buttons">
          <a href="/register" class="btn btnWhite">Załóż konto</a>
          <button class="btn btnWhite" type="submit">Zaloguj się</button>
        </div>
      </form>
      </section>

    <%@ include file="/WEB-INF/views/commons/footer.jsp" %>
  </body>
</html>
