<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ page isErrorPage="true" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Programming Languages</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>

<body class="d-flex justify-content-center align-items-center">

<div id="container" class="col-8 border border-light rounded p-4"> 
<h1 class="text-center text-light">Programming Languages</h1>
<table class="table table-hover">
    <thead>
        <tr class="text-light">
            <th scope="col">Name</th>
            <th scope="col">Creator</th>
            <th scope="col">Latest Version</th>
            <th scope="col">Actions</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${languages}" var="language">
        <tr class="text-light">
            <td><a id="a" href="/languages/${language.id}"><c:out value="${language.name}"/></a></td>
            <td><c:out value="${language.creator}"/></td>
            <td><c:out value="${language.version}"/></td>
            <td class="d-flex">
            	<a href="/languages/${language.id}/edit" class="btn btn-outline-light">Edit</a>
            	<form action="/languages/${language.id}" method="post">
				    <input type="hidden" name="_method" value="delete">
				    <input class="btn btn-outline-light" type="submit" value="Delete">
				</form>
            </td>
        </tr>
        </c:forEach>
    </tbody>
</table>

<h1 class="text-center text-light">Add a Language</h1>
<form:form action="/languages/create" method="post" modelAttribute="language">
	<input type="hidden" name="_method" value="post">
	<div class="form-group">
		<form:label path="name">Name:</form:label>
		<form:errors path="name" />
		<form:input type="text" class="form-control" name="name" path="name"/>
	</div>
	
	<div class="form-group">
		<form:label path="creator">Creator:</form:label>
		<form:errors path="creator" />
		<form:input type="text" class="form-control" name="creator" path="creator" />
	</div>
	
	<div class="form-group">
		<form:label path="version">Version:</form:label>
		<form:errors path="version" />
		<form:input type="text" class="form-control" name="version" path="version" />
	</div>
	
	<div class="d-flex justify-content-end">
		<button class="btn btn-outline-light">Add</button>
	</div>
	
</form:form>

</div>

</body>
</html>