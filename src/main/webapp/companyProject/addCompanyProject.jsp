<%@page import="java.util.Date"%>
<%@page import="com.jacaranda.repository.DbRepository"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.jacaranda.model.CompanyProject" %>
    <%@ page import="com.jacaranda.model.Company" %>
    <%@ page import="com.jacaranda.model.Project" %>
    <%@ page import="java.text.SimpleDateFormat" %>
    <%@ page import="java.time.LocalDate" %>
    <%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Company Project</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

	<%
	
	String message = "";
	String idCompany = request.getParameter("company");
	String idProject = request.getParameter("idProject");
	String begin = request.getParameter("begin");
	String end = request.getParameter("end");
	String button = request.getParameter("submit");
	LocalDate today = LocalDate.now();
	
	if (button != null) {
		try {
			
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date beginFormated = format.parse(begin);
			java.util.Date endFormated = format.parse(end);
			java.sql.Date beginParsed = new java.sql.Date(beginFormated.getTime());
			java.sql.Date endParsed = new java.sql.Date(endFormated.getTime());
			
			Company company = DbRepository.find(Company.class, Integer.parseInt(idCompany));
			Project project = DbRepository.find(Project.class, Integer.parseInt(idProject));
			CompanyProject cp = new CompanyProject(company, project, beginParsed, endParsed);
			
			DbRepository.addCompanyProject(cp);
			
			message = "Anadio bien";
		} catch (Exception e) {
			e.printStackTrace();
			message = "Anadio bien";
		}
	}
	
	%>
	
<form action="./addCompanyProject.jsp" method="post">
  <div class="form-group row">
    <label for="idCompany" class="col-4 col-form-label">ID Company</label> 
    <div class="col-8">
    <select class="custom-select" name="company">
    	<% ArrayList<Company> companies = null; 
    		try {
    			companies = (ArrayList<Company>)DbRepository.findAll(Company.class);
    		} catch (Exception e) {
    			e.printStackTrace();
    			response.sendRedirect("./error.jsp?msg=Error al coger las companias");
    		}
    	%>
    	<% for (Company c : companies) { %>
    		<option value='<%= c.getId() %>'><%= c.getName() %></option>
    	<% } %>
    </select>
    </div>
  </div>
  <div class="form-group row">
    <label for="idCompany" class="col-4 col-form-label">ID Project</label> 
    <div class="col-8">
    <select class="custom-select" name="idProject">
    	<% ArrayList<Project> projects = null; 
    		try {
    			projects = (ArrayList<Project>)DbRepository.findAll(Project.class);
    		} catch (Exception e) {
    			e.printStackTrace();
    			response.sendRedirect("./error.jsp?msg=Error al coger lo proye");
    		}
    	%>
    	<% for (Project p : projects) { %>
    		<option value='<%= p.getId() %>'><%= p.getName() %></option>
    	<% } %>
    </select>
    </div>
  </div>
  <div class="form-group row">
    <label for="begin" class="col-4 col-form-label">Begin</label> 
    <div class="col-8">
      <input id="begin" value='<%= today %>' name="begin" type="date" class="form-control" required="required" readonly>
    </div>
  </div>
  <div class="form-group row">
    <label for="end" class="col-4 col-form-label">End</label> 
    <div class="col-8">
      <input id="end" name="end" type="date" class="form-control" min='<%= today %>'>
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