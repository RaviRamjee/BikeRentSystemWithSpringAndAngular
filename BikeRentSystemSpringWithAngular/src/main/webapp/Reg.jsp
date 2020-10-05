<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
<style>
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover:not(.active) {
  background-color: #111;
}

.active {
  background-color: #4CAF50;
}
.contacts-form {
	background: grey;
	border-radius: 10px;
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
	-o-border-radius: 10px;
	-ms-border-radius: 10px;
	padding: 70px 585px;
}
.form-control {
	padding: 10px 10px;
	margin: 3px;
}
</style>
</head>
<body>
<div class="switcher-wrapper">
		<div class="demo_changer">
			<div class="demo-icon customBgColor">
				<i class="fa fa-cog fa-spin fa-2x"></i>
			</div>
			<div class="form_holder">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="predefined_styles"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

<ul>
  <li><a href="Reg.jsp">Registration</a></li>
  <li><a href="Login.jsp">Login</a></li>
</ul>
	<section class="contacts">
		<div class="container">
			<div class="row">
				<div class="contacts-find">
					<div class="col-md-5 col-md-offset-3">
						<div class="contacts-form"
							style="background-color: rgba(80, 54, 84, 0.6); height: 100%">
							<h1 style="font-size: 200%; color: White" class="blog-title">Registration</h1>
							<div id="success"></div>

							<form onsubmit="return validation()" action="regUser" method="POST" id="contactForm">
								
                               
								<div class="comment-form__input">
									<input type="text" class="form-control" name="name"
										id="userName" placeholder="Full Name" required/>
										<span id="uname"></span>
								</div>
								<div class="comment-form__input">
									<input type="email" required class="form-control" name="email"
										id="userEmail" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" placeholder="Email" />
								</div>
								<div class="comment-form__input">
									<input type="password" class="form-control" name="password"
										id="userPassword"  placeholder="Password" minlength="8" maxlength="20" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
										title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required/>
							    </div>
							    
							    <div class="comment-form__input">
									<input type="password" class="form-control" 
										id="confirmPassword"  placeholder="confirm Password"  required/>
										<span id="confirmPass"></span>
							    </div>
								<div class="comment-form__input">
									<input type="text" minlength="10" maxlength="10" class="form-control" name="phoneNo"
										id="userPhone" placeholder="Phone No" required/>
										<span id="mobile"></span>
							    </div>
								<div class="comment-form__input">
									<input type="text" class="form-control" name="address"
										id="userAddress" minlength="5" placeholder="address" required/>
										<span id="address"></span>
								</div>
								<br>
								<center>
									<button type="submit"
										class="btn btn-primary"
										value="SignUp">Sign Up</button>
								</center>
								<br>
								<center>
									<a href="Login.jsp">Already have an account? Log in</a>
								</center>
							</form>
						</div>
					</div>
				</div>
			</div>
	</section>
	
	<script type="text/javascript">
	function validation()
	{
		var userName=document.getElementById('userName').value;
		var userEmail=document.getElementById('userEmail').value;
		var userPassword=document.getElementById('userPassword').value;
		var confirmPassword=document.getElementById('confirmPassword').value;
		var userPhone=document.getElementById('userPhone').value;
		var userAddress=document.getElementById('userAddress').value;
		
		if(userName.length <= 2 || userName.length > 20){
			document.getElementById('uname').innerHTML=" * user length must be between 2 and 20";
			return false;
			}
		if(!isNaN(userName)){
			document.getElementById('uname').innerHTML=" * only characters are allowed";
			return false;
			}
		if(userPassword!=confirmPassword){
			document.getElementById('confirmPass').innerHTML=" * password not matching";
			return false;	
		}
		if(isNaN(userPhone)){
			document.getElementById('mobile').innerHTML=" * user must write digits only";
			return false;	
		}
		if(userPhone.length !=10){
			document.getElementById('mobile').innerHTML=" * mobile number must be 10 digits only";
			return false;	
		}
		if(!isNaN(userAddress)){
			document.getElementById('address').innerHTML=" * only characters are allowed";
			return false;
		}
		
	}
	</script>
</body>
</html>