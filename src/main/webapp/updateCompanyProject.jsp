<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.jacaranda.model.Project" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update project</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	
	<%
	
	String button = request.getParameter("submit");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String budget = request.getParameter("budget");
	String message = "";
	
	if (button != null) {
		try {
			Project p = new Project();
		} catch (Exception e) {
			e.printStackTrace();
			message = "A fail occurred while updating the project";
		}
	}
	
	%>
	
<form method="post" action="./updateCompanyProject.jsp">
  <div class="form-group row">
    <label for="id" class="col-3 col-form-label">ID</label> 
    <div class="col-9">
      <input id="id" name="id" type="number" required="required" class="form-control">
    </div>
  </div>
  <div class="form-group row">
    <label for="name" class="col-3 col-form-label">Name</label> 
    <div class="col-9">
      <input id="name" name="name" type="text" required="required" class="form-control">
    </div>
  </div>
  <div class="form-group row">
    <label for="budget" class="col-3 col-form-label">Budget</label> 
    <div class="col-9">
      <input id="budget" name="budget" type="text" required="required" class="form-control">
    </div>
  </div> 
  <div class="form-group row">
    <div class="offset-3 col-9">
      <button name="submit" type="submit" class="btn btn-primary">Edit</button>
    </div>
  </div>
</form>
</body>
</html>