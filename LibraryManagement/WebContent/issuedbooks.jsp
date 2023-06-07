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

<style type="text/css">

.bookid{
	text-align:center;
	width:68px;
	border-right:2px solid black;
	padding: 13px 0px;
}

.bookname{
	text-align:center;
	width:580px;
	border-right:2px solid black;
	padding: 13px 0px;
}

.authorname{
	border-right:2px solid black;
	text-align:center;
	width:580px;
	padding: 13px 0px; 
} 


.issuedby{
	border-right:2px solid black;
	text-align:center;
	width:120px;
	padding: 13px 0px;
}

.issueddate{
	/* border-right:2px solid black; */
	text-align:center;
	width:120px;
	padding: 13px 0px;
	}
</style>

</head>
<body>
	<%@include file="navbar.jsp" %>
	
	<h1 class="pagehead" >Issued Books</h1>
	
	<div class="homeheading">
		
		
		<div class ="bookid" >Book Id</div>
	
		<div class="bookname" style="text-align:center;
	width:580px;
	border-right:2px solid black;
	padding: 13px 0px;">Book Name</div>
	
		<div class="authorname" style="border-right:2px solid black;
	text-align:center;
	width:580px;
	padding: 13px 0px;">Author Name</div>
	
		<div class="issuedby" style="border-right:2px solid black;
	text-align:center;
	width:150px;
	padding: 13px 0px;">Issued By</div>
	
		<div class="issueddate" style="text-align:center;
	width:130px;
	padding: 13px 0px;">Issued Date</div>
		
	</div>
	
	
	<sql:setDataSource var = "database" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/library_management"
         user = "root"  password = "password"/>
         
    <sql:query dataSource = "${database}" var = "result">
         SELECT * from issued_books;
    </sql:query>
    
    <div class="homeheading">
    	<c:forEach var = "row" items = "${result.rows}">
    		
		
		<div class ="bookid" ><c:out  value = "${row.bookid}"/></div>
	
		<div class="bookname" style="text-align:center;
	width:580px;
	border-right:2px solid black;
	padding: 13px 0px;"><c:out  value = "${row.bookname}"/></div>
	
		<div class="authorname" style="border-right:2px solid black;
	text-align:center;
	width:580px;
	padding: 13px 0px;"><c:out  value = "${row.authorname}"/></div>
	
		<div class="issuedby" style="border-right:2px solid black;
	text-align:center;
	width:150px;
	padding: 13px 0px;"><c:out  value = "${row.issuedby}"/>(<c:out  value = "${row.sid}"/>)</div>
	
		<div class="issueddate" style="text-align:center;
	width:130px;
	padding: 13px 0px;"><c:out  value = "${row.issueddate}"/></div> 
   		 </c:forEach>
    </div>
</body>
</html>