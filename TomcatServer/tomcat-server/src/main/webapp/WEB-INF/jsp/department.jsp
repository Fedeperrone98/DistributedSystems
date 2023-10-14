<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.unipi.dsmt.app.dtos.UserDepartmentDTO" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/department.css?v=1.4">
  <title>Department</title>
</head>

<body style="margin: 0px;">
  <div>
    <jsp:include page="/WEB-INF/jsp/nav_bar.jsp" />
   </div>
  <div class="page">
    <% String department_name = (String) request.getParameter("name"); %>
    <h1><%=department_name%> Department</h1>
    <% ArrayList<UserDepartmentDTO> users = (ArrayList<UserDepartmentDTO>) request.getSession().getAttribute("users"); 
       for (UserDepartmentDTO user : users){

    %>
    <div class="user-card">
      <label>Name:</label><p> <%=user.getName()%></p>
      <label>Surname:</label><p> <%=user.getSurname()%></p>
      <label>Username:</label><p> <%=user.getUsername()%></p>
      <label>Online:</label><p> <%=user.isOnline_flag()%></p>
    </div>
    <%
       }
    %>

  </div>
  
</body>

</html>