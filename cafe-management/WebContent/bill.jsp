<%@page import="com.dao.UserDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.dao.OrderDao"%>
<%@page import="com.connection.DbCon"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
	<%
	DecimalFormat dcf = new DecimalFormat("#.##");
	request.setAttribute("dcf", dcf);
	int auth = Integer.parseInt(request.getSession().getAttribute("auth").toString());
	List<Order> orders = null;
	if (auth != 0) {
	    request.setAttribute("person", auth);
	    OrderDao orderDao  = new OrderDao(DbCon.getConnection());
		orders = orderDao.userOrders(auth);
	}else{
		response.sendRedirect("login.jsp");
	}
	 ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if (cart_list != null) {
		request.setAttribute("cart_list", cart_list);
	}  
	/* ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	List<Cart> cartProduct = null;
	if (cart_list != null) {
		ProductDao pDao = new ProductDao(DbCon.getConnection());
		cartProduct = pDao.getCartProducts(cart_list);
		double total = pDao.getTotalCartPrice(cart_list);
		request.setAttribute("total", total);
		request.setAttribute("cart_list", cart_list);
	}
	 */
	%>

<html>
<head>
<link rel="stylesheet" href="bill.css">
<title>Bill</title>
</head>
<script src="bill.js"></script>
<script src="https://kit.fontawesome.com/77779ef05d.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css2?family=Dancing+Script:wght@600&display=swap" rel="stylesheet">
<body style="background-color: #d6d4e0;">
<script type="text/javascript">
        function preventBack() {
            window.history.forward();
        }
         
        setTimeout("preventBack()", 0);
         
        window.onunload = function () { null };
    </script>
<h3>Cafe Bill</h3>
<hr>

<!-- <div class="left-div"> <h3><i class="fas fa-user"></i> Name: </h3></div>
<div class="right-div-right"><h3><i class="fas fa-envelope"></i> Email: </h3></div>
<div class="right-div-right"><h3><i class="fab fa-amazon-pay"></i> Payment Method: Online</h3></div> -->
<!-- <div class="left-div"><h3><i class="far fa-credit-card"></i> Transaction Id:  </h3></div>
<div class="right-div"><h3><i class="fas fa-map-marker-alt"></i> Address: </h3></div>  -->


	
	<br>
	
<!-- <table id="customers">
<h3>Order Details</h3>
  <tr>
    <th>S.No</th>
    <th>Food Name</th>
    <th>Price</th>
    <th>Quantity</th>
     <th>Sub Total</th>
  </tr>
  
  <tr>
 
  <tr>
</table> -->
<table id = "customers" class="table table-light">
			<thead>
				<tr>
					<th scope="col">Date</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
				</tr>
			</thead>
			<tbody>
			
			<%
			if(orders != null){
				for(Order o:orders){%>
					<tr>
						<td><%=o.getDate() %></td>
						<td id = 'cart-items'><%=o.getName() %></td>
						<td><%=o.getCategory() %></td>
						<td id = 'cart-quantity-input'><%=o.getQunatity() %></td>
						<td id='cart-price'><%=dcf.format(o.getPrice()) %></td>
					</tr>
				<%}
			}
			%>
			
			</tbody>
		</table>
<!-- <h3 class="heading" >Total: <span class="cart-total-price">$0</span></h3> -->
<!-- <h3 class="heading">Discount 2%: </h3>
<h3 class="heading">Gst 5%: </h3>
<h3 class="heading">Net Amount: </h3> -->
<br>
<br>
<br>
<a onclick="window.print();"><button class="button">Print</button></a>  <a href="index.jsp"><button class="button" >Continue Purchasing</button></a>  <a href="index.html">
<button class="button" >Check Status</button></a>


<br><br><br><br>

<h3 class="design">Eat As Much As You Like!</h3>
<br>
<br>
<br>
<br>
<div class="row">
  <div class="column" style="background-color:#fff;">
    <h2>LOCATION</h2>
    <p>112 W Main St.</p>
     <p>Pimpri, Pune-411018</p>
  </div>
  <div class="column" style="background-color:#fff;">
    <h2>HOURS</h2>
    <p>Monday - Saturday, 9am to 11pm</p>
    <p>Special Offers on Sundays</p>
  </div>
  <div class="column" style="background-color:#fff;">
    <h2>CONTACT</h2>
    <p>18602660010</p>
    <p>customercare@morningblend.com</p>
  </div>
</div>
</body>
</html>