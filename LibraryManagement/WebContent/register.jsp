<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Portal</title>
<script src="https://kit.fontawesome.com/bf618deaa2.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="css/register.css">
<!-- <script type="text/javascript" src="../js/register.js"></script> -->

<script>

function myfunc1(){
    let a = document.getElementById("password1");
    let b = document.getElementById("show1");
    let c = document.getElementById("hide1");

    if (a.type==="password") {
        a.type="text";
        b.style.display="block";
        c.style.display="none";
    } else {
        a.type="password";
        b.style.display="none";
        c.style.display="block";
    }
}
function myfunc2(){
    let a = document.getElementById("password2");
    let b = document.getElementById("show2");
    let c = document.getElementById("hide2");

    if (a.type==="password") {
        a.type="text";
        b.style.display="block";
        c.style.display="none";
    } else {
        a.type="password";
        b.style.display="none";
        c.style.display="block";
    }
}

</script>

</head>
<body>
	<%@include file="navbar.jsp"%>

	<h1 class="pagehead">Registration Form</h1>

	<form action="registrationform" method="post">
		<div class="container">

			<div class="box">
				<i class="fa fa-user"></i> <input id="myname" type="text"
					name="sname" placeholder="Enter Your Full Name"
					required="required" />
			</div>
			<div class="box">
				<i class="fa-solid fa-id-card" style="color: blue;"></i><input
					id="sid" type="number" name="sid" placeholder="Enter Your Id"
					required="required" />
			</div>
			<div class="box">
				<i class="fa-solid fa-phone" style="color: blue;"></i><input
					id="phone" type="number" name="sphone"
					placeholder="Enter Your Phone Number" required="required" />
			</div>
			<div class="box">
				<i class="fa fa-envelope"></i> <input id="email" type="email"
					name="semail" placeholder="Enter Your Email" required="required" />
			</div>
			<div class="box">
				<i class="fa fa-key"></i> <input id="password1" type="password"
					name="spass1" placeholder="Enter Your Password"
					required="required" /><span id="hideandseek1" onclick="myfunc1()"><i
					class="fa fa-eye" id="show1"></i><i class="fa fa-eye-slash"
					id="hide1"></i></span>
			</div>
			<div class="box">
				<i class="fa fa-key"></i> <input id="password2" type="password"
					name="spass2" placeholder="Confirm Your Password"
					required="required" /><span id="hideandseek2" onclick="myfunc2()"><i
					class="fa fa-eye" id="show2"></i><i class="fa fa-eye-slash"
					id="hide2"></i></span>
			</div>
			<button class="bttn" type="submit" >Sign Up</button>
		</div>
		

	</form>
</body>
</html>