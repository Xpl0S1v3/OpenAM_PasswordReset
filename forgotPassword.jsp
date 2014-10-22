<!DOCTYPE html>
<html>
<body>
 
<script type="text/javascript">
        function send() {
        var req = new XMLHttpRequest();
        var server = "http://app2.ssobridge.com:8080/openam";
        var statusElem = document.getElementById("status");
            var data = {
              "tokenId" : document.getElementById("tokenId").value,
              "confirmationId" : document.getElementById("confirmationId").value,
              "username" : document.getElementById("username").value,
              "userpassword" : document.getElementById("userpassword").value,
              "confirm" : document.getElementById("confirm").value
            };
 
            req.onreadystatechange = function() {
                if (req.readyState == 4) {
                    statusElem.innerHTML = req.responseText;
                    if (req.status == 200) {
                     document.getElementById("content").style.display = "none";
                    }
                }
            };
            req.open("POST",
                server + "/json/users?_action=forgotPasswordReset",
                     true);
 
            req.setRequestHeader("Content-Type", "application/json");
            req.send(JSON.stringify(data));
            statusElem.innerHTML = "Waiting for server response..."
            document.write("Your password has been reset.");
            document.write("<br>Click <a href='http://app2.ssobridge.com:8080/openam'>here</a> to login again.");
        }
    </script>
<div id="content">
<h2>Enter your new password</h2>
<p>Password: <input type="password" id="userpassword"></p>
<p>Confirm:&nbsp&nbsp&nbsp <input type="password" id="confirm"></p>
<form name="status" id="status">
<input type="hidden" id="tokenId" value="<%= request.getParameter("tokenId") %>">
<input type="hidden" id="confirmationId" value="<%= request.getParameter("confirmationId") %>">
<input type="hidden" id="username" value="<%= request.getParameter("username") %>">
<p><input type="button" value="Change" id="button" onclick="send();"></p>
</form>
</div>
<p id="status"></p>
</body>
</html>
