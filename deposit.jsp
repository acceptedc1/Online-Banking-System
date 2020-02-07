<%-- 
    Document   : deposit.jsp
    Created on : Jun 27, 2019, 4:35:22 PM
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
                    String narr=request.getParameter("narr");
                   int ano=Integer.parseInt(request.getParameter("accno"));
                    int bal=Integer.parseInt(request.getParameter("dep"));
                    String q1="select accno from customers";
                     try
                        {
                            Statement s=c.createStatement();
                            ResultSet rs=s.executeQuery(q1);
                            while(rs.next())
                            {
                            int accnoo=rs.getInt(1);
                            if(ano==accnoo)
                            {
                            String q="update customers set balance=balance+" +bal+" where accno="+ano;
                            int count=s.executeUpdate(q);
                            if(count==1)
                            {
                               out.println("deposit successfull");
                                String q3="insert into rans(accno,ttype,amount,narration)values("+ano+",'D',"+bal+",'"+narr+"')";
                                int das=s.executeUpdate(q3);
                               
                                if(das==1)
                                {
                                    out.println("thank you for banking visit again");
                                   
                                }
                               %>
                               <a href="bankhome.html">go to home page</a>
                               <%
                               break;
                            }
                            
                            }
                            }
                         
                            
                               
                        }
                        catch(Exception e)
                        {
                            out.println("deposit unsuccessfull check your accno and try again");
                            %>
                            <a href="bankhome.html">go to home page</a>
                            <%
                        }
                     
              %>      
    </body>
</html>
