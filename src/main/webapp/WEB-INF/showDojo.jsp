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
<h1><c:out value="${dojo.name}"/> Location Ninjas</h1>
<div class="row justify-content-center">
  <div class="col-8">
    <div class="card">
      <div class="card-body">
        <table class="table">
          <thead class="thead-dark">
          <tr>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Age</th>
            <th>Actions</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach items="${ninjas}" var="ninja">
            <tr>
              <td>
                <c:out value="${ninja.firstName}"/>
              </td>
              <td>
                <c:out value="${ninja.lastName}"/>
              </td>
              <td>
                <c:out value="${ninja.age}"/>
              </td>
              <td>
                <div class="d-flex">
                  <a class="btn btn-success me-3" href="/ninjas/${ninja.id}/edit">Edit</a>
                  <form action="/ninjas/${ninja.id}" method="post">
                    <input type="hidden" name="_method" value="delete">
                    <input type="submit" value="Delete" class="btn btn-danger">
                  </form>
                </div>
              </td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
        <a href="/ninjas/new">Add Ninja</a>
      </div>
    </div>
  </div>
</div>
<a href="/dojos">All Dojos</a>
</body>
</html>