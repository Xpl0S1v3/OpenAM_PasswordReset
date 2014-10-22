OpenAM_PasswordReset
====================

OpenAM_Password_Reset_Rest

These files are a proof of concept to extend OpenAM's REST-based password reset functionality

- Add these two files to your OpenAM deployment root (e.g. /tomcat7/webapps/openam)
- Modify the server urls to the appropriate servers in your environment
- Change the REST Security settings in the OpenAM console (e.g. http://[AM server and port]/openam/forgotPassword.jsp)
- 
To initiate the password reset direct your browser to:
- http://[AM server and port]/openam/resetPassword.jsp
- provide a valid username (press enter)
- check email for link to reset password (click on link)
- provide a new password (and confirm) (press enter)
- 
