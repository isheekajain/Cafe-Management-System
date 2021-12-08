<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Registration</title>
 <link rel="stylesheet" href="register.css">  
</head>
<body style="background-color:#d6d4e0;">
<script type="text/javascript">
        function preventBack() {
            window.history.forward();
        }
         
        setTimeout("preventBack()", 0);
         
        window.onunload = function () { null };
    </script>

      <form action="RegisterServlet">
  <div class="container">
  <div class="column left">
    <img  class="img" src="./images/photo-1559305616-3f99cd43e353.jpg">
  </div>
  <div class="column right">
  
    <h1>Registration Form</h1>
    <p>Please fill in this form to create an account in our cafe.</p>
    <form method="post">
      <input class="inputSty" type="name" name="name" placeholder="Enter your Name" required>
     <input class="inputSty" type="email" name="email" placeholder="Enter Email" required>
     <input class="inputSty" type="password" name="password" placeholder="Enter Password" required>
     
     <input class="button" type="submit" value="Register">
     <p>Already have an account? <a href="login.jsp">Login</a></p>
    
<!-- 
    <label for="Name"><b>Full Name</b></label>
    <input class="inputSty" type="text" placeholder="Enter Full Name" name="name" id="name" required>
     <label for="email"><b>Email</b></label>
    <input class="inputSty" type="text" placeholder="Enter Email" name="email" id="email" required>
      <hr>
    <label for="psw"><b>Enter Password</b></label>
    <input class="inputSty" type="password" placeholder="Enter Password" name="password" id="psw" required>
     <button type="submit" href = "index.jsp" class="button">Register</button> -->
     
  </div>
  </div>
</form>
</body>
</html>