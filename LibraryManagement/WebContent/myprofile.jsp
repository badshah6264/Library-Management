<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>
<link rel="stylesheet" type="text/css" href="css/profile.css">
</head>
<body>
	
	<%@include file="navbar.jsp" %>
	<h1 class="pheading">Profile Page</h1>
	
	<c:set var="sc" value='${requestScope["data"]}' />
	
	<sql:setDataSource var = "database" driver = "com.mysql.cj.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/library_management"
         user = "root"  password = "password"/>
         
    
    <sql:query dataSource = "${database}" var = "result">
         SELECT * from students_info WHERE sid = ?;
         <sql:param value = "${sc}" />
    </sql:query>
    
	
	<div class="pcontainer"> 
		<c:forEach var = "row" items = "${result.rows}">
    		<div><label>Name :&nbsp; </label>  <div class ="pinfo"> <c:out  value = "${row.sname}"/> </div></div> 
        	<div><label>ID :&nbsp; </label> <div class="pinfo"> <c:out  value = "${row.sid}"/> </div> </div> 
			<div><label>Phone :&nbsp; </label> <div class="pinfo"> <c:out  value = "${row.sphone}"/> </div> </div>
			<div><label>Email :&nbsp; </label> <div class="pinfo"> <c:out  value = "${row.semail}"/> </div></div> 
   		 </c:forEach>
	</div>
	<a href="logout" class="logoutbtn">Logout</a>
</body>
</html>