<!DOCTYPE html>
<html>
<body>

<script type="text/javascript">
        function send() {
        var req = new XMLHttpRequest();
        var server = "http://app2.ssobridge.com:8080/openam";
        var statusElem = document.getElementById("status");
            var data = {
              "username" : document.getElementById("username").value,
              "subject" : document.getElementById("subject").value,
              "message" : document.getElementById("message").value
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
                server + "/json/users?_action=forgotPassword",
                     true);

            req.setRequestHeader("Content-Type", "application/json");
            req.send(JSON.stringify(data));
            statusElem.innerHTML = "Waiting for server response..."
            document.write("Your request has been sent.");
            document.write("<br>Please check your email for instructions on reseting your password.");
        }
    </script>
<div id="content">
<h2>Enter your username:</h2>
<form name="status" id="status">
<p>Username: <input type="text" id="username"></p>
<input type="hidden" id="subject" value="Reset your forgotten password">
<input type="hidden" id="message" value="Follow this link to reset your password">
<p><input type="button" value="Change" id="button" onclick="send();"></p>
</form>
</div>
<p id="status"></p>
</body>
</html>

