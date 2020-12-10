<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><c:out value="${language.name}"/></title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>

<body class="d-flex justify-content-center align-items-center">
	<div id="container" class="col-6 border border-light rounded p-4">	
		<h1 class="text-center text-light"><c:out value="${language.name}"/></h1>
		<div class="">
			<p>Creator: <c:out value="${language.creator}"/></p>
			<p>Latest Version: <c:out value="${language.version}"/></p>
			<div class="d-flex justify-content-end">
				<a class="btn btn-outline-light" href="/languages">Home</a>
				<a class="btn btn-outline-light" href="/languages/${language.id}/edit">Edit Book</a>
				<form action="/languages/${language.id}" method="post">
				    <input type="hidden" name="_method" value="delete">
				    <input class="btn btn-outline-light" type="submit" value="Delete">
				</form>
			</div>
		</div>
	</div>
</body>
</html>