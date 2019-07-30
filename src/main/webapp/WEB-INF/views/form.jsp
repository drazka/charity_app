<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<!-- TODO layout-->
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

    <section>
          <div class="slogan--steps">
            <div class="slogan--steps-title">Wystarczą 4 proste kroki:</div>
            <ul class="slogan--steps-boxes">
              <li>
                <div><em>1</em><span>Wybierz rzeczy</span></div>
              </li>
              <li>
                <div><em>2</em><span>Spakuj je w worki</span></div>
              </li>
              <li>
                <div><em>3</em><span>Wybierz fundację</span></div>
              </li>
              <li>
                <div><em>4</em><span>Zamów kuriera</span></div>
              </li>
            </ul>
          </div>
    </section>
    </header>

    <section class="form--steps">
      <div class="form--steps-instructions">
        <div class="form--steps-container">
          <h3>Ważne!</h3>
          <p data-step="1" class="active">
            Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
            wiedzieć komu najlepiej je przekazać.
          </p>
          <p data-step="2">
            Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
            wiedzieć komu najlepiej je przekazać.
          </p>
          <p data-step="3">
           Wybierz jedną, do
            której trafi Twoja przesyłka.
          </p>
          <p data-step="4">Podaj adres oraz termin odbioru rzeczy.</p>
        </div>
      </div>

      <div class="form--steps-container">
        <div class="form--steps-counter">Krok <span>1</span>/4</div>

        <form:form modelAttribute="donation" action="/donation" method="post">

          <!-- STEP 1: class .active is switching steps -->
          <div data-step="1" class="active">
            <h3>Zaznacz co chcesz oddać:</h3>
            <!-- TO DO brak zaznaczenia wybranego pola -->

        <c:forEach items="${categories}" var="category">
            <div class="form-group form-group--checkbox">
              <label>
                <form:checkbox
                        path="categories"
                        value="${category}"
                        />
                <span class="checkbox"></span>
                <span class="description"
                  >${category.name}</span
                >
              </label>
            </div>
        </c:forEach> <br />


            <div class="form-group form-group--buttons">
              <button type="button" class="btn next-step">Dalej</button>
            </div>
          </div>

          <!-- STEP 2 -->
          <div data-step="2">
            <h3>Podaj liczbę 60l worków, w które spakowałeś/aś rzeczy:</h3>

            <div class="form-group form-group--inline">
              <label>
                Liczba 60l worków:
                <form:input path="quantity" id="quantity"/>
                <!-- TO DO walidacja ilości-->
                <form:hidden path="id"/>
              </label>
            </div>

            <div class="form-group form-group--buttons">
              <button type="button" class="btn prev-step">Wstecz</button>
              <button type="button" class="btn next-step">Dalej</button>
            </div>
          </div>



          <!-- STEP 4 -->
          <div data-step="3">
            <h3>Wybierz organizacje, której chcesz pomóc:</h3>


            <div class="form-group form-group--checkbox">
              <c:forEach items="${institutions}" var="institution">
                <label>
                  <form:radiobutton path="institution" value="${institution}"/>
                  <span class="checkbox radio"></span>
                  <span class="description">
                  <div class="title">${institution.name}</div>
                  <div class="subtitle">
                    Cel i misja: ${institution.description}
                  </div>
                </span>
                </label>
              </c:forEach>
            </div>


            <div class="form-group form-group--buttons">
              <button type="button" class="btn prev-step">Wstecz</button>
              <button type="button" class="btn next-step">Dalej</button>
            </div>
          </div>

          <!-- STEP 5 -->
          <div data-step="4">
            <h3>Podaj adres oraz termin odbioru rzecz przez kuriera:</h3>

            <div class="form-section form-section--columns">
              <div class="form-section--column">
                <h4>Adres odbioru</h4>
                <div class="form-group form-group--inline">
                  <label> Ulica
                    <form:input path="street" id="streetIn"/>
                  </label>
                </div>

                <div class="form-group form-group--inline">
                  <label> Miasto
                    <form:input path="city" id="cityIn"/>
                  </label>
                </div>

                <div class="form-group form-group--inline">
                  <label>
                    Kod pocztowy
                    <form:input path="zipCode" id="zipCodeIn"/>
                  </label>
                </div>

                <div class="form-group form-group--inline">
                  <label>
                    Numer telefonu
                    <form:input path="telephoneNumber" id="phoneIn"/>
                  </label>
                </div>
              </div>

              <div class="form-section--column">
                <h4>Termin odbioru</h4>
                <div class="form-group form-group--inline">
                  <label> Data
                    <form:input path="pickUpDate" id="pickUpDateIn"/>
                  </label>
                </div>

                <div class="form-group form-group--inline">
                  <label> Godzina
                    <form:input path="pickUpTime" id="pickUpTimeIn"/>
                  </label>
                </div>

                <div class="form-group form-group--inline">
                  <label>
                    Uwagi dla kuriera
                    <form:textarea rows="5" path="pickUpComment" id="commentIn"/>
                  </label>
                </div>
              </div>
            </div>
            <div class="form-group form-group--buttons">
              <button type="button" class="btn prev-step">Wstecz</button>
              <button type="button" class="btn next-step">Dalej</button>
            </div>
          </div>

          <!-- STEP 6 -->
          <div data-step="5">
            <h3>Podsumowanie Twojej darowizny</h3>

            <div class="summary">
              <div class="form-section">
                <!-- TO DO nazwa kategorii do oddania-->
                <h4>Oddajesz:</h4>
                <ul>
                  <li>
                    <span class="icon icon-bag"></span>
                      <span class="summary--text" id="quantitySum"> </span>
                  </li>
                  <!-- TO DO nazwa organizacji-->
                  <li>
                    <span class="icon icon-hand"></span>
                    <span class="summary--text" id="institution">
                    </span>
                  </li>
                </ul>
              </div>

              <div class="form-section form-section--columns">
                <div class="form-section--column">
                  <h4>Adres odbioru:</h4>
                  <ul>
                    <li id="street"></li>
                    <li id="city"></li>
                    <li id="zipCode"></li>
                    <li id="phone"></li>
                  </ul>
                </div>

                <div class="form-section--column">
                  <h4>Termin odbioru:</h4>
                  <ul>
                    <li id="pickUpDate"></li>
                    <li id="pickUpTime"></li>
                    <li id="comment"></li>
                  </ul>
                </div>
              </div>
            </div>

            <div class="form-group form-group--buttons">
              <button type="button" class="btn prev-step">Wstecz</button>
              <button type="submit" class="btn">Potwierdzam</button>
            </div>
          </div>
        </form:form>
      </div>
    </section>

    <%@ include file="/WEB-INF/views/commons/footer.jsp" %>
  </body>
</html>
