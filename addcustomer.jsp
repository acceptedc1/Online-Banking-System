<%-- 
    Document   : addcustomer
    Created on : Jun 27, 2019, 3:45:21 PM
    Author     : Srini-w10
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
        <%@page import="java.sql.*" %>
        <%@page import="javax.sql.*" %>
    <body bgcolor="#348781">
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
        
        int accno=Integer.parseInt(request.getParameter("accno"));
        String pass=request.getParameter("accno");
        String Name=request.getParameter("name");
        int bal=Integer.parseInt(request.getParameter("bal"));
        
        String q="insert into customers(accno,password,name,balance)values("+accno+",'"+pass+"','"+Name+"',"+bal+")";
       
         try
        {
             Statement s=c.createStatement();
             int count=s.executeUpdate(q);
              if(count==1)
              {
                 out.println("<h1>account created successfully</h1>");
                 String q3="insert into rans(accno,ttype,amount,narration) values("+accno+",'D',"+bal+"'new account')";
                 int das=s.executeUpdate(q3); 
                  if(das==1)
                   {
                       out.println("thank you for banking visit again");
                   }
              
             }
        }
       catch(Exception e)
            {
                            out.println("unsuccessfull check your actions and try again or the account number may not be available");
                           out.println("<a href='bankhome.html'>go to home page</a>"); 
                           
            }
                     
            
        %>
       
   
    </body>
</html>
