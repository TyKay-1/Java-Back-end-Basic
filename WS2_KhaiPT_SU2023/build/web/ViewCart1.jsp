<%-- 
    Document   : ViewCart1
    Created on : Jul 9, 2023, 9:59:57 AM
    Author     : Acer
--%>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Cart</title>
    </head>
    <body>
        <h1>View Cart</h1>

        <c:if test="${not empty sessionScope.CART}">
            <c:set var="cart" value="${sessionScope.CART}" />
            <c:if test="${not empty cart.items}">
                <table border="1" style="text-align: center">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Title</th>
                            <th>Quantity</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    <form action="MainController">
                        <c:set var="count" value="0" />
                        <c:forEach items="${cart.items}" var="item">
                            <c:set var="currentCount" value="${count + 1}" />
                            <tr>
                                <td>${currentCount}</td>
                                <td>${item.key}</td>
                                <td>${item.value}</td>
                                <td><input type="checkbox" name="checkItem" value="${item.key}" /></td>
                            </tr>
                            <c:set var="count" value="${currentCount}" />
                        </c:forEach>
                        <tr>
                            <td colspan="3">
                                <a href="bookStore.html">Add more items</a>
                            </td>
                            <td colspan="2">
                                <input type="submit" name="btAction" value="Remove Item">
                            </td>
                        </tr>
                    </form>
                </tbody>
            </table>
        </c:if>
        <c:if test="${empty cart.items}">
            <div style="color: red">There is no cart</div><br/>
            <a href="bookStore.html">Back to book Store</a>
        </c:if>
    </c:if>
</body>
</html>
