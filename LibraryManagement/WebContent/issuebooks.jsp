<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Library Management</title>
<link rel="stylesheet" type="text/css" href="css/mainpage.css"> 
<link rel="stylesheet" type="text/css" href="css/addbooks.css">
<link rel="stylesheet" type="text/css" href="css/issuebooks.css">
</head>
<body>
	<%@include file="navbar.jsp" %>
	
	<h1 class="pagehead">Issue Book</h1>
	
	<form action="issuebooks" method="post" class="addbookform">
		<input type="text" name="sname" placeholder="Enter Your Name" class="abi" required="required">
		<input type="text" name="sid" placeholder="Enter Student Id" class="abi" required="required">
		<input type="text" name="bookid" placeholder="Enter Book Id" class="abi" required="required">
		<input type="text" name="bookname" placeholder="Enter Book Name" class="abi" required="required">
		<input type="text" name="authorname" placeholder="Enter Author Name" class="abi" required="required">
		
		<button type="submit" class="btn" style="margin: 20px;" >
			<div class="button" id="button-6" style="margin: 0px;">
    			<div id="spin"></div>
    			<a>Issue Book</a>
 		 	</div>
		</button>
	</form>
</body>
</html>