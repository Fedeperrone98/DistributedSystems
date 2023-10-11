<!DOCTYPE html>
<html lang="en">

<head>
  <title>Error login</title>
  <% String message=(String) request.getAttribute("message"); %>
    <% String stack=(String) request.getAttribute("stack"); %>
</head>

<body style="margin: 0px;">
  <div class="page">
    <h1>Fatal Error: <%= message %>
    </h1>
    <p>
      <%= stack %>
    </p>
  </div>
</body>

</html>