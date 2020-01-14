
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
		funnction loadXmlDoc(){
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
			var firstname=document.getElementById('fname');
			var lastname=document.getElementById('lname');
			var url='getResult.jsp?firstname=firstname&&lastname=lastname';
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
	input[type=text],input[type=password],input[type=email]{
		width:100%;
		box-sizing:border-box;
		padding:12px 5px;
		background:rgba(0,0,0,0.10);
		outline:none;
		border:none;
		border-bottom:1px dotted #fff;
		color:#fff;
		border-radius:5px;
		margin:5px;
		font-weight:bold;
		
	}
	input[type=submit]{
		width:100%;
		box-sizing:border-box;
		padding:10px 0;
		margin-top:30px;
		outline:none;
		border:none;
		background:#60adde;
		opacity:0.7;
		border-radius:20px;
		font-size:20px;
		color:#fff;
	}
	input[type=submit]:hover{
		background:#003366;
		opacity:0.7;
	}
  	body{
  		background:url(1.jpg);
  		background-size:cover;
  		font-family:arial;
  	}
    .wrap{
    	max-width:350px;
    	border-radius:20px;
    	margin:auto;
    	background:(0,0,0,0.8);
    	box-sizing:border-box;
    	padding:40px;
    	color:#fff;
    	margin-top:100px;
    }
    h2{
    	text-align:center;
    }
    
</style>
</head>
<body>
 	<div class="wrap">
		<h2>Signup Here</h2>
        <form action="register" method="post">
                <input type="text" name="firstName" placeholder="First name" required>
                <input type="text" name="lastName" placeholder="Last name"required>
                <input type="email" name="email"  placeholder=" E-mail " required>
                <input type="text" name="userName" placeholder="Username" required>
                <input type="password" name="Pass_word" placeholder="Enter password" required>
                <input type="submit" values="Sign Up">
        </form>
    </div>
</body>
</html>