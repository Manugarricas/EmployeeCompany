<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ page import="java.time.LocalDate" %>
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
	LocalDate today = LocalDate.now();
	
	
	
	%>
	
<form method="get" action="./addEmployee.jsp">
  <div class="form-group row">
    <label for="id" class="col-4 col-form-label">ID</label> 
    <div class="col-8">
      <input id="id" name="id" type="text" required="required" class="form-control">
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
    <label for="company" class="col-4 col-form-label">Company</label> 
    <div class="col-8">
      <input id="company" name="company" type="text" class="form-control" required="required">
    </div>
  </div>
  <div class="form-group row">
    <div class="offset-4 col-8">
      <button name="submit" type="submit" class="btn btn-primary">Submit</button>
    </div>
  </div>
</form>
</body>
</html>