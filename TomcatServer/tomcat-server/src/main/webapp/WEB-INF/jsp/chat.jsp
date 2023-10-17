<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.unipi.dsmt.app.dtos.MessageChatDTO" %>
  <%@ page import="java.util.List" %>
  <%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="css/chat.css?v=1.1">
  <title>Chat page</title>
</head>

<body style="margin: 0px;">
  <jsp:include page="/WEB-INF/jsp/components/nav_bar.jsp" />
  <div class="page">
    <div>
      <%String username = (String) request.getAttribute("username");%>
      <h1>
        <%=username%>
      </h1>
    </div>
    <div class="messages-board">
      <% List<MessageChatDTO> messageList = (List<MessageChatDTO>) request.getAttribute("messageList"); %>
      <% String currentUsername = (String) request.getAttribute("currentUsername"); %>
        <% for(MessageChatDTO message : messageList){ %>
          <% String className="message-card "; %>
          <% if(currentUsername.equals(message.getSender())){ className += "sender"; }
           else{ className += "receiver";} %>
          <div class="<%= className %>">
            <label><%= message.getContent() %></label>
            <label><%= message.getCreationTime().toString() %></label>
          </div>
          <%}%>
    </div>
  </div>
</body>

</html>