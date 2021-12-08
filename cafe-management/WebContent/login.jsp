<%@page import="com.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%
	Object auth = (request.getSession().getAttribute("auth"));
	if (auth !=null) {
		response.sendRedirect("index.jsp");
	}
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if (cart_list != null) {
		request.setAttribute("cart_list", cart_list);
	}
	%>
<!DOCTYPE html>
<html>


<head>
<%@include file="/includes/head.jsp"%>
<title>Morning Blend Cafe</title>
<link rel="stylesheet" href="login.css">
</head>
<body style="background-color:#d6d4e0;">


<script type="text/javascript">
        function preventBack() {
            window.history.forward();
        }
         
        setTimeout("preventBack()", 0);
         
        window.onunload = function () { null };
    </script>
	<%@include file="/includes/navbar.jsp"%>

	<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">User Login</div>
			<div class="card-body">
				<form name="loginForm" action="user-login" method="post">
					<div class="form-group">
						<label>Email address</label> 
						<input type="email" name="login-email" id="email" class="form-control" placeholder="Enter email">
					</div>
					<div class="form-group">
						<label>Password</label> 
						<input type="password" name="login-password" id="password" class="form-control" placeholder="Password">
						<span id="toggler" ><i class="far fa-eye"></i></span>
						<script type="text/javascript">
						 var password = document.getElementById('password');
						 var toggler = document.getElementById('toggler');
						  showHidePassword = () => {
							  if(password.type == 'password'){
								  password.setAttribute('type','text');
								  toggler.classList.add('fa-eye-slash');
							  }else{
								  toggler.classList.remove('fa-eye-slash');
								  password.setAttribute('type','password');
							  }
						  };
						  
						  toggler.addEventListener('click',showHidePassword);
						</script>
					</div>
					<div class="text-center">
						<button type="submit" onclick="login(loginForm)" class="btn btn-primary" id="myDiv" >Login</button>
	
					</div>
					<p>Don't have an account? <a href="register.jsp">Register</a></p>
				</form>
						<!-- 		<script>
				function login(loginForm)
				{
					if(loginForm.email.value && loginForm.password.value)
					{
						var email = document.getElementById("email").value;
						document.write('<html><body><h1><center>');
						document.write("Welcome" + " ");
						document.write(email);
						document.write('</center></h1></body></html>');
						document.write("<img src='images/istockphoto-1216782625-612x612.jpg' alt='alt tag'>");

						                var a = document.createElement('a');  
						                var link = document.createTextNode("Go to Menu Page"); 
						                a.appendChild(link);  
						                a.title = "Go to Menu Page";  
						                a.href = "index.jsp";  
						                document.body.appendChild(a);   
					}
					else
					{
						alert("Please enter your email and pasword");
					}
					
					
				}
				
				</script> -->
	
				
			</div>
		</div>
	</div>

	<%@include file="/includes/footer.jsp"%>
</body>
</html>