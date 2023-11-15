<%@page import="java.time.ZoneOffset"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.jacaranda.model.*"%>
<%@page import="com.jacaranda.repository.DbRepository"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.jacaranda.util.Time"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<meta charset="ISO-8859-1">
	<title>Work page</title>
</head>
<body>
	<%
	//Comprobacion para que tenga que estar registrado para entrar
	User user = null;
	if (session.getAttribute("user") == null) {//si no esta registrado, lo enviamos al login
		response.sendRedirect("index.jsp?message=Logueate anda");
		return;
	}
	else {//si esta registrado obtenemos quien es
		user = DbRepository.find(User.class, session.getAttribute("user").toString());
	}
	//Creamos un array para los proyectos
	ArrayList<Project> result = new ArrayList();
	LocalDate today = LocalDate.now();
	Project p = null;
	
	
	
	//comprobamos que es la primera vez que entra
	if(request.getParameter("IdProject") == null && session.getAttribute("IdProject") == null){
		try {
			result = (ArrayList<Project>)DbRepository.findAll(Project.class);//cogemos todos los projectos
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	else {//si ya ha entrado antes
		p = DbRepository.find(Project.class, request.getParameter("IdProject"));
	
		if(request.getParameter("stop") == null){//si no está trabajando y le damos a trabajar
			session.setAttribute("TimeOfStartWork", Time.horaActual());//miramos la hora actual
			session.setAttribute("IdProject",p.getId());//guardamos el proyecto
		}
		else {//si ya está trabajando y le damos a cancelar
			int startTime = Integer.parseInt(session.getAttribute("TimeOfStartWork").toString());
			
			Project project = DbRepository.find(Project.class, Integer.parseInt(session.getAttribute("IdProject").toString()));
			
			Double tiempoTrabajado = Time.computarTiempoTrabajo(startTime, user);
			
			EmployeeProject ep;
			try {//comprobamos si existe con el find
				ep = DbRepository.find(EmployeeProject.class,Integer.parseInt(request.getParameter("IdProject").toString()));
				if (ep != null) {
					ep.addHours(tiempoTrabajado);
					DbRepository.updateEmployeeProject(ep);
				}
			} catch (Exception e) {
				String todayString = today.toString();
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date todayFormated = format.parse(todayString);
				java.sql.Date todayParsed = new java.sql.Date(todayFormated.getTime());
				
				ep = new EmployeeProject(user.getUser(), project.getId(), todayParsed, tiempoTrabajado);
				DbRepository.addEmployeeProject(ep);
			}
		}
	}
	%>
	<form>
	  <div class="form-group row">
	    <label for="project" class="col-4 col-form-label">Project</label> 
	    <div class="col-8">
	      <% if(request.getParameter("start")==null){ %>
	      	<select id="IdProject" name="IdProject" class="custom-select">
	       	<% for(Project pro : result){ %>
	        	<option value="<%= pro.getId() %>"><%= pro.getName() %></option>
		   	<% } %>
	      </select>
	      </div>
	      </div>
	       	<div class="form-group row">
		    <label for="date" class="col-4 col-form-label">Date</label> 
		    <div class="col-8">
		      <input id="date" name="date" placeholder="date" type="date" class="form-control" value="<%= today %>" min="<%= today %>">
		    </div>
		  </div>
		  <div class="form-group row">
		  	<label for="user" class="col-4 col-form-label">You are:</label>
		  	<div class="col-8">
		  		<input id="user" name="user" class="form-control" value="<%= user.getUser() %>" readonly>
		  	</div>
		  </div>
		  <div class="form-group row">
		    <div class="offset-4 col-8">
			  <button name="start" type="submit" class="btn btn-primary">Start working</button>
			</div>
		  </div>
	      <% }else{ %>
	      		<input value="<%= p.getName() %>" readonly>
	       		<input value="<%= p.getId() %>" name="IdProject" readonly hidden>
	       		<button name="stop" type="submit" class="btn btn-primary">Stop working</button>
	       <% } %>
	</form>
</body>
</html>