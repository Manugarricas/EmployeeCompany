<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@page import="com.jacaranda.util.DbUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.jacaranda.model.Employee" %>
    <%@ page import="com.jacaranda.repository.DbRepository" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="com.jacaranda.model.Company" %>
    <%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Update employee</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	
	<%
	
	if (session.getAttribute("role") == null) {
		response.sendRedirect("./index.jsp?message=Logueate antes anda.");
	}
	
	java.sql.Date dateOfBirthParsed = null;
	java.sql.Date dateOfBirthParsedForInputValue = null;
	String id = request.getParameter("idEmployee");
	String firstName = request.getParameter("firstName");
	String lastName = request.getParameter("lastName");
	String email = request.getParameter("email");
	String gender = request.getParameter("gender");
	String dateOfBirth = request.getParameter("dateOfBirth");
	try {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat formatForInputValue = new SimpleDateFormat("dd-MM-aaaa");
		java.util.Date parsed = format.parse(dateOfBirth);
		java.util.Date parsedForInputValue = format.parse(dateOfBirth);
		dateOfBirthParsed = new java.sql.Date(parsed.getTime());
		dateOfBirthParsedForInputValue = new java.sql.Date(parsed.getTime());
	} catch (Exception e) {
		e.printStackTrace();
	}
	String company = request.getParameter("company");
	
	String button = request.getParameter("submit");
	java.time.LocalDate today = LocalDate.now();
	String message = "";
	
	if (button != null) {
		try {
			Company companyEmployee = DbRepository.find(Company.class, Integer.parseInt(company));
			Employee e = new Employee(Integer.parseInt(id), firstName, lastName, email, gender, dateOfBirthParsed, companyEmployee);
			DbRepository.addEmployee(e);
			message = "Employee edited succesfully.";
		} catch (Exception e) {
			e.printStackTrace();
			message = "Fail while editing the employee.";
		}
	}
	
	%>
	
<form method="get" action="./updateEmployee.jsp">
  <div class="form-group row">
    <label for="id" class="col-4 col-form-label">ID</label> 
    <div class="col-8">
      <input id="id" value='<%= id %>' name="idEmployee" type="text" class="form-control" readonly>
    </div>
  </div>
  <div class="form-group row">
    <label for="firstName" class="col-4 col-form-label">First name</label> 
    <div class="col-8">
      <input id="firstName" value='<%= firstName %>' name="firstName" type="text" class="form-control" required="required">
    </div>
  </div>
  <div class="form-group row">
    <label for="lastName" class="col-4 col-form-label">Last name</label> 
    <div class="col-8">
      <input id="lastName" value='<%= lastName %>' name="lastName" type="text" class="form-control" required="required">
    </div>
  </div>
  <div class="form-group row">
    <label for="email" class="col-4 col-form-label">Email</label> 
    <div class="col-8">
      <input id="email" value='<%= email %>' name="email" type="email" class="form-control" required="required">
    </div>
  </div>
  <div class="form-group row">
    <label for="gender" class="col-4 col-form-label">Gender</label> 
    <div class="col-8">
      <select id="gender" name="gender" class="custom-select" required="required">
        <option value="Male">Male</option>
        <option value="Female">Female</option>
        <option value="Other">Other</option>
      </select>
    </div>
  </div> 
  <div class="form-group row">
    <label for="birth" class="col-4 col-form-label">Date of birth</label> 
    <div class="col-8">
      <input id="birth" value='<%= dateOfBirthParsedForInputValue %>' name="birth" type="date" class="form-control" required="required" max='<%= today %>'>
    </div>
  </div>
  <div class="form-group row">
    <label for="select" class="col-4 col-form-label">Company</label> 
    <div class="col-8">
   <select class="custom-select" name="company">
   <%
   ArrayList<Company> companies = (ArrayList<Company>)DbRepository.findAll(Company.class);
	for (Company c : companies) {
		%>
		<option value='<%= c.getId() %>'><%= c.getName() %></option>
		<%
	}
	%>
	</select>
	</div>
	</div>
  <div class="form-group row">
    <div class="offset-4 col-8">
      <button name="submit" type="submit" class="btn btn-primary" value="submit">Update</button>
    </div>
  </div>
</form>
<p><%= message %></p>
<a href="./listCompanies.jsp"><button class="btn btn-primary">Volver a la lista</button></a>
</body>
</html>