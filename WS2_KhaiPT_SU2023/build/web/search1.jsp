<%-- 
    Document   : search1
    Created on : Jul 9, 2023, 9:57:18 PM
    Author     : Acer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="KhaiPT.Registration.RegistrationDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Page</title>
    </head>
    <body>
        <%
            Cookie[] cks = request.getCookies();
            String username = cks[cks.length - 1].getName();
        %>
        <p style="color: red">Welcome, <%= username%></p>
        <h1>SEARCH PAGE</h1>
        <form action="MainController">
            <input type="text" name="txtSearch" value="${param.txtSearch}"/><br/><br/>
            <input type="submit" name="btAction" value="Search"/>
        </form>
        <c:if test="${param.txtSearch != null}">
            <c:if test="${not empty requestScope.SEARCHRESULT}">
                <c:set var="result" value="${requestScope.SEARCHRESULT}"/>
                <table border="1">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Username</th>
                            <th>Password</th>
                            <th>Last name</th>
                            <th>Role</th>
                            <th>Delete</th>
                            <th>Update</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${result}" var="users" varStatus="counts">
                            <c:url var="delete" value="MainController">
                                <c:param name="btAction" value="Delete"/>
                                <c:param name="txtUsername" value="${users.username}"/>
                                <c:param name="txtSearch" value="${param.txtSearch}"/>
                            </c:url>
                        <form action="MainController">
                            <tr>
                                <td>${counts.count}</td>
                                <td>
                                    ${users.username}
                                    <input type="hidden" name="txtUsername" value="${users.username}" />
                                </td>
                                <td>
                                    
                                    <input type="text" name="txtPassword" value="${users.password}" />
                                </td>
                                <td>
                                    
                                    <input type="text" name="txtLastname" value="${users.lastname}" />
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${users.role == true}">
                                            <input type="checkbox" name="isAdmin" value="ON" checked="checked"/>
                                        </c:when>
                                        <c:when test="${users.role == false}">
                                            <input type="checkbox" name="isAdmin" value=""/>
                                        </c:when>
                                        <c:otherwise></c:otherwise>
                                    </c:choose>
                                </td>
                                <td><a href="${delete}">Delete</a></td>
                                <td><input type="submit" value="Update" name="btAction"/></td>
                            </tr>
                            <input type="hidden" name="txtSearch" value="${param.txtSearch}"/>
                        </form>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </c:if>
            <br/>
    <a href="Login.html">Back to login</a>
</body>
</html>
