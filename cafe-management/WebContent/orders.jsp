
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
	    request.setAttribute("user_id", auth);
	    OrderDao orderDao  = new OrderDao(DbCon.getConnection());
		orders = orderDao.userOrders(auth);
	}else{
		response.sendRedirect("login.jsp");
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
<link rel="stylesheet" href="cart.css">
</head>
<body>
<script type="text/javascript">
        function preventBack() {
            window.history.forward();
        }
         
        setTimeout("preventBack()", 0);
         
        window.onunload = function () { null };
    </script>
	<%@include file="/includes/navbar.jsp"%>
	<div class="container">
		<div class="card-header my-3">All Orders</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Date</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
			
			<%
			if(orders != null){
				for(Order o:orders){%>
					<tr>
						<td><%=o.getDate() %></td>
						<td><%=o.getName() %></td>
						<td><%=o.getCategory() %></td>
						<td><%=o.getQunatity() %></td>
						<td><%=dcf.format(o.getPrice()) %></td>
						<td><a class="btn btn-sm btn-danger" href="cancel-order?id=<%=o.getOrderId()%>">Cancel Order</a></td>
					</tr>
				<%}
			}
			%>
			
			</tbody>
		</table>
			<a href="bill.jsp"><button  class="button button2">Proceed</button></a>
	</div>
	<%@include file="/includes/footer.jsp"%>
</body>
</html>