<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html lang="pl">
<head>
    <%@ include file="/WEB-INF/views/commons/style.jsp" %>
</head>
<body>
<header class="header--main-page">
    <%@ include file="/WEB-INF/views/commons/header.jsp" %>
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
                    informacja o darze
                </h1>
                <h1> Ilość przekazanych worków: ${donation.quantity} <br>
                    Nazwa instytucji: ${donation.institution.name}<br>
                    Data utworzenia wpisu:<tags:localDate date="${donation.created}" pattern="dd-MMM-yyyy"/> <br>
                    Zawartość:
                    <c:forEach items="${donation.categories}" var="category">
                        <li>${category.name}</li>

                    </c:forEach>
                    Przekazane: ${donation.given}<br>
                    Data przekazania: <fmt:formatDate value="${donation.givenDate}" pattern="dd-MMM-yyyy"/> <br>
                </h1>
                <h2>
                    <a href="/donationDetails/${donation.id}/edit">Edytuj</a>
                </h2>
            </div>
        </div>
    </c:if>
</header>


<%@ include file="/WEB-INF/views/commons/footer.jsp" %>


</body>
</html>
