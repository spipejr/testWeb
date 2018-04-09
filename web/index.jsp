<%-- 
    Document   : newjsp
    Created on : Feb 18, 2018, 9:05:06 PM
    Author     : Programmer
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="database.database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style type="text/css">
            #color1 {background-color:#5971AF; font-weight:bold; Color:#000000;}
            #color2 {background-color:#E1E9FC; Color:#000000;}
            #color3 { Color:red; font-size: 100px}
            #a {font-size: 100px}
            
        </style>
        
        <script>
            function startTime()
            {
                
                var t = setTimeout(startTime, 500);
            }
            function swap()
            {
                var a = document.getElementById("test").value;
                var aa = a.split(',');
                document.getElementById("p_id").value = aa[0];
                document.getElementById("p_name").value = aa[1];
                document.getElementById("p_price").value = aa[2];
                document.getElementById("C_id").value = aa[3];
                document.getElementById("C_name").value = aa[4];
            }
        </script>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
        <jsp:include page="folder/navbar.jsp"/>
        
        
        
    </head>
    <body onload="startTime()">
        <a  id="color3" href="/testweb/test/newjsp.jsp"> Hello World!</a> 
        
<!--        <div class="table-responsive col-md-6 text-center">-->
        <div class="container ">
            <table class="table table-bordered">

            <tr>
                    <td class="glyphicon glyphicon-xbt">ไอดี</td>
                    <td>ชื่อ</td>
                    <td>นามสกุล</td>
                    <td>ที่อยู่</td>
                    <td>ลบ</td>
                    <td>อัพเดท</td>
            </tr>

            
            <tr>
                    <td>1</td>
                    <td>2</td>
                    <td>3</td>
                    <td>4</td>
                    <td>5</td>
                    <td>6</td>
            </tr>
            <tr >
                    <td>ไอดี</td>
                    <td>ชื่อ</td>
                    <td>นามสกุล</td>
                    <td>ที่อยู่</td>
                    <td>ลบ</td>
                    <td>อัพเดท</td>
            </tr>
            <tr >
                    <td>ไอดี</td>
                    <td>ชื่อ</td>
                    <td>นามสกุล</td>
                    <td>ที่อยู่</td>
                    <td>ลบ</td>
                    <td>อัพเดท</td>
            </tr>
            </table>
        </div>
        
        <div class="alert alert-danger" role="alert">
        <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
         <span class="sr-only">Error:</span>
        Enter a valid email address
        </div>

    <div class="container ">
        <select id="test" onchange="swap()">
            <option>โปรดเลือก</option>
<%
            database db = new database();
            db.dbconnect();
            try
            {
                Statement stmt = (Statement) database.con.createStatement();
                String sql = "SELECT P_id,P_name,P_price,products.C_id,categories.C_name "
                        + "FROM products left join categories on products.c_id = categories.c_id";
                ResultSet rs = stmt.executeQuery(sql);
                
            

                while(rs.next())
                {
%>                
                    <option value="<%=rs.getString("P_id")%>,<%=rs.getString("P_name")%>,<%=rs.getString("P_price")%>,<%=rs.getString("C_id")%>,<%=rs.getString("C_name")%>"> <%=rs.getString("P_id")%></option>
<%
                }

            }catch(Exception e)
            {
                out.print(e.getMessage());
            }
%>
        </select> 
        <p>
        <table class="table table-bordered">
            <tr>
                <th class="text-left col-md-1"><input type="" name="p_id" id="p_id" readonly="readonly"></th>
                <td class="text-left col-md-1" id="p_id"></td>
                <td class="text-left col-md-1"><input type="text" name="p_name" id="p_name"></td>
                <td class="text-left col-md-1"><input type="text" name="p_price" id="p_price"></td>
                <td class="text-left col-md-1"><input type="text" name="C_id" id="C_id"></td>
                <td class="text-left col-md-10"><input type="text" name="C_name" id="C_name"></td>
            </tr>
        </table>
    </div>
        
        <script src="bootstrap/js/jquery.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>
