<%-- 
    Document   : search2
    Created on : Jul 11, 2023, 9:24:25 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Page</title>
    </head>
    <body>
        <%
            Cookie[] cookies = request.getCookies();
            String username = cookies[cookies.length-1].getName();
        %>
        <font color="red">Welcome, <%=  username %></font>
        <h1>Search Page</h1>
        
        <form action="MainController">
            <input type="text" name="txtSearch">
            <input type="submit" value="Search" name="btAction" />
        </form>
        
        <c:if test="${param.txtSearch!=null}">
            <c:if test="${requestScope.SEARCHRESULT}">
                <c:forEach var="user" items="${result}" varStatus="count">
                
            </c:forEach>
            </c:if>
            
        </c:if>
    </body>
</html>
