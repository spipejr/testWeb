<%-- 
    Document   : update_pro
    Created on : Feb 12, 2018, 5:37:08 PM
    Author     : Programmer
--%>

<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java"%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="database.database"%>
<html>
<%
        database db = new database();
        db.dbconnect();
        
        int Id = Integer.parseInt(request.getParameter("Id"));
//        String Firstname = request.getParameter("Firstname");
        String Firstname = new String(request.getParameter("Firstname").getBytes("iso-8859-1"),"UTF-8").trim();
        String Lastname = new String(request.getParameter("Lastname").getBytes("iso-8859-1"),"UTF-8").trim();
        String Address = new String(request.getParameter("Address").getBytes("iso-8859-1"),"UTF-8").trim();
        SimpleDateFormat dateTimefmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date() ;
        String strnowDateTime = dateTimefmt.format(date);
        
    try
    {
//        Class.forName("org.gjt.mm.mysql.Driver");
//        Connection mycon = DriverManager.getConnection("jdbc:mysql://localhost/test?user=root&password=000000");
//        Statement stmt = mycon.createStatement();
//        String sql = "UPDATE new_table SET Firstname = '"+Firstname+"', Lastname = '"+Lastname+"', Address = '"+Address+"' "
//                + "WHERE Id = '"+ Id +"'";
//        Statement stmt = (Statement) database.con.createStatement();
        String sql = "UPDATE new_table SET Firstname=?, Lastname=?, Address=?, modifyDate=?"
                + "WHERE Id=?";
        PreparedStatement prm = (PreparedStatement) database.con.prepareStatement(sql);
        prm.setString(1, Firstname);
        prm.setString(2, Lastname);
        prm.setString(3, Address);
        prm.setString(4, strnowDateTime);
        prm.setInt(5, Id);
        prm.executeUpdate();
        prm.close();
//        stmt.close();
        response.sendRedirect("newjsp_Process_db.jsp");
    }
    catch(Exception ex)
    {
        out.print(ex.getMessage());
    }
 %>   
</html>
