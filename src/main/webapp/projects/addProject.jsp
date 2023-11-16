<%@page import="com.jacaranda.repository.DbRepository"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.jacaranda.model.Project" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add project</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	
	<%
	
	String name = request.getParameter("name");
	String budget = request.getParameter("budget");
	String button =  request.getParameter("submit");
	String message = "";
	
	if (button != null) {
		try {
			Project project = new Project(name, budget);//TODO si no tiene constructor no me deja crear uno asi y si lo creo me da problemas en el addCompanyProject.jsp
			DbRepository.addProject(project);
			message = "Project added succesfully.";
		} catch (Exception e) {
			e.printStackTrace();
			message = "A fail occurred while trying to add the project.";
		}
	}
	
	%>

<form action="./addProject.jsp" method="post">
  <div class="form-group row">
    <label for="name" class="col-4 col-form-label">Name</label> 
    <div class="col-8">
      <input id="name" name="name" type="text" class="form-control" required="required">
    </div>
  </div>
  <div class="form-group row">
    <label for="budget" class="col-4 col-form-label">Budget</label> 
    <div class="col-8">
      <input id="budget" name="budget" type="text" class="form-control" required="required">
    </div>
  </div> 
  <div class="form-group row">
    <div class="offset-4 col-8">
      <button name="submit" type="submit" class="btn btn-primary">Submit</button>
    </div>
  </div>
</form>
<%= message %>
<a href="./listCompanies.jsp"><button class="btn btn-primary">Back to list</button></a>
</body>
</html>