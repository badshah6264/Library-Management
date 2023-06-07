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
<title>Library Management</title>

</head>
<body>
	<%@include file="navbar.jsp" %>
	
	<h1 class="pagehead">All Books</h1>
	
	<div class="homeheading">
		<div class ="bookid">Book Id</div>
		<div class="bookname">Book Name</div>
		<div class="authorname">Author Name</div>
	</div> 
	
	<sql:setDataSource var = "database" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/library_management"
         user = "root"  password = "password"/>
         
    <sql:query dataSource = "${database}" var = "result">
         SELECT * from all_books;
    </sql:query>
    
    <div class="homeheading">
    	<c:forEach var = "row" items = "${result.rows}">
    		<div class ="bookid"> <c:out  value = "${row.bookid}"/> </div>
        	<div class="bookname"> <c:out  value = "${row.bookname}"/> </div> 
			<div class="authorname"> <c:out  value = "${row.authorname}"/> </div> 
   		 </c:forEach>
    </div>
    
      
	
</body>
</html>