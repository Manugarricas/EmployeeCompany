<%@page import="com.jacaranda.repository.DbRepository"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.jacaranda.model.Company" %>
    <%@ page import="com.jacaranda.model.Employee" %>
    <%@ page import="com.jacaranda.model.Project" %>
    <%@ page import="com.jacaranda.model.CompanyProject" %>
    <%@ page import="com.jacaranda.repository.DbRepository" %>
    <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Companies</title>
<link rel="stylesheet" href="./listCompaniesStyle.css" type="text/css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	
	<%
	
	ArrayList<Company> companyResult = new ArrayList(0);
	ArrayList<Employee> employeeResult = new ArrayList(0);
	try {
		companyResult = (ArrayList<Company>)DbRepository.findAll(Company.class);
		employeeResult = (ArrayList<Employee>)DbRepository.findAll(Employee.class);
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	if (session.getAttribute("role") == null) {
		response.sendRedirect("./index.jsp?message=Logueate antes anda.");
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
		    <form action="./updateEmployee.jsp" method="get">
			<input value='<%= e.getId() %>' name="idEmployee" hidden>
			<input value='<%= e.getFirstName() %>' name="firstName" hidden>
			<input value='<%= e.getLastName() %>' name="lastName" hidden>
			<input value='<%= e.getEmail() %>' name="email" hidden>
			<input value='<%= e.getGender() %>' name="gender" hidden>
			<input value='<%= e.getDateOfBirth() %>' name="dateOfBirth" hidden>
			<input value='<%= e.getCompany() %>' name="company" hidden>			
			<td colspan="1"><%= e.getFirstName() + " " + e.getLastName() %><!-- Esto es el nombre -->
			<% if (session.getAttribute("role") != null) {
				if (session.getAttribute("role").equals("ADMIN")) { %>
		    	<button class="btn btn-primary">Edit</button>
		    <% 	}
    		   }
			%>
		    </td>
		    </form>
		    <form action="./deleteEmployee.jsp" method="get">
			<input value='<%= e.getId() %>' name="idEmployee" hidden>
			<input value='<%= e.getFirstName() %>' name="firstName" hidden>
			<input value='<%= e.getLastName() %>' name="lastName" hidden>
			<input value='<%= e.getEmail() %>' name="email" hidden>
			<input value='<%= e.getGender() %>' name="gender" hidden>
			<input value='<%= e.getDateOfBirth() %>' name="dateOfBirth" hidden>
			<input value='<%= e.getCompany() %>' name="company" hidden>
			<td colspan="2">
			<% if (session.getAttribute("role") != null) {
				if (session.getAttribute("role").equals("ADMIN")) { %>
		    	<button class="btn btn-primary">Delete</button>
		    <% 	}
    		   }
			%>
		    </td>
		    </form>
		    <% } %>
		</tr>
    <tr>
    	<th colspan="3">Projects</th>
    </tr>
    <%for (CompanyProject cp : c.getCompanyProject()) {%>
    <tr>
    	<td><%= cp.getProject() %></td>
    	<form action="./updateCompanyProject.jsp" method="post">
    		<input value='<%= cp.getCompany() %>' name="cpCompany" hidden>
    		<input value='<%= cp.getProject() %>' name="cpProject" hidden>
    		<input value='<%= cp.getBegin() %>' name="cpBegin" hidden>
    		<input value='<%= cp.getEnd() %>' name="cpEnd" hidden>
    		<td colspan="2">
    			<% if (session.getAttribute("role") != null) { %>
    				<% if (session.getAttribute("role").equals("ADMIN")) { %>
    					<button class="btn btn-primary">Edit</button>
    				<% } %>
    			<% } %>
    		</td>
    	</form>
    	<form action="./deleteCompanyProject.jsp" method="post">
    		<input value='<%= cp.getCompany() %>' name="cpCompany" hidden>
    		<input value='<%= cp.getProject() %>' name="cpProject" hidden>
    		<input value='<%= cp.getBegin() %>' name="cpBegin" hidden>
    		<input value='<%= cp.getEnd() %>' name="cpEnd" hidden>
    		<td colspan="2">
    			<% if (session.getAttribute("role") != null) { %>
    				<% if (session.getAttribute("role").equals("ADMIN")) { %>
    					<button class="btn btn-primary">Delete</button>
    				<% } %>
    			<% } %>
    		</td>
    	</form>
    </tr>
    <%} %>
    
    <!-- Separador de empresas -->
    <tr class="spacer"><td colspan="3"></td></tr>
    
    <%} %>
  </tbody>
</table>
	
</body>
</html>