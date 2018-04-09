<%@page import="java.sql.Time"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>  
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <%
            String Ftime = "";

            if (null == session.getAttribute("Status")) {
                response.sendRedirect("loginpage.jsp");
            } else if (session.getAttribute("Status").equals("Admin")) {
        %>
        <jsp:include page="include/navbarAdmin.jsp" />
        <%
        } else {
        %>
        <jsp:include page="include/navbar.jsp" />
        <%
            }


        %>
        <script>
            function startTime()
            {
                //now time realtime
                var today = new Date();
                var h = today.getHours();
                var m = today.getMinutes();
                var s = today.getSeconds();
                m = checkTime(m);
                s = checkTime(s);
                document.getElementById('txtsTime').value =
                        h + ":" + m + ":" + s + "";

                
                // Add time 
                var z = parseInt(document.getElementById("srt").value);
                var date = new Date();
                date.setMinutes(date.getMinutes() + z);
                var hours1   = date.getHours();
                var minutes1 = date.getMinutes();
                var seconds1 = date.getSeconds();
                if (hours1   < 10) {hours1   = "0"+hours1;}
                if (minutes1 < 10) {minutes1 = "0"+minutes1;}
                if (seconds1 < 10) {seconds1 = "0"+seconds1;}
                var t = hours1+':'+minutes1+':'+seconds1;
                if(t==="NaN:NaN:NaN")
                {
                     document.getElementById("srt2").value = "00:00:00";   
                }else
                {
                    document.getElementById("srt2").value = t;
                }
                //millisec refesh
                var t = setTimeout(startTime, 500);
            }
            //millisec refesh
            function checkTime(i) 
            {
                if (i < 10) {
                    i = "0" + i
                };  
                return i;
            }
            
            function run()  
            {
               
                
                document.getElementById("srt").value = document.getElementById("Ultra").value;
 
            
            }
            
            
            
            
        </script>
        
    </head>
    <body onload="startTime()">
        <%        Connection connect = null;
            Statement s = null;
            Statement ss = null;
            Class.forName("com.mysql.jdbc.Driver");
            connect = DriverManager.getConnection("jdbc:mysql://localhost/myairblast"
                    + "?user=root&password=000000");

            s = connect.createStatement();
            String sql = "SELECT * FROM airIN ORDER BY airNo";
            ResultSet rec = s.executeQuery(sql);

            ss = connect.createStatement();
            String sqls = "SELECT * FROM productIN ORDER BY pname ";
            ResultSet recs = ss.executeQuery(sqls);

            try {
                int ptime = Integer.parseInt(request.getParameter("txtpTime"));
                SimpleDateFormat Timefmt = new SimpleDateFormat("H:mm:ss");
                Date date = new Date();
                String nowtime = Timefmt.format(date);

                ////////////////////////////////////// add time
                Date d = Timefmt.parse(nowtime);
                Calendar cal = Calendar.getInstance();
                cal.setTime(d);
                cal.add(Calendar.MINUTE, ptime);
                Ftime = Timefmt.format(cal.getTime());
            } catch (Exception ex) {
            }
        %>

        <form name="frmAdd" method="POST" id="autoSumForm" action="insert_all_page.jsp">
            <div class="container ">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th class="text-left col-md-1">AirNo.</th>
                            <td class="text-left col-md-1">
                                <select name="airNo">
                                    <%while ((rec != null) && (rec.next())) {%>
                                    <option value="<%=rec.getString("airNo")%>"><%=rec.getString("airNo")%></option>
                                    <%}%>
                                </select>	
                            </td>
                            <th class="text-left col-md-1">No.รถ</th>
                            <td><input type="text" name="txtcarNo"></td>
                        </tr>
                        <tr>

                            <th class="text-left col-md-1">ProductName</th>
                            <td>
                                <select id="Ultra" onchange="run()">
                                    <%while ((recs != null) && (recs.next())) {%>
                                    <option value="<%=recs.getString("pTime")%>"><%=recs.getString("pName")%></option>
                                    <%}%> 
                                </select>
                            </td>

                            <th class="text-left col-md-1">ProductTime</th>
                            <td>
                            <input name="txtpTime" id="srt" value="">
                            </td>

                        </tr>
                        <tr>
                            <th class="text-left col-md-1">จำนวนที่เรียง</th>
                            <td><input type="text" name="txtpAmount"></td>
                            <th class="text-left col-md-1">Lot</th>
                            <td>
                                <select name="optLot" id="optLot">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                            </td>
                        </tr>

                    </thead>
                </table>
            </div>
            <div class="container">
                <table class="table table-bordered">
                    <thead>
                        
                        <tr>
                            <th class="text-left col-md-1">เริ่ม</th>
                            <td class="text-left col-md-1"><input type="text" name="txtsTime" id="txtsTime" placeholder="เวลา"></td>
                            <td class="text-left col-md-1"><input type="text" name="txtairTemp" placeholder="อุณหภูมิ Air"></td>
                            <td ><input type="text" name="txtsTime2" placeholder="เวลา"></td>
                        </tr>
                        
                        <tr>
                            <th class="text-left col-md-1">เสร็จ</th>
                            <td class="text-left col-md-1"><input name="plustime" id="srt2" value=""></td>
                            <td class="text-left col-md-1"><input type="text" name="txtairTemp" placeholder="อุณหภูมิ Air"></td>
                            <td ><input type="text" name="txteTime2" placeholder="เวลา"></td>
                        </tr>
                        <tr>
                            <th class="text-left col-md-1">อุณหภูมิ</th>
                            <td><input type="text" name="txtairTemp" placeholder="อุณหภูมิใจกลาง"></td>
                        </tr>
                        <tr>
                            <th class="text-left col-md-1">สถานะ</th>
                            <td><input type="text" name="txtpStatus" placeholder="สถานะผลิตภัณฑ์ที่แช่แข็ง"></td>
                        </tr>
                        <tr>
                            <th class="text-left col-md-1">ผู้บันทึก</th>
                            <td><input type="text" name="txtsaveMember" value="<%=session.getAttribute("Name")%>"></td>
                        </tr>
                            
                            
                            
                           
                            

                    </thead>
                </table>
                <button type="submit" name="frmAdd" id="addtime" class="btn btn-info btn-sm" formaction="car_check.jsp">CheckCar</button>
                <button type="submit" name="frmOk" id="ok" class="btn btn-success btn-sm" formaction="db_add_all.jsp">OK</button>
            </div>
        </form>

    </body>

</html>
<jsp:include page="include/footer.jsp" />


