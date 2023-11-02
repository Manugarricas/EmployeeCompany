<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.jacaranda.model.Project" %>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="com.jacaranda.repository.DbRepository" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List projects</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	
	<%
	
	ArrayList<Project> projects = new ArrayList(0);
	try {
		projects = (ArrayList<Project>)DbRepository.findAll(Project.class);
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	%>
	
<table class="table">
  <thead class="thead-dark">
    <tr>
      <th scope="col">Name</th>
      <th scope="col">Budget</th>
      <th scope="col">Details</th>
    </tr>
  </thead>
  <tbody>
  <%for (Project p : projects)  { %>
    <tr>
      <td><%= p.getName() %></td>
      <td><%= p.getButget() %></td>
      <td>
	      <form action="./detailsMovies.jsp" method="get">
	      	<input name="cip" type="text" value='<%= p.getId() %>' hidden>
	      	<input name="title" type="text" value='<%= p.getName() %>' hidden>
	      	<input name="year" type="text" value='<%= p.getButget() %>' hidden>
	      	<div class="form-group row">
	      		<div class="offset-4 col-8">
	      			<a href="detailsEmployee.jsp"><button name="submit" type="submit" class="btn btn-primary">Details</button></a>
	      		</div>
	      	</div>
	      </form>
      </td>
    </tr>
    <%} %>
  </tbody>
</table>
	
</body>
</html>