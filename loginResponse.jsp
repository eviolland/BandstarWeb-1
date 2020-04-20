<%-- 
    Document   : loginResponse
    Created on : Apr 11, 2017, 9:29:05 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="mybean" scope="session" class="org.bandstar.login.UserLogin" />
        <jsp:setProperty name="mybean" property="userId" />
        <h1>Hello, <jsp:getProperty name="mybean" property="userId" /> </h1>
    </body>
</html>
