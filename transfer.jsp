<%-- 
    Document   : transfer
    Created on : Jun 28, 2019, 9:43:17 PM
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
        
        int accno=Integer.parseInt(request.getParameter("accno"));
        int trans=Integer.parseInt(request.getParameter("amt"));
        String q="select * from customers";
        try
        {
            Statement s=c.createStatement();
            ResultSet rs=s.executeQuery(q);
            while(rs.next())
            {
               int accn=rs.getInt(1);
               if(accn==accno)
               {
                   HttpSession sw=request.getSession(true);
                   int acc=Integer.parseInt(sw.getAttribute("accno").toString());
                   String q1="select balance from customers where accno="+acc;
                   rs=s.executeQuery(q1);
                   if(rs.next())
                   {
                       int bal=rs.getInt(1);
                       if(bal>=trans)
                       {
                           String q2="update customers set balance=balance+"+trans+" where accno="+accno;
                            int count=s.executeUpdate(q2);
                            if(count==1)
                            {
                                out.println("transfer successfull");
                                String q3="update customers set balance=balance-"+trans+" where accno="+acc;
                                int cnt=s.executeUpdate(q3);
                                if(cnt==1)
                                {
                                    out.println("<a href='index.html'>go to home</a>");
                                }
                            }
                       }
                   }
               }
                       
            }
        }
        catch(Exception e)
        {
            out.println("error occured");
        }
        %>
    </body>
</html>
