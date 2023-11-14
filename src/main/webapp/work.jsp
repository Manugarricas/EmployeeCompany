<%@page import="com.jacaranda.util.Time"%>
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
<title>Work page</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

	<%
	//si es empieza
	
	if (session.getAttribute("haTrabajado") != null) {
		
	}
	User user = null;
	String username = "";
	boolean isWorking = false;
	
	if (request.getParameter("working") != null) {
		isWorking = request.getParameter("working").equals("true");
	}
	
	if (session.getAttribute("role") == null || session.getAttribute("user") == null) {
		response.sendRedirect("./index.jsp?message=Logueate antes anda.");
		return;
	}
	else {
		username = session.getAttribute("user").toString();
		user = DbRepository.find(User.class, username);
	}
	
	String message = "";
	LocalDate today = LocalDate.now();
	
	if (isWorking) {
		session.setAttribute("startTime", Time.horaActual());
	}
	else {
		if (session.getAttribute("startTime") != null) {
			Time.computarTiempoTrabajo(Integer.parseInt(session.getAttribute("startTime").toString()), user);
		}
	}
	
	%>
	
<form action="./work.jsp" method="post">
  <div class="form-group row">
    <label for="project" class="col-4 col-form-label">Project: </label> 
    <div class="col-8">
      <select id="project" name="project" required="required" class="custom-select">
      <% ArrayList<Project> projects = null; 
    		try {
    			projects = (ArrayList<Project>)DbRepository.findAll(Project.class);
    		} catch (Exception e) {
    			e.printStackTrace();
    			response.sendRedirect("./error.jsp?msg=Error al recoger las companias");
    		}
    	%>
    	<% for (Project p : projects) { %>
    		<option value='<%= p.getId() %>'><%= p.getName() %></option>
    	<% } %>
      </select>
    </div>
  </div>
  <div class="form-group row">
    <label for="employee" class="col-4 col-form-label">You are: </label> 
    <div class="col-8">
      <input id="employee" value='<%= user.getUser() %>' name="employee" type="text" class="form-control" required="required" readonly>
    </div>
  </div>
  <div class="form-group row">
    <label for="date" class="col-4 col-form-label">Start date:</label> 
    <div class="col-8">
      <input id="date" name="date" type="text" class="form-control" required="required" value='<%= today %>' readonly>
    </div>
  </div> 
  <div class="form-group row">
    <div class="offset-4 col-8">
      <%if (!isWorking) { %>
      <button name="submit" type="submit" class="btn btn-primary">Start working</button>
      <input value='true' name="working" hidden="hidden">
      <%}else { %>
      <button name="submit" type="submit" class="btn btn-primary">Stop working</button>
      <input value='false' name="working" hidden="hidden">
      <%} %>
    </div>
  </div>
</form>
</body>
</html>