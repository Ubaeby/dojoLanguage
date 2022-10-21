<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><c:out value="${languages.name}"></c:out></title>
</head>
<body>

	<a href="/languages">Dashboard</a>

	<div>
		<p>
			<c:out value="${languages.name}"></c:out>
		</p>
	</div>

	<div>
		<p>
			<c:out value="${languages.creator}"></c:out>
		</p>
	</div>

	<div>
		<p>
			<c:out value="${languages.currentVersion}"></c:out>
		</p>
	</div>

	<div>

		<form action="/languages/${languages.id}/delete" method="post">
			<input type="hidden" name="_method" value="delete" /> <input
				type="submit" value="Delete" />
		</form>

		<a href="/languages/${languages.id}/edit">Edit</a>
	</div>

</body>
</html>