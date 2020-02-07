<%-- 
    Document   : viewcustomers
    Created on : Jun 27, 2019, 4:17:06 PM
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
        <%@page import="java.sql.*;" %>
         <%@page import="javax.sql.*;" %>
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
            System.out.println("not connected");
        }
        
        String q="select accno,name,balance from customers";
         try
                    { 
                        Statement s=c.createStatement();
                        out.println("<table><tr><th>Acc No</th><th>Name</th><th>Balance</th></tr>");
                        ResultSet rs=s.executeQuery(q);
                        while(rs.next())
                        {
                        int accno=rs.getInt(1);
                        String name=rs.getString(2);
                        int balance=rs.getInt(3);
                       out.print("<tr><td>" + accno + "</td><td>" + name + "</td><td>" + balance + "</td></tr>");
                        }
                        out.print("</table>");
                        %>
                         <a href="bankhome.html">go to home page</a>
                        <%
                    }
         catch(Exception e)
         {
             out.println("problem occured");
             %>
             <a href="bankhome.html">go to home page</a>
             <%
         }
        %>
    </body>
</html>
