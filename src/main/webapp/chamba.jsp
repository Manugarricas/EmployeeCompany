<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.jacaranda.model.EmployeeProject" %>
    <%@ page import="com.jacaranda.model.User" %>
    <%@ page import="com.jacaranda.model.Project" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="com.jacaranda.repository.DbRepository" %>
    <%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chambea</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

	<%
	
	User user = null;
	String username = "";
	boolean isWorking = false;
	
	if (request.getParameter("working") != null) {
		isWorking = request.getParameter("working").equals("true");
	}
	
	if (session.getAttribute("role") == null || session.getAttribute("user") == null) {
		response.sendRedirect("./index.jsp?message=Logueate antes anda.");
	}
	else {
		username = session.getAttribute("user").toString();
	}
	
	try {
		user = DbRepository.find(User.class, username);
	} catch (Exception e) {
		e.printStackTrace();
		response.sendRedirect("./index.jsp?message=fatal error unexpected.");
	}
	
	String message = "";
	LocalDate today = LocalDate.now();
	
	
	%>
	
<form action="./chamba.jsp" method="post">
  <div class="form-group row">
    <label for="project" class="col-4 col-form-label">Projecto: </label> 
    <div class="col-8">
      <select id="project" name="project" required="required" class="custom-select">
      <% ArrayList<Project> projects = null; 
    		try {
    			projects = (ArrayList<Project>)DbRepository.findAll(Project.class);
    		} catch (Exception e) {
    			e.printStackTrace();
    			response.sendRedirect("./error.jsp?msg=Error al coger las companias");
    		}
    	%>
    	<% for (Project p : projects) { %>
    		<option value='<%= p.getId() %>'><%= p.getName() %></option>
    	<% } %>
      </select>
    </div>
  </div>
  <div class="form-group row">
    <label for="employee" class="col-4 col-form-label">Eres: </label> 
    <div class="col-8">
      <input id="employee" value='<%= user.getUser() %>' name="employee" type="text" class="form-control" required="required" readonly>
    </div>
  </div>
  <div class="form-group row">
    <label for="date" class="col-4 col-form-label">Fecha comienzo</label> 
    <div class="col-8">
      <input id="date" name="date" type="text" class="form-control" required="required" value='<%= today %>' readonly>
    </div>
  </div> 
  <div class="form-group row">
    <div class="offset-4 col-8">
      <%if (!isWorking) { %>
      <button name="submit" type="submit" class="btn btn-primary">Empezar a chambear</button>
      <input value='true' name="working" hidden>
      <%}else { %>
      <button name="submit" type="submit" class="btn btn-primary">Dejar de chambear</button>
      <input value='true' name="working" hidden>
      <%} %>
    </div>
  </div>
</form>
</body>
</html>