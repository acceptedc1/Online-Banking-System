<%-- 
    Document   : viewtrans
    Created on : Jun 29, 2019, 3:09:06 PM
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
        
      
         try
                    { 
                        int bala=0;
                    HttpSession sw=request.getSession(true);
                        int acno=Integer.parseInt(sw.getAttribute("accno").toString());
                          /*
                        String q4="select balance from customers where accno="+acno;   
                         
                             ResultSet rsq=s.executeQuery(q4);
                                     if(rsq.next())
                                         {
                                      int balance=rsq.getInt(1);
                                      bala=balance;
                                         }
                                     
                         */
                        String q="select *  from rans where accno="+acno;
                        out.println("<table><tr><th>narration</th><th>   deposit   </th><th>    withdraw   </th><th>    balance    </th</tr>");
                        Statement s=c.createStatement();
                        ResultSet rs=s.executeQuery(q);
                        int bal = 0;
                        while(rs.next())
                        {
                        int accno=rs.getInt(1);
                        String ttype=rs.getString(2);
                        int amount=rs.getInt(3);
                       String narr=rs.getString(4);
                       if (ttype.equals("W"))
                       {
                           bal = bal - amount;
                            out.print("<tr><td>" + narr + "</td><td>  </td><td>" + amount +"</td><td>"+bal+ "</td></tr>");
                           
                       }
                       else
                       {
                           bal = bal + amount;
                            out.print("<tr><td>" + narr + "</td><td>" + amount + "</td><td>  </td><td>"+bal+ "</td></tr>");
                           
                       }
                        }
                        out.print("</table>");
                        %>
                         <a href="custhome.jsp">go to home page</a>
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
