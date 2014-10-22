<!DOCTYPE html>
<html>
<body>

<script type="text/javascript">
        function post() {
        var req1 = new XMLHttpRequest();
        var server = "http://[AM server and port]/openam";
        var stat = document.getElementById("status");
            var data = {
              "username" : document.getElementById("username").value,
              "subject" : document.getElementById("subject").value,
              "message" : document.getElementById("message").value
            };

            req1.onreadystatechange = function() {
                if (req1.readyState == 4) {
                    stat.innerHTML = req1.responseText;
                    if (req.status == 200) {
                     document.getElementById("content").style.display = "none";
                    }
                }
            };
            req1.open("POST", server + "/json/users?_action=forgotPassword", true);

            req1.setRequestHeader("Content-Type", "application/json");
            req1.send(JSON.stringify(data));
            stat.innerHTML = "Waiting for server response..."
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
<p><input type="button" value="Change" id="button" onclick="post();"></p>
</form>
</div>
</body>
</html>

