<%-- 
    Document   : NotiError1
    Created on : Jul 9, 2023, 10:22:53 AM
    Author     : Acer
--%>

<%@ page import="MyUtils.UserError" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create new Account</title>
    </head>
    <body>
        <h1>Create new account again !!!</h1>
        <form action="MainController" method="POST">

            Username: <input type="text" name="txtUsername" required=""/>
            <c:if test="${not empty requestScope.USER_ERROR}">
                <font style="color: red">Username must have 6 - 20 characters !!!</font>
            </c:if><br/>

            Password: <input type="password" name="txtPassword" required=""/>
            <c:if test="${not empty requestScope.PASS_ERROR}">
                <font style="color: red">Password must have 6 - 30 characters !!!</font>
            </c:if><br/>

            Confirm Password: <input type="password" name="txtConfirm" required=""/>
            <c:if test="${not empty requestScope.CONF_ERROR}">
                <font style="color: red">Confirm password is not correct !!!</font>
            </c:if><br/>

            Last name: <input type="text" name="txtLastname" required=""/>
            <c:if test="${not empty requestScope.NAME_ERROR}">
                <font style="color: red">Last name must have 6 - 30 characters !!!</font>
            </c:if><br/><br>

            <input type="submit" value="Create account" name="btAction"/>
            <input type="reset" value="Reset" name="btReset"/><br/><br>

            <c:if test="${not empty requestScope.USER_DUPLI}">
                <font style="color: red">Username was existed !!!</font>
            </c:if><br/>
        </form>
        <br>
        <a href="Login.html">Back to Login</a>
    </body>
</html>
