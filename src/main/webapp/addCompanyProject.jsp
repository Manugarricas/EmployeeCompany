<%@page import="java.util.Date"%>
<%@page import="com.jacaranda.repository.DbRepository"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.jacaranda.model.CompanyProject" %>
    <%@ page import="com.jacaranda.model.Company" %>
    <%@ page import="com.jacaranda.model.Project" %>
    <%@ page import="java.text.SimpleDateFormat" %>
    <%@ page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Company Project</title>
</head>
<body>

	<%
	
	String message = "";
	String idCompany = request.getParameter("idCompany");
	String idProject = request.getParameter("idProject");
	String begin = request.getParameter("begin");
	String end = request.getParameter("end");
	String button = request.getParameter("submit");
	
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
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	%>
	
<form>
  <div class="form-group row">
    <label for="idCompany" class="col-4 col-form-label">ID Company</label> 
    <div class="col-8">
      <input id="idCompany" name="idCompany" type="text" required="required" class="form-control">
    </div>
  </div>
  <div class="form-group row">
    <label for="idProject" class="col-4 col-form-label">ID Project</label> 
    <div class="col-8">
      <input id="idProject" name="idProject" type="text" required="required" class="form-control">
    </div>
  </div>
  <div class="form-group row">
    <label for="begin" class="col-4 col-form-label">Begin</label> 
    <div class="col-8">
      <input id="begin" name="begin" type="text" class="form-control" required="required">
    </div>
  </div>
  <div class="form-group row">
    <label for="end" class="col-4 col-form-label">End</label> 
    <div class="col-8">
      <input id="end" name="end" type="text" class="form-control">
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