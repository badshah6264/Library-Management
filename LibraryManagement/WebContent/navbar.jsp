<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<link rel="stylesheet" type="text/css" href="css/mainpage.css"> 
 <link rel="stylesheet" type="text/css" href="css/addbooks.css"> 
 <script src="https://kit.fontawesome.com/bf618deaa2.js" crossorigin="anonymous"></script>
 
 <h1 id="libname">Library Management System</h1>
 <div class="topnav">
  	  <a href="mainpage.jsp" id="home" class="left">Home</a>
  	  <a href="addbooks.jsp" id="add" class="left">Add Books</a>
	  <a href="issuebooks.jsp" id="issue" class="left">Issue Books</a>
	  <a href="submitbooks.jsp" id="submit" class="left">Submit Books</a>
	  <a href="issuedbooks.jsp" id="issued" class="left">Issued Books</a>
	  <a href="issuebyyou" id="issuedby" class="left">Issued By You</a>
	  
	  <a href="register.jsp" class="right" id="register">Register</a>
	  <a href="login.jsp" class="right" id="login">Login</a>
	  
	   <a href="profile" class="right" id="profile">Profile</a> 
	  
	  
	  <a id="search" class="right">
	  	<form action="search" method="get" class="searchbutton">
	  		<input type="text" name="scontent" placeholder="Search By Book Name">
	  		<button type="submit" style="background-color: transparent;border: none;">
	  			<i class="fa-solid fa-magnifying-glass"></i>
	  		</button>
	  	</form>
	  </a>
</div> 
