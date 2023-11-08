<!DOCTYPE html>
<%@page import="com.jacaranda.repository.DbRepository"%>
<%@page import="com.jacaranda.model.User" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login page</title>
    <link rel="stylesheet" href="./indexStyle.css" type="text/css">
</head>
<body>

	<%
	
	String role;
	String message = request.getParameter("message");
	String button = request.getParameter("submit");
	String username = request.getParameter("user");
	String password = request.getParameter("password");
	
	if (button != null && username != null && password != null) {
		try {
			User user = DbRepository.find(User.class, username);
			
			if (user.getPassword().equals(password)) {//si introduce bien la contraseña
				
				if (session.getAttribute("role") == null) {//si no existe la variable de session, se le da un valor.
					session.setAttribute("role", user.getRole());
					session.setAttribute("user", user.getUser());
				}
				else {//si ya existe, recuperamos el valor
					session.getAttribute("role");
					session.getAttribute("user");
				}
				
				response.sendRedirect("./listCompanies.jsp");
			
			}
			else {//si introduce mal la contraseña
				message = "Usuario o contraseñas invalidos pesao.";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("./error.jsp?msg=Error");
		}
		
	}
	else {
		message = "Ningún campo puede ser nulo.";
	}
	
	%>

    <section>
    	<form action="#" method="get">
	        <p>Log in</p>
	        <div class="form">
	            <div class="user">
	                <label for="user">User:</label><br>
	                <input type="text" name="user" id="user"><br>
	            </div>
	            <div class="password">
	                <label for="password">Password:</label><br>
	                <input type="password" name="password" id="password"><br>
	            </div>
	            <button type="submit" name="submit">Log in</button>
	        </div>
        </form> <br> <br>
        <%if (request.getParameter("message") != null) { %>
    	<p id="message"><%= request.getParameter("message") %></p>
    <% } %>
    </section>
</body>
</html>