<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<script src='https://www.google.com/recaptcha/api.js'></script>
<!--<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
    <script src='https://www.google.com/recaptcha/api.js?onload=reCaptchaCallback&render=explicit'></script>
    <script>
            $(document).ready(function() {
                $('select').material_select();
            });
        </script>
<title>Welcome</title>
</head>
<body>
    <div class="container">
        <nav>
                <div class="nav-wrapper">
                  <a class="brand-logo"> Secure Banking Application</a>
                  <ul id="nav-mobile" class="right hide-on-med-and-down">
                      <li><a href="/securebank/home">Home<i class="material-icons left">home</i></a></li>
                      <li><a href="/securebank/logout">Logout<i class="material-icons left">exit_to_app</i></a></li>
                  </ul>
                </div>
            </nav>
	<form action="/securebank/authorize/modify" method="post">
            <div class="section">
		<table class="striped">
			<tr>
                            <th></th>
				<th>Username</th>
				<th>E-Mail</th>
				<th>Address</th>
				<th>Zipcode</th>
				<th>Gender</th>
				<th>Contact Number</th>
			</tr>
			<c:forEach items="${modifylist}" var="ModifyList">
				<tr>
                                        <td><p><input type="radio" name="modify" id="${ModifyList.get('idNo')}"
                                              value="${ModifyList.get('idNo')}" /><label for="${ModifyList.get('idNo')}"> </label></p>
					<td>${ModifyList.get("user_name")}</td>
					<td>${ModifyList.get("email")}</td>
					<td>${ModifyList.get("address")}</td>
					<td>${ModifyList.get("zipcode")}</td>
					<td>${ModifyList.get("gender")}</td>
					<td>${ModifyList.get("contact_no")}</td>
                                        </td>
				</tr>

			</c:forEach>
		</table>
            </div>
                <div class="row">
                    <div class="col s10"> 
                        <button type="submit" class="btn waves-effect waves-light right green accent-4" name="action" value="approve">Approve</button>
                    </div>
                    <div class="col s2"> 
                        <button type="submit" class="btn waves-effect waves-light right green accent-4" name="action" value="decline">Decline</button>
                    </div>
                </div>                            
	</form>
    </div>
</body>
</html>