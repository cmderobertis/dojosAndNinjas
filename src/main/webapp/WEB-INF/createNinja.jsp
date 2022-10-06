<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Tacos</title>
  <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
  <script src="/webjars/jquery/jquery.min.js"></script>
  <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<h1>New Ninja</h1>
<div class="row justify-content-center">
  <div class="col-auto">
    <div class="card">
      <div class="card-body">
        <%--@elvariable id="ninja" type=""--%>
        <form:form action="/ninjas" method="post" modelAttribute="ninja">
          <p class="form-control d-flex flex-column">
            <form:label path="firstName">First Name</form:label>
            <form:errors path="firstName" cssClass="text-danger"/>
            <form:input path="firstName"/>
          </p>
          <p class="form-control d-flex flex-column">
            <form:label path="lastName">Last Name</form:label>
            <form:errors path="lastName" cssClass="text-danger"/>
            <form:input path="lastName"/>
          </p>
          <p class="form-control d-flex flex-column">
            <form:label path="age">Age</form:label>
            <form:errors path="age" cssClass="text-danger"/>
            <form:input path="age"/>
          </p>
          <p class="form-control d-flex flex-column">
            <form:label path="dojo">Dojo</form:label>
            <form:errors path="dojo" cssClass="text-danger"/>
            <form:select path="dojo">
              <c:forEach var="oneDojo" items="${dojos}">
                <!--- Each option VALUE is the id of the dojo --->
                <form:option value="${oneDojo.id}">
                  <!--- This is what shows to the user as the option --->
                  <c:out value="${oneDojo.name}"/> Location
                </form:option>
              </c:forEach>
            </form:select>
          </p>
          <input class="mt-3 btn btn-primary" type="submit" value="Submit">
        </form:form>
      </div>
    </div>
  </div>
  <a class="btn btn-secondary" href="/dojos">Cancel</a>
</div>
</body>
</html>