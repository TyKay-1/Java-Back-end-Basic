<%-- 
    Document   : search
    Created on : Jun 10, 2023, 10:59:27 AM
    Author     : Acer
--%>

<%@page import="java.util.List"%>
<%@page import="KhaiPT.Registration.RegistrationDTO"%>
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
        
        <h1>SEARCH PAGE</h1>
        <form action="MainController" method="POST">
            Search value:
            <input type="text" name="txtSearch" required=""/><br/>
            <input type="submit" name="btAction" value="Search"/><br/>
        </form>

        <%
            String searchValue = request.getParameter("txtSearch");
            if (searchValue != null) {
                List<RegistrationDTO> result = (List<RegistrationDTO>) request.getAttribute("SEARCHRESULT");
                if (result != null) {
        %><table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>UserName</th>
                    <th>Password</th>
                    <th>LastName</th>
                    <th>Role</th>     
                    <th>Delete</th>
                    <th>Update</th>
                </tr>
            </thead> 
            <tbody>  
                <%
                    int count = 0;
                    for (RegistrationDTO dto : result) {
                        String url = "MainController?btAction=Delete&txtSearch=" + searchValue + "&username=" + dto.getUsername();
                %>
                <form>
                <tr>
                    <td>
                        <%= ++count%>

                    </td>
                    <td>
                        <%= dto.getUsername()%>
                        <input type="hidden" value="<%= dto.getUsername()%>" name="txtUsername">
                    </td>
                    <td>
                        <input type="password" value="<%= dto.getPassword()%>" name="txtPassword">
                        <%= dto.getPassword()%>
                    </td>
                    <td>
                        <input type="text" value="<%= dto.getLastname()%>" name="txtLastname">
                        <%= dto.getLastname()%>
                    </td>
                    <td>
                        <%
                            if (dto.isRole()) {
                        %>
                        <input type="checkbox" name="isAdmin" value="ON" checked="checked"/>
                        <%
                        } else {
                        %>
                        <input type="checkbox" name='isAdmin' value=""/>
                        <% }%>

                    </td>
                    <td>
                        <a href="<%= url%>">Delete</a>
                    </td>
                    <td>
                        <input type="hidden" name="txtSearch" value="<%= searchValue%>"/>
                        <input type="submit" name="btAction" value="Update"/>
                    </td>
                </tr>
                </form>
                <%
                    }
                %> 
            </tbody>                  
        </table>

        <%
        } else {
        %> 
        <h2>No record is matched</h2>
        <%
                }

            }
        %>
    </body>
</html>
