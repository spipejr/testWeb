<%-- 
    Document   : delete_pro
    Created on : Feb 12, 2018, 5:27:15 PM
    Author     : Programmer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="database.database" %>
<html>
    <body>
<%      
        database db = new database();
        db.dbconnect();
        int Id = Integer.parseInt(request.getParameter("Id"));
        
        try
        {
            Statement stmt = (Statement) database.con.createStatement();
            String sql = "DELETE FROM new_table WHERE Id = '"+ Id +"'";
            stmt.execute(sql); 
            stmt.close();
            response.sendRedirect("newjsp.jsp");
        }catch(Exception e)
        {
            out.println(e.getMessage());
            e.printStackTrace();
        }
        
%>
    </body>
</html>
