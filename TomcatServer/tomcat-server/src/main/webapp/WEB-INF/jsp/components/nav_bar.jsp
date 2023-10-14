<link rel="stylesheet" href="css/nav_bar.css?v=1.4">

<% String my_username=(String) request.getSession().getAttribute("my_username"); %>
  <nav class="navbar">
    <a href="${pageContext.request.contextPath}/home">Home</a>
    <a href="${pageContext.request.contextPath}/profile?username=${my_username}">Profile</a>
    <a href="${pageContext.request.contextPath}/meetings">Meetings</a>
    <a href="${pageContext.request.contextPath}/logout"><img src="icons/close.png" width="30px" height="30px"></a>
    <div class="notification">
      <a href="${pageContext.request.contextPath}/notifications"><img src="icons/bell.png" alt="" width="30px"
          height="30px"></a>
      <label>0</label>
    </div>
  </nav>