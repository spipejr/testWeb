<%-- 
    Document   : showupdate
    Created on : Feb 15, 2018, 3:16:22 PM
    Author     : Programmer
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TesT</title>
        <style type="text/css">
            #color1 {background-color:#5971AF; font-weight:bold; Color:#000000;}
            #color2 {background-color:#E1E9FC; Color:#000000;}
        </style>
    </head>
    <body>
<%
        int Id = Integer.parseInt(request.getParameter("Id"));
        String Firstname = new String(request.getParameter("Firstname").getBytes("iso-8859-1"),"UTF-8").trim();
        String Lastname = new String(request.getParameter("Lastname").getBytes("iso-8859-1"),"UTF-8").trim();
        String Address = new String(request.getParameter("Address").getBytes("iso-8859-1"),"UTF-8").trim();
%>
            <center>
		<form action="update_pro.jsp?Id=<%=Id%>" method="post">
		<table  cellpadding=2 cellspacing=1  width=300 border=0>
                    <tr id=color1><td colspan=2><center><b>&nbsp;อัพเดท ID = <%=Id%></b></center></td></tr>
		<tr id=color2><td>&nbsp;ชื่อ :</td>
				<td>&nbsp;<input type=text  name="Firstname" size=20 value="<%=Firstname%>"></td></tr>
		<tr id=color2><td>&nbsp;นามสกุล :</td>
				<td>&nbsp;<input type=text name="Lastname" size=20 value="<%=Lastname%>"></td></tr>
                <tr id=color2><td>&nbsp;ที่อยู่ :</td>
                    <td>&nbsp;<input type=text name="Address" size=20 value="<%=Address%>"></td></tr>
		<tr id=color2><td colspan=2><CENTER>
                    <input type=submit name=submit value="update">&nbsp;
                    <input type=reset value="รีเซ็ต"></CENTER></td>
                   
                </tr>
                </table>
		</form>
            </center>
    
          
    </body>
</html>
