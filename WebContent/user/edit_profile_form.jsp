<html>
<head>
<title>Edit Profile</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<script src="edit_profile.js"></script>
</head>
<body>
	<form id="edit_profile" name="edit_profile" action="edit_profile.jsp">
		<table>
			<tr>
				<td>User ID (Email) :</td>
				<td><input type="text" id="user_id" name="user_id"
					readonly="readonly" value="${sessionScope.user.userId}"/></td>
			</tr>
			<tr>
				<td>Current password :</td>
				<td><input type="password" id="current_password"
					name="current_password"/></td>
			</tr>
			<tr>
				<td>New password :</td>
				<td><input type="password" id="new_password"
					name="new_password" /></td>
			</tr>
			<tr>
				<td>Confirm new password :</td>
				<td><input type="password" id="confirm_new_password"
					name="confirm_new_password" /></td>
			</tr>
			<tr>
				<td>Nickname :</td>
				<td><input type="text" id="nickname" name="nickname" value="${sessionScope.user.nickname}"/></td>
			</tr>
			<tr>
				<td><input type="button" value="Edit"
					onClick="checkValidation()" /></td>
			</tr>
		</table>
	</form>
</body>
</html>