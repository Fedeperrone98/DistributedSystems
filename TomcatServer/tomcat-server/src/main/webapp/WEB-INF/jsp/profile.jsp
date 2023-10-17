<%@ page contentType="text/html;charset=UTF-8" %>
  <%@ page import="com.unipi.dsmt.app.dtos.UserProfileDTO" %>
  <%@ page import="com.unipi.dsmt.app.dtos.ChatStorageDTO" %>
  <%@ page import="java.util.List" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="css/profile.css?v=1.7">
      <title>Profile page</title>
    </head>

    <body style="margin: 0px;">
      <jsp:include page="/WEB-INF/jsp/components/nav_bar.jsp" />
        <div class="page">
          <div class="centerize-board">
            <div class="users-board">
              <% UserProfileDTO user = (UserProfileDTO)request.getAttribute("user_info"); %>
                <% String className="flag" ; %>
                  <% if(user.isOnline_flag()){ className +=" connected" ; } %>
                    <div class="user-card">
                      <h1>
                        <%= user.getUsername() %>
                      </h1>
                      <h2>
                        <%= user.getDepartment() %>
                      </h2>
                      <h3>
                        <%= user.getName() %>
                          <%= user.getSurname() %>
                      </h3>
                      <div class="<%= className %>"></div>
                    </div>
            </div>
            <div class="chats-board">
              <% List<ChatStorageDTO> chatList = (List<ChatStorageDTO>) request.getAttribute("chatList");%>
                <%for(ChatStorageDTO chat : chatList){%>
                  <div class="chat-card">
                    <h1>
                      <%=chat.getUsername()%>
                    </h1>
                    <label>
                      <%=chat.getLastMessageTime().toString()%>
                    </label>
                  </div>
                  <%}%>
            </div>
          </div>
        </div>
    </body>

    </html>