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
	
	<h1 class="pagehead">Submit Book</h1>
	
	<form action="submitbooks" method="post" class="addbookform">
		<input type="text" name="sname" placeholder="Enter Your Name" class="abi">
		<input type="text" name="sid" placeholder="Enter Student Id" class="abi">
		<input type="text" name="bookid" placeholder="Enter Book Id" class="abi">
		<input type="text" name="bookname" placeholder="Enter Book Name" class="abi">
		<input type="text" name="authorname" placeholder="Enter Author Name" class="abi">
		
		<button type="submit" class="btn" style="margin: 20px;" >
			<div class="button" id="button-6" style="margin: 0px;">
    			<div id="spin"></div>
    			<a>Submit Book</a>
 		 	</div>
		</button>
	</form>
</body>
</html>