<%-- 
    Document   : NotiError
    Created on : Jun 24, 2023, 4:46:33 PM
    Author     : Acer
--%>

<%@page import="MyUtils.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create new Account</title>
    </head>
    <body>
        <%
            
            String usercheck1 = request.getParameter("usercheck");
            String passcheck1 = request.getParameter("passcheck");
            String confirmcheck1 = request.getParameter("confirmcheck");
            String namecheck1 = request.getParameter("namecheck");
            String checkdup1 = request.getParameter("checkdup");
        %>
        <h1>Create new account again !!!</h1> 
        <form action="MainController" method="POST">

            Username: <input type="text" name="txtUsername" required=""/>
            <%
                String usercheck = (String) request.getAttribute("USER_ERROR");
                if(usercheck != null){
            %>
            <font style="color: red">Username must have 6 - 20 characters !!!</font>
            <% } %> <br/>

            Password: <input type="password" name="txtPassword" required=""/>
            <%
                String passcheck = (String) request.getAttribute("PASS_ERROR");
                if(passcheck != null){
            %>
            <font style="color: red">Password must have 6 - 30 characters !!!</font>
            <% } %> <br/>
            
            Confirm Password: <input type="password" name="txtConfirm" required=""/>
            <%
                String confirmcheck = (String) request.getAttribute("CONF_ERROR");
                if(confirmcheck != null){
            %>
            <font style="color: red">Confirm password is not correct !!!</font>
            <% } %> <br/>
            
            Last name: <input type="text" name="txtLastname" required=""/>
            <%
                String namecheck = (String) request.getAttribute("NAME_ERROR");
                if(namecheck != null){
            %>
            <font style="color: red">Last name must have 6 - 30 characters !!!</font>
            <% } %> <br/>
            <br>
            <input type="submit" value="Create account" name="btAction" />
            <input type="reset" value="Reset" name="btReset"/><br/>
            <br>
            <%
                String dupcheck = (String) request.getAttribute("USER_DUPLI");
                if(dupcheck != null){
            %>
            <font style="color: red">Username was existed !!!</font>
            <% } %> <br/> 
        </form>
        <br>
        <a href="Login.html">Back to Login</a>

    </body>
</html>
