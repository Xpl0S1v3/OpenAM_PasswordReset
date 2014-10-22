<!DOCTYPE html>
<html>
<body>
 
<script type="text/javascript">
        function post() {
        var req1 = new XMLHttpRequest();
        var server = "http://[openam server and port]/openam";
        var stat = document.getElementById("status");
            var data = {
              "tokenId" : document.getElementById("tokenId").value,
              "confirmationId" : document.getElementById("confirmationId").value,
              "username" : document.getElementById("username").value,
              "userpassword" : document.getElementById("userpassword").value,
              "confirm" : document.getElementById("confirm").value
            };
 
            req1.onreadystatechange = function() {
                if (req1.readyState == 4) {
                    stat.innerHTML = req1.responseText;
                    if (req1.status == 200) {
                     document.getElementById("content").style.display = "none";
                    }
                }
            };
            req1.open("POST", server + "/json/users?_action=forgotPasswordReset", true);
            req1.setRequestHeader("Content-Type", "application/json");
            req1.send(JSON.stringify(data));
            
            document.write("Your password has been reset.");
            document.write("<br>Click <a href='http://[openam server and port]/openam'>here</a> to login again.");
        }
    </script>
<div id="content">
 <h2>Enter your new password</h2>
 <p>Password: <input type="password" id="userpassword"></p>
 <p>Confirm: <input type="password" id="confirm"></p>
<form name="status" id="status">
  <input type="hidden" id="tokenId" value="<%= request.getParameter("tokenId") %>">
  <input type="hidden" id="confirmationId" value="<%= request.getParameter("confirmationId") %>">
  <input type="hidden" id="username" value="<%= request.getParameter("username") %>">
  <p><input type="button" value="Change" id="button" onclick="post();"></p>
 </form>
</div>
</body>
</html>
