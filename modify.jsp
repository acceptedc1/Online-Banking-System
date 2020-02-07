<%-- 
    Document   : modify
    Created on : Jun 28, 2019, 3:50:40 PM
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
        int pass=Integer.parseInt(request.getParameter("pass"));
        int passw=Integer.parseInt(request.getParameter("pass1"));
        String q="select * from customers";
        if(passw==pass)   
        {
             Statement s=c.createStatement();
            ResultSet rs=s.executeQuery(q);
            if(rs.next())
            {
                HttpSession sw=request.getSession(true);
                int accno=Integer.parseInt(sw.getAttribute("accno").toString());
                String q1="update customers set password="+pass+"where accno="+accno;
                 int count=s.executeUpdate(q1); 
                if(count==1)
                {
                    out.println("Password updated successfully ");
                                
                    out.println(" <a href='custhome.jsp'>go to home page</a>");   
                }
                else
                {
                    out.println("something went wrong try again:");
                    out.println(" <a href='custhome.html'>go to home page</a>"); 
                }
            }
        }
        else
        {
            out.println("Password not matching:try again ");
            out.println(" <a href='custhome.html'>go to home page</a>");
        }
       }
       catch(Exception e)
       {
           out.println("error occured:"); 
           out.println(" <a href='custhome.html'>go to home page</a>"); 

       }
        %>
       
    </body>
</html>
