<%-- 
    Document   : newjsp_Process
    Created on : Jan 22, 2018, 1:27:17 PM
    Author     : Programmer
--%>


<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="database.database"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java"%>
    
<html>
    
        <%
       
        database db = new database();
        db.dbconnect();
        String name = new String(request.getParameter("name").getBytes("iso-8859-1"),"UTF-8");
        String surname = new String(request.getParameter("surname").getBytes("iso-8859-1"),"UTF-8").trim();
        String address = new String(request.getParameter("address").getBytes("iso-8859-1"),"UTF-8").trim();
        SimpleDateFormat dateTimefmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date() ;
        String strnowDateTime = dateTimefmt.format(date);
        try
            {
                

                String sql = "INSERT INTO new_table (Firstname, Lastname, Address, createDate) VALUES(?, ?, ?, ?)";
                PreparedStatement prm = (PreparedStatement) database.con.prepareStatement(sql);
                prm.setString(1, name);
                prm.setString(2, surname);
                prm.setString(3, address);
                prm.setString(4, strnowDateTime);
                prm.executeUpdate();
                prm.close();
                response.sendRedirect("newjsp.jsp");
            }
        catch(Exception ex)
            {
                out.print(ex.getMessage());
            }
        %>
    
</html>
