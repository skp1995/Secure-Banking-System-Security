<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>Modify</title>
</head>
<body>
	<form action="${url}" method="post">
		<table>
			<tr>
				<th></th>
				<th>Your Account ID</th>
				<th>Requester Account ID</th>
				<th>Amount</th>
			</tr>

			<c:forEach items="${PendingList}" var="mods">
			<tr>
				<td><input type="radio" name="id" value="${mods.get("id")}">${entry.key}(${entry.value})</option></td>
				<td>${trans.get("from")}</td>
				<td>${trans.get("to")}</td>
				<td>${trans.get("amt")}</td>
			</tr>
			</c:forEach>
		</table>
		<button type="submit" name="action" value="approve">Approve</button>
		<button type="submit" name="action" value="decline">Decline</button>
	</form>
</body>
</html>