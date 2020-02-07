<%-- 
    Document   : valid
    Created on : Jun 27, 2019, 3:19:02 PM
    Author     : Srini-w10
--%>

<%@page import="java.util.Scanner"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
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
            System.out.println("not connected");
        }
        String user=request.getParameter("user");
        int pass=Integer.parseInt(request.getParameter("pass"));
        String q="select * from bank where USERNAME='" + user + "' and PASSWORD=" + pass ;
        try
        {
            Statement s=c.createStatement();
            ResultSet rs=s.executeQuery(q);
            if (rs.next())
            {
                    //out.println("LOGIN SUCCESSFULL");
                response.sendRedirect("bankhome.html");
            }
            else
            {
                out.print("login not success");
            %>
            <br> <a href="banklog.html"><b>Try again</b></a><br>
            <br> <a href="index.html"><b>go to home</b></a>
           <%
            }
            rs.close();
            s.close();
            c.close();
        }
        catch(Exception e)
        {
            out.println("Poblem occured");
        }
        %>
    </body>
</html>
