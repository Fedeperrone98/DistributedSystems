<%@ page contentType="text/html;charset=UTF-8" %>
  <%@ page import="com.unipi.dsmt.app.dtos.MessageChatDTO" %>
    <%@ page import="java.util.List" %>
      <%@ page import="java.text.SimpleDateFormat" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <link rel="stylesheet" href="css/chat.css?v=1.5">
          <title>Chat page</title>
          <%String username=(String) request.getAttribute("username");%>
            <% List<MessageChatDTO> messageList = (List<MessageChatDTO>) request.getAttribute("messageList"); %>
                <% String currentUsername=(String) request.getAttribute("currentUsername"); %>
                  <% boolean isOnline=(boolean) request.getAttribute("isOnline"); %>
        </head>

        <body style="margin: 0px;">
          <jsp:include page="/WEB-INF/jsp/components/nav_bar.jsp" />
          <div class="page">
            <div class="chat-name">
              <% String flagType="flag" + (isOnline ? " connected" : "" ); %>
                <div class="<%= flagType %>"></div>
                <h1>
                  <%= username %>
                </h1>
            </div>
            <div class="messages-board">
              <% if(messageList !=null){ %>
                <% for(MessageChatDTO message : messageList){ %>
                  <% String className="message-card " + (currentUsername.equals(message.getSender()) ? "sender"
                    : "receiver" ); %>
                    <div class="<%= className %>">
                      <div class="message-box">
                        <label>
                          <%= message.getContent() %>
                        </label>
                        <label>
                          <%= message.getCreationTime().toString() %>
                        </label>
                      </div>
                    </div>
                    <%}%>
                      <%}%>
            </div>
            <form action="">
              <input type="text"/>
            </form>
          </div>
        </body>

        </html>