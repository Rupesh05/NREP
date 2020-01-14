<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
		function loadXmlDoc(){
			try{
				xmlHttp=new XMLHttpRequest();
			}catch(Exception e){
				try{
					xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
				}catch(Exception e1){
					try{
						xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
					}catch(Exception e2){
						alert("AJAX not supported");
						return false;
					}
				}
			}
			xmlHttp.onreadystatechange=processResponse;
			var userName=document.getElementById('user_Name');
			var url='getResult.jsp?userName=userName;
			/*setup request using open method*/
			xmlHttp.open("GET",url,true);
			/*send the post request*/
			xmlHttp.send(null);
		}
		
		/*callback function*/
		function processResponse(){
			if(xmlHttp.readyState == 4 && xmlHttp.status == 200){
				var sp=document.getElementById('result');
				sp.innerText = xmlHttp.responseText;
			}
		}
		
/* form validation*/
 		function validation(thisform){
     var fname=thisform.firstName.value;
     var lname=thisform.lastName.value;
     var e_mail=thisform.email.value;
     var d=/^[\w\.\-\+]+\@[a-zA-Z0-9\.\-]+\.[a-zA-Z0-9]{2,4}$/;
    
     var c=/^[0-9]+$/;
     var pwd=thisform.password.value;
     var cpwd=thisform.confirmPassword.value;
     var p=/^[a-zA-Z0-9]+$/;
     if(e_mail!=d){
        alert("Invalid email");
         thisform.email.focus();
         return false;
     }
     if(pwd.length<8){
        alert("password must contain atleast 8 character");
         thisform.password.focus.focus();
         return false;
     }
     if(cpwd!=pwd){
        alert("password not matched");
         thisform.pwd.focus();
         return false;
     }
     
 }
</script>
<style>
@import "https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css";
body{
	margin:0;
	padding:0;
	font-family:sans-serif;
	background:url(login4.jpg) no-repeat;
	background-size:cover;
	font-color:black;
}
.login-box{
		width:280px;
		position:absolute;
		top:50%;
		left:50%;
		transform: translate(-50%,-50%);
		color:white;
}
.login-box h1{
	float:left;
	font-size:40px;
	border-bottom:6px solid black;
	margin-bottom:50px;
	padding:13px 0;
}
.textbox{
	width:70%;
	overflow:hidden;
	font-size:20px;
	padding:8px 0;
	margin:8px 0;
	border-bottom:1px solid black;
	
}
.textbox i{
	width:26px;
	float:left;
	text-align:center;
}
.textbox input{
	border:none;
	outline:none;
	background:none;
	color:white;
	font-size:22px;
	width:100px;
	float:left;
	margin:0 10px;
}
.btn{
	width:100%;
	background:none;
	border:2px solid black;
	color:white;
	padding:5px;
	font-size: 22px;
	cursor:pointer;
	margin:20px 0;
}
</style>
</head>
<body>
  <div class="login-box">
       <h1> LOGIN FORM</h1>
        <form action="login" method="post" >
        	<div class="textbox">
        	<i class="fa fa-user"></i>
                <input type="text" name="userName" placeholder="Username" id="user_Name" required>
            </div>
            <div class="textbox">
            <i class="fa fa-lock"></i>
           	    <input type="password"  name="pass_word" placeholder="Password" required>
           	    </div>
                <input type="submit" class="btn" value="Sign in">
                <p id="result"></p>
        </form>
  </div>
</body>
