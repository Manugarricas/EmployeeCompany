<%@page import="com.jacaranda.repository.DbRepository"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.jacaranda.model.Employee" %>
    <%@ page import="com.jacaranda.repository.DbRepository" %>
    <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employees</title>
<link rel="stylesheet" href="./listEmployeeStyle.css" type="text/css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	
	<%
	
	ArrayList<Employee> result = new ArrayList(0);
	try {
		result = (ArrayList<Employee>)DbRepository.findAll(Employee.class);
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	%>
<!-- 
<header>
	<nav>
		<div align="center">
			<a href="./EmployeeOptions.html">Touch me to back to menu!</a>
		</div>
	</nav>
</header>
 -->
<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Nombre</th>
      <th scope="col">Apellidos</th>
      <th scope="col">Email</th>
      <th scope="col">Género</th>
      <th scope="col">Fecha de nacimiento</th>
      <th scope="col">Nombre compañía</th>
      <th scope="col">Detalles</th>
      
    </tr>
  </thead>
  <tbody>
  <%for (Employee e : result)  { %>
    <tr>
      <td><%= e.getId() %></td>
      <td><%= e.getFirstName() %></td>
      <td><%= e.getLastName() %></td>
      <td><%= e.getEmail() %></td>
      <td><%= e.getGender() %></td>
      <td><%= e.getDateOfBirth() %></td>
      <td><%= e.getCompany().getName() %></td>
      
      <td>
	      <form action="./detailsMovies.jsp" method="get">
	      	<input name="cip" type="text" value='<%= e.getId() %>' hidden>
	      	<input name="title" type="text" value='<%= e.getFirstName() %>' hidden>
	      	<input name="year" type="text" value='<%= e.getLastName() %>' hidden>
	      	<input name="title_s" type="text" value='<%= e.getEmail() %>' hidden>
	      	<input name="nacionality" type="text" value='<%= e.getGender() %>' hidden>
	      	<input name="budget" type="text" value='<%= e.getDateOfBirth() %>' hidden>
	      	<input name="duration" type="text" value='<%= e.getCompany() %>' hidden>
	      	<div class="form-group row">
	      		<div class="offset-4 col-8">
	      			<a href="detailsEmployee.jsp"><button name="submit" type="submit" class="btn btn-primary">Details</button></a>
	      		</div>
	      	</div>
	      </form>
      </td>
    </tr>
    <%} %>
  </tbody>
</table>
	
</body>
</html>