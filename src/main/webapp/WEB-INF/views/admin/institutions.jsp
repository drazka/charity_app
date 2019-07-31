<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>



<!DOCTYPE html>
<html lang="en">

<head>
    <%@ include file="/WEB-INF/views/admin/commons/style.jsp" %>
</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <%@ include file="/WEB-INF/views/admin/commons/sidebar.jsp" %>

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <%@ include file="/WEB-INF/views/admin/commons/topbar.jsp" %>

            <!-- Begin Page Content -->
            <div class="container-fluid">

                <!-- Page Heading -->
                <h1 class="h3 mb-2 text-gray-800">Instytucje</h1>

                <!-- DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the https://datatables.net -->
                <!-- DataTales Example -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h5 class="m-0 font-weight-bold text-primary"><a href="/admin/institution/add"> Dodaj nową instytucję</a></h5>


                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>Nr</th>
                                    <th>Nazwa</th>
                                    <th>Opis</th>
                                    <th>Edycja</th>
                                    <th>Usunięcie</th>

                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th>Nr</th>
                                    <th>Nazwa</th>
                                    <th>Opis</th>
                                    <th>Edycja</th>
                                    <th>Usunięcie</th>

                                </tr>
                                </tfoot>
                                <tbody>
                                <c:forEach items="${institutions}" var="institution" varStatus="theCount">
                                <tr>
                                    <th scope="row">${theCount.count}</th>
                                    <td>${institution.name}</td>
                                    <td>${institution.description}</td>
                                    <td><a href="/admin/institution/edit/${institution.id}" >Edytuj</a></td>
                                    <td><a href="/admin/institution/delete/${institution.id}" >Usuń</a></td>
                                </tr>
                                </c:forEach> <br />
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- End of Main Content -->

        <!-- Footer -->
        <%@ include file="/WEB-INF/views/admin/commons/footer.jsp" %>
        <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>


<%@ include file="/WEB-INF/views/admin/commons/javaS.jsp" %>

</body>

</html>
