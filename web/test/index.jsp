<%-- 
    Document   : newjsp
    Created on : Feb 18, 2018, 9:05:06 PM
    Author     : Programmer
--%>

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
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
        <jsp:include page="folder/navbar.jsp"/>
        
    </head>
    <body>
        <a  id="color3" href="/test/newjsp.jsp"> Hello World!</a> 
        
<!--        <div class="table-responsive col-md-6 text-center">-->
        <div class="table-responsive text-center ">
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
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        <script src="bootstrap/js/jquery.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>
