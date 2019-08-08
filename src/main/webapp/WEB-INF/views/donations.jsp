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
                            <th>Ilość workóœ</th>
                            <th>Kategorie</th>
                            <th>Fundacja</th>
                            <th>Miasto odbioru daru</th>
                            <th>Ulica</th>
                            <th>Kod pocztowy</th>
                            <th>Data odbioru</th>
                            <th>Czas odbioru</th>
                            <th>Nr telefonu</th>
                            <th>Komentarz</th>
                            <th>cos do wymyslenia</th>

                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <th>Nr</th>
                            <th>Ilość workóœ</th>
                            <th>Kategorie</th>
                            <th>Fundacja</th>
                            <th>Miasto odbioru daru</th>
                            <th>Ulica</th>
                            <th>Kod pocztowy</th>
                            <th>Data odbioru</th>
                            <th>Czas odbioru</th>
                            <th>Nr telefonu</th>
                            <th>Komentarz</th>
                            <th>cos do wymyslenia</th>
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
                                <td>${donation.city}</td>
                                <td>${donation.street}</td>
                                <td>${donation.zipCode}</td>
                                <td>${donation.pickUpDate}</td>
                                <td>${donation.pickUpTime}</td>
                                <td>${donation.telephoneNumber}</td>
                                <td>${donation.pickUpComment}</td>

                                <!-- Nav Item - Alerts -->
                                <td class="nav-item dropdown no-arrow mx-1">
                                    <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <!-- Counter - Alerts -->
                                        Usuń </a>
                                    <!-- Dropdown - Alerts -->
                                    <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
                                        <h6 class="font-weight-bold">
                                            Czy na pewno chcesz usunąć użytkownika?
                                        </h6>
                                        <a href="/admin/user/delete/${donation.id}">
                                            <span style="font-size: large" class="badge badge-danger badge-counter align-content-lg-center">TAK</span>
                                        </a>
                                    </div>
                                </td>
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
