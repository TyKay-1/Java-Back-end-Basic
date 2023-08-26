<%-- 
    Document   : NotiError2
    Created on : Jul 10, 2023, 9:25:16 PM
    Author     : Acer
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create new user Page</title>
    </head>
    <body>
        <h1>Create new account again !!!</h1>
        
        <form action="MainController" method="POST">
            Username: <input type="text" name="txtUsername" required=""/>
           <!-- <font style="color: red"><c:out value="${requestScope.USER_ERROR}"></c:out></font>-->
            <p>${USER_ERROR}</p>
            <br/>
            Password: <input type="text" name="txtPassword" required=""/>
            <font style="color: red"><c:out value="${requestScope.PASS_ERROR}"></c:out></font>
            <br/>
            Confirm password: <input type="text" name="txtConfirm" required=""/>
            <font style="color: red"><c:out value="${requestScope.CONF_ERROR}"></c:out></font>
            <br/>
            Last name: <input type="text" name="txtLastname" required=""/>
            <font style="color: red"><c:out value="${requestScope.NAME_USER}"></c:out></font>
            <br/>
            <font style="color:red"><c:out value="${requestScope.USER_DUPLI}"></c:out></font>
            <br/>
            <input type="submit" value="Create account" name="btAction" />
            <input type="reset" value="Reset" />
        </form>               
    </body>
</html>
