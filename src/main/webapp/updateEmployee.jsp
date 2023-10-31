<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@page import="com.jacaranda.util.DbUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.jacaranda.model.Employee" %>
    <%@ page import="com.jacaranda.repository.DbRepository" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="com.jacaranda.model.Company" %>
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
	
	String id = request.getParameter("idEmployee");
	String button = request.getParameter("submit");
	java.time.LocalDate today = LocalDate.now();
	String message = "";
	
	if (button != null) {
		try {
			Employee e = DbRepository.find(Employee.class, Integer.parseInt(id));
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
      <input id="id" name="id" type="text" class="form-control" readonly>
    </div>
  </div>
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