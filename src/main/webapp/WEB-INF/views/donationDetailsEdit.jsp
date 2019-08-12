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
                    poinformuj o odbiorze daru
                </h1>
                <h1> Ilość przekazanych worków: ${donation.quantity} <br>
                    Zawartość:
                    <c:forEach items="${donation.categories}" var="category">
                        <li>${category.name}</li>

                    </c:forEach>
                    <form:form method="POST" action="/donationDetails/${donation.id}/edit" modelAttribute="donation">
                    <div>
                        <form:checkbox path="given" cssStyle="zoom: 3.5"/>
                        Przekazane <br>
                        Data przekazania: <form:input path="givenDate" /> <br>
                        <!--TODO dodaj format daty albo bootstrap-->
                        <button type="submit" class="btn btnWhite">Zapisz</button>

                        </div>
                    </form:form>
                </h1>
            </div>
        </div>
    </c:if>
</header>


<%@ include file="/WEB-INF/views/commons/footer.jsp" %>


</body>
</html>
