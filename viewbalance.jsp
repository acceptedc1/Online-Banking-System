<%-- 
    Document   : viewbalance
    Created on : Jun 28, 2019, 4:12:40 PM
    Author     : Srini-w10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body bgcolor="#348781">
        <%@page import="java.sql.*" %>
        <%@page import="javax.sql.*" %>
        <%
        try
        {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        }
        catch(Exception e){
                    out.println("cannot load driver");
        }
        Connection c=null;
        try
        {
            String url="jdbc:oracle:thin:@localhost:1521:xe";
            String username="system";
            String password="123";
            
            c=DriverManager.getConnection(url,username,password);
        }
        catch(Exception e)
        {
            out.println("not connected");
        }
        try{
        HttpSession sw=request.getSession(true);
       int accno=Integer.parseInt(sw.getAttribute("accno").toString());
        String q="select balance from customers where accno="+accno;   
        Statement s=c.createStatement();
        ResultSet rs=s.executeQuery(q);
        if(rs.next())
            {
              int balance=rs.getInt(1);
              out.println("<h1>balance is:</h1>" + balance);           
              out.println("<br> <a href='custhome.html'>go to home page</a>");   
                
            }
        }
        catch(Exception e)
                {
                 out.println("something went wrong try again:");
                    out.println(" <a href='custhome.html'>go to home page</a>"); 
                }
        %>
    </body>
</html>
