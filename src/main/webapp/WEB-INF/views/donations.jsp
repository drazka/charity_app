<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html>
<html lang="pl">
<head>
    <%@ include file="/WEB-INF/views/commons/style.jsp" %>
    <link rel="stylesheet" href="<c:url value="/resources/css/sb-admin-2.min.css"/>"/>
    <link rel="stylesheet" href="<c:url value="resources/css/style.css"/>"/>

</head>
<body>
<header>
    <%@ include file="/WEB-INF/views/commons/header.jsp" %>


</header>

<section class="login-page">
    <h2>Moje zbiórki</h2>



        <!-- DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the https://datatables.net -->
        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h5 class="m-0 font-weight-bold text-primary"><a href="/"></a></h5>


            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                        <tr>
                            <th>Nr</th>
                            <th>Ilość worków</th>
                            <th>Kategorie</th>
                            <th>Fundacja</th>
                            <th>Data odbioru</th>
                            <th>Czas odbioru</th>
                            <th>Komentarz</th>
                            <th>Dar oddany</th>
                            <th>Link</th>

                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <th>Nr</th>
                            <th>Ilość workóœ</th>
                            <th>Kategorie</th>
                            <th>Fundacja</th>
                            <th>Data odbioru</th>
                            <th>Czas odbioru</th>
                            <th>Komentarz</th>
                            <th>Dar oddany</th>
                            <th>Link</th>
                        </tr>
                        </tfoot>
                        <tbody>
                        <c:forEach items="${userDonations}" var="donation" varStatus="theCount">
                            <tr>
                                <th scope="row">${theCount.count}</th>
                                <td>${donation.quantity}</td>
                                <td>
                                    <c:forEach items="${donation.categories}" var="category">
                                        <li>${category.name}</li>
                                    </c:forEach>
                                </td>
                                <td>${donation.institution.name}</td>
                                <td>${donation.pickUpDate}</td>
                                <td>${donation.pickUpTime}</td>
                                <td>${donation.pickUpComment}</td>
                                <td>${donation.given}</td>
                                <td><a href="/donationDetails/${donation.id}">Szczegóły←</a> </td>
                            </tr>
                        </c:forEach> <br />
                        </tbody>
                    </table>
                </div>
            </div>
        </div>



</section>

<%@ include file="/WEB-INF/views/commons/footer.jsp" %>
<%@ include file="/WEB-INF/views/admin/commons/javaS.jsp" %>
</body>
</html>
