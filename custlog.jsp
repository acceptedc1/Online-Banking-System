<%-- 
    Document   : custlog
    Created on : Jun 28, 2019, 3:36:19 PM
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
        int pass=Integer.parseInt(request.getParameter("pass"));
        String q="select * from customers where accno='" + accno + "' and PASSWORD=" + pass ;
        try
        {
            Statement s=c.createStatement();
            ResultSet rs=s.executeQuery(q);
            if (rs.next())
            {
                HttpSession sw=request.getSession(true);
                sw.setAttribute("accno",accno);
                response.sendRedirect("custhome.jsp");
            }
            else
            {
                out.print("login not success");
            %>
            <br> <a href="customerlog.html"><b>Try again</b></a><br>
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
