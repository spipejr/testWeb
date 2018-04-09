<%-- 
    Document   : newjsp_Process_db
    Created on : Jan 24, 2018, 9:43:41 AM
    Author     : Programmer
--%>

<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="database.database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style type="text/css">
            #color1 {background-color:#5971AF; font-weight:bold; Color:#FFFFFF;}
            #color2 {background-color:#E1E9FC; Color:#000000;}
            #color3 {background-color:#5971AF; Color:#000000; font-weight:bold;}
        </style>
        <title>JSP Page</title>
    </head>
    <body>
<%
        database db = new database();
        db.dbconnect();
        SimpleDateFormat dateTimefmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss" ,Locale.ENGLISH);
        Statement stmt = (Statement) database.con.createStatement();
        String sql = "select * from new_table";
//        PreparedStatement prm = (PreparedStatement) database.con.prepareStatement(sql);
	ResultSet myresult = stmt.executeQuery(sql);
	if(myresult!=null)
	{
%>
                <center><b>เทส</b></center><br>
                <table align=center border=1 cellpadding=5 cellspacing=0>
                        <tr id=color1 align="center">
                            <td>ไอดี</td>
                            <td>ชื่อ</td>
                            <td>นามสกุล</td>
                            <td>ที่อยู่</td>
                            <td>คนสร้าง</td>
                            <td>คนแก้</td>
                            <td>ลบ</td>
                            <td>อัพเดท</td>
                        </tr>
<%       
                while(myresult.next())
		{
                        
                        int Id = myresult.getInt("Id");
                        String Firstname = myresult.getString("Firstname");
                        String Lastname = myresult.getString("Lastname");
                        String Address = myresult.getString("Address");
                        

                        
                        Date CDateTime = myresult.getTimestamp("createDate");
                        String strCDateTime = dateTimefmt.format(CDateTime);
                        Date MDateTime = myresult.getTimestamp("modifyDate");
                        String strMDateTime = dateTimefmt.format(MDateTime);
                        if(strMDateTime.equals("1990-01-01 00:00:00"))
                        {
                            strMDateTime = "ไม่มีคนแก้";
                        }
%>
                    <form action= method=post>
                        <tr id="color2">
                            <td> <%=Id%></td>
                            <td> <%=Firstname%></td>
                            <td> <%=Lastname%></td>
                            <td> <%=Address%></td> 
                            <td> <%=strCDateTime%></td> 
                            <td> <%=strMDateTime%></td> 
                            <td> <a href="delete_pro.jsp?Id=<%=Id%>">ลบ</a></td>
                            <td> <a href="showupdate.jsp?Id=<%=Id%>&Firstname=<%=Firstname%>&Lastname=<%=Lastname%>&Address=<%=Address%>">อัพเดท</a></td>
                        </tr>
                    </form>
<%
		}
%>
                </table>
                <br>
                <hr>
                <br>
                <a href="newjsp.jsp">กลับหน้าหลัก</a>
                <a href="/testweb/index.jsp">กลับหน้าหลักสุดๆ</a>
<%
	}
        stmt.close();
//        prm.close();
        
%>                  
    </body>
</html>
