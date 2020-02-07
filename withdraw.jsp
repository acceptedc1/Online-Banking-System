<%-- 
    Document   : withdraw
    Created on : Jun 27, 2019, 4:36:01 PM
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
         <%@page import="java.util.Scanner"%>
          <%@page import="java.sql.*" %>
        <%@page import="javax.sql.*" %>
        <%
               try
        {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            
        }
        catch(Exception e){
                    System.out.println("cannot load driver");
                    return;
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
                   
                    try
                    { 
                        String narr=request.getParameter("narr");
                        int accno=Integer.parseInt(request.getParameter("accno"));
                         int wit=Integer.parseInt(request.getParameter("dep"));                  
                         
                         String q1="select accno,balance from customers where accno=" + accno;

                         
                        Statement s=c.createStatement();
                        ResultSet rs=s.executeQuery(q1);
                        if(rs.next()){
                        int wd=rs.getInt(2);
                        
                        if(wd>=wit)
                        {
                            String q2="update customers set balance=balance-"+wit+"where accno="+accno;
                            int count=s.executeUpdate(q2); 
                            if(count==1)
                            {
                               out.println("Withdraw succeessfull");
                                String q3="insert into rans(accno,ttype,amount,narration) values("+accno+",'W',"+wit+",'"+narr+"')";
                                int das=s.executeUpdate(q3); 
                               if(das==1)
                               {
                              out.println(" <a href='bankhome.html'>go to home page</a>");
                               }
                            }
                          
                        }
                        else
                             {
                            out.println("insufficient balance");
                            out.println("<a href='bankhome.html'>go to home page</a>");
                           
                            }
                        }
                        else
                        {
                            
                            out.println("invalid account number");
                            out.println("<a href='bankhome.html'>go to home page</a>");
                        
                     }
                    }
                    catch(Exception e)
                    {
                        System.out.println("record not created");
                        
                        out.println("<a href='bankhome.html'>go to home page</a>");
                        
                    }
                  
        %>
    </body>
</html>
