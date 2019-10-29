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
 <h1>email potwierdzony</h1>
    <h2>  <a href="/login" >Zaloguj</a> </h2>
</section>

<%@ include file="/WEB-INF/views/commons/footer.jsp" %>
</body>
</html>
