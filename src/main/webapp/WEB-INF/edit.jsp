<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <%@ page isErrorPage="true" %>
<!-- for rendering errors on PUT routes -->
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


	<form:form action="/languages/${language.id}" method="post" modelAttribute="language">
		<input type="hidden" name="_method"  value="put"/>

		<div>
			<form:label path="name"> Name: </form:label>
			<form:errors path="name"/>
			<form:input path="name" />
		</div>
		<div>
			<form:label path="creator">Creator: </form:label>
			<form:errors path="creator"/>
			<form:input path="creator" />
		</div>
		<div>
			<form:label path="currentVersion">Version: </form:label>
			<form:errors path="currentVersion"/>
			<form:input type="number" path="currentVersion" />
		</div>
		
		<button>Submit</button>
	</form:form>
</body>
</html>