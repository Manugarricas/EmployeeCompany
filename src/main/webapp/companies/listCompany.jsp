<%@page import="com.jacaranda.repository.DbRepository"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.jacaranda.model.Company" %>
    <%@ page import="com.jacaranda.model.Employee" %>
    <%@ page import="com.jacaranda.repository.DbRepository" %>
    <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Companies</title>
<link rel="stylesheet" href="./listCompanyStyle.css" type="text/css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	
	<%
	
	ArrayList<Company> result = new ArrayList(0);
	ArrayList<Employee> EmployeeResult = new ArrayList(0);
	try {
		result = (ArrayList<Company>)DbRepository.findAll(Company.class);
		EmployeeResult = (ArrayList<Employee>)DbRepository.findAll(Employee.class);
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
      <th scope="col">Address</th>
      <th scope="col">City</th>
      <th scope="col">Details</th>
    </tr>
  </thead>
  <tbody>
  <%for (Company c : result)  { %>
    <tr>
      <td><%= c.getId() %></td>
      <td><%= c.getName() %></td>
      <td><%= c.getAddress() %></td>
      <td><%= c.getCity() %></td>
      <td>
	      <form action="./detailsMovies.jsp" method="get">
	      	<input name="id" type="text" value='<%= c.getId() %>' hidden>
	      	<input name="name" type="text" value='<%= c.getName() %>' hidden>
	      	<input name="address" type="text" value='<%= c.getAddress() %>' hidden>
	      	<input name="city" type="text" value='<%= c.getCity() %>' hidden>
	      	<input name="employeeList" type="text" value='<%= c.getEmployeeList() %>' hidden>
	      		<div class="offset-4 col-8">
	      			<a href="detailsCompany.jsp"><button name="submit" type="submit" class="btn btn-primary rotate">Details</button></a>
	      		</div>
	      </form>
      </td>
    </tr>
    <tr>
    	<td></td>
    	<th>Nº of employees: </td>
      	<th><%= c.getEmployeeList().size() %></td>
    </tr>
    <%} %>
  </tbody>
</table>
	
</body>
</html>