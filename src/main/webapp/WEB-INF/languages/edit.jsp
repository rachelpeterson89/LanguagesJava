<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ page isErrorPage="true" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit: <c:out value="${language.name}"/></title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>

<body class="d-flex justify-content-center align-items-center">
<div id="container" class="col-6 border border-light rounded p-4">
	<h1 class="text-center text-light">Update <c:out value="${language.name}"/></h1>
	<form:form action="/languages/${language.id}" method="put" modelAttribute="language">
		<input type="hidden" name="_method" value="put">
		<div class="form-group">
			<form:label path="name">Name:</form:label>
			<form:errors path="name"/>
			<form:input type="text" class="form-control" path="name" name="name" value="${language.name}"/>
		</div>
		
		<div class="form-group">
			<form:label path="creator">Creator:</form:label>
			<form:errors path="creator"/>
			<form:input type="text" class="form-control" path="creator" name="creator" value="${language.creator}"/>
		</div>
		
		<div class="form-group">
			<form:label path="version">Version:</form:label>
			<form:errors path="version" />
			<form:input type="text" class="form-control" path="version" name="version" value="${language.version}"/>
		</div>
		
		<div class="d-flex justify-content-end">
			<a class="btn btn-outline-light" href="/languages">Home</a>
			<a class="btn btn-outline-light" href="/languages/${language.id}">Back</a>
			<button class="btn btn-outline-light">Update</button>
		</div>
		
	</form:form>
	</div>
</body>
</html>