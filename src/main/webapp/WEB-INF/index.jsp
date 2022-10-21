<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Languages</title>
</head>
<body>


	<table>
		<thead>
			<tr>
				<td>Name</td>
				<td>Creator</td>
				<td>Version</td>
				<td>action</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="l" items="${languages}">
				<tr>
					<td><a href="/languages/${l.id}"><c:out value="${l.name}" /></a></td>
					<td><c:out value="${l.creator}" /></td>
					<td><c:out value="${l.currentVersion}" /></td>
					<td>
						<form action="/languages/${l.id}/delete" method="post">
							<input type="hidden" name="_method" value="delete" /> <input
								type="submit" value="Delete" />
						</form> <a href="/languages/${l.id}/edit">Edit</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>

	</table>


	<form:form action="/languages" method="post" modelAttribute="language">


		<div>
			<form:label path="name"> Name: </form:label>

			<form:input path="name" />
		</div>
		<div>
			<form:label path="creator">Creator: </form:label>

			<form:input path="creator" />
		</div>
		<div>
			<form:label path="currentVersion">Version: </form:label>

			<form:input type="number" path="currentVersion" />
		</div>
		<div>
			<form:errors path="name" class="text-danger" />
			<br>
			<form:errors path="creator" class="text-danger" />
			<br>
			<form:errors path="currentVersion" class="text-danger" />
		</div>
		<button>Submit</button>
	</form:form>


</body>
</html>