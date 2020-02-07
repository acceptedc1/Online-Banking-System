<%-- 
    Document   : custhome
    Created on : Jun 29, 2019, 2:30:40 PM
    Author     : Srini-w10
--%>
<%
    if(request.getSession().getAttribute("accno")==null)
    {
        response.sendRedirect("customerlog.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body bgcolor="#348781">
        <h1><center>Customer Home Page</center></h1>
        <a href="modifypass.html"><b>Modify Password</b></a><br>
        <a href="viewbalance.jsp"><b>View Balance</b></a><br>
        <a href="moneytrans.html"><b>Money Transfer</b><a><br>
        
                 <a href="viewtrans.jsp"><b>View Transaction History</b></a><br>
         <a href="logout.jsp"><b>Log Out</b></a><br>
    </body>
   