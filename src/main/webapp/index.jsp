<%@page import="com.jacaranda.repository.DbRepository"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.jacaranda.model.Company" %>
    <%@ page import="com.jacaranda.model.Employee" %>
    <%@ page import="com.jacaranda.model.Project" %>
    <%@ page import="com.jacaranda.repository.DbRepository" %>
    <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Companies</title>
<link rel="stylesheet" href="./indexStyle.css" type="text/css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	
	<%
	
	ArrayList<Company> companyResult = new ArrayList(0);
	ArrayList<Employee> employeeResult = new ArrayList(0);
	ArrayList<Project> projectResult = new ArrayList(0);
	try {
		companyResult = (ArrayList<Company>)DbRepository.findAll(Company.class);
		employeeResult = (ArrayList<Employee>)DbRepository.findAll(Employee.class);
		projectResult = (ArrayList<Project>)DbRepository.findAll(Project.class);
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	%>
<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Nombre</th>
      <th scope="col">Num empleados</th>
      <th scope="col">Num proyectos</th>
    </tr>
  </thead>
  <tbody>
  <%for (Company c : companyResult)  { %>
    <tr>
    	<th><%= c.getName() %></th>
    	<th><%= c.getEmployeeList().size() %></th>
    	<th><%= c.getCompanyProject().size() %></th>
    </tr>
    <tr>
    	<th colspan="3">Employees</th>
    </tr>
    
    <%for (Employee e : c.getEmployeeList()) {%>
    <tr>
    	<td colspan="3"><%= e.getFirstName() + " " + e.getLastName() %></td>
    </tr>
    <%} %>
    <tr>
    	<th colspan="3">Projects</th>
    </tr>
    <%for (CompanyProject cp : c.getCompanyProject()) {%>
    <tr>
    	<td colspan="3"><%=  %></td>
    </tr>
    <%} %>
    
    <!-- Separador de empresas -->
    <tr class="spacer"><td colspan="3"></td></tr>
    
    <%} %>
  </tbody>
</table>
	
</body>
</html>