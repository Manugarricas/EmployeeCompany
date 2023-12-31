<%@page import="java.time.ZoneId"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ page import="java.time.LocalDate" %>
	<%@ page import="java.text.SimpleDateFormat" %>
	<%@ page import="com.jacaranda.model.Employee" %>
	<%@ page import="com.jacaranda.repository.DbRepository" %>
	<%@ page import="com.jacaranda.model.Company" %>
	<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add employee</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	
	<%
	//Imports eliminados para que no colisionen
	//	page import="java.sql.Date"
	//  page import="java.util.Date" 
	String message = "";
	LocalDate today = LocalDate.now();
	int idCompany = -1;
	String firstName = request.getParameter("firstName");
	String lastName = request.getParameter("lastName");
	String email = request.getParameter("email");
	String gender = request.getParameter("gender");
	String dateOfBirth = request.getParameter("birth");
	String company = request.getParameter("company");
	String button = request.getParameter("submit");
	
	if (button != null) {
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date parsed = format.parse(dateOfBirth);
			java.sql.Date dateOfBirthParsed = new java.sql.Date(parsed.getTime());
			Company companyEmployee = DbRepository.find(Company.class, Integer.parseInt(company));
			Employee e = new Employee(firstName, lastName, email, gender, dateOfBirthParsed, companyEmployee);
			DbRepository.addEmployee(e);
			message = "The employee has been added succesfully.";
		} catch (Exception exception) {
			exception.printStackTrace();
			message = "Fatal error. The employee can't be added to database.";
		}
	}
	
	%>
	
<form method="post" action="./addEmployee.jsp">
  <div class="form-group row">
    <label for="firstName" class="col-4 col-form-label">First name</label> 
    <div class="col-8">
      <input id="firstName" name="firstName" type="text" class="form-control" required="required">
    </div>
  </div>
  <div class="form-group row">
    <label for="lastName" class="col-4 col-form-label">Last name</label> 
    <div class="col-8">
      <input id="lastName" name="lastName" type="text" class="form-control" required="required">
    </div>
  </div>
  <div class="form-group row">
    <label for="email" class="col-4 col-form-label">Email</label> 
    <div class="col-8">
      <input id="email" name="email" type="email" class="form-control" required="required">
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
      <input id="birth" name="birth" type="date" class="form-control" required="required" max='<%= today %>'>
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
      <button name="submit" type="submit" class="btn btn-primary" value="submit">Submit</button>
    </div>
  </div>
</form>
<p><%= message %></p>
</body>
</html>