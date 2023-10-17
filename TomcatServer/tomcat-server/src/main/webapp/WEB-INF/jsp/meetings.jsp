<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.unipi.dsmt.app.dtos.AppointmentDTO" %>
  <%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/meetings.css?v=1.1">
  <title>Meetings page</title>
</head>

<body style="margin: 0px;">
  <jsp:include page="/WEB-INF/jsp/components/nav_bar.jsp" />
  <div class="page">
    <div class="meetings-board">
      <%List<AppointmentDTO> appointments = (List<AppointmentDTO>)request.getAttribute("appointments");%>
      <%for(AppointmentDTO appointment : appointments){%>  
        <div class="meeting-card">
          <h1>Host: <%=appointment.getHost()%></h1>
          <h1>Guest: <%=appointment.getGuest()%></h1>
          <h2>Timeslot: <%=appointment.getTimeslot().toString()%></h2>
          <label><%=appointment.getContent()%></label>
        </div>
      <%}%>  
    </div>
  </div>
</body>

</html>