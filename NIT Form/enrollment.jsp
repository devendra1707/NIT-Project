<!-- enrollment.jsp file  (server side ope & db ope)
table:
create table students(sna varchar(15), mailid varchar(20), mobile number(10), course varchar(25), ttype varchar(20));
-->
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Reg Page</title>
	</head>
<body style="background:#3366ff;  font-size:20px;">
  <%	 //jsp code begins
    //getting parameter(data) from client(html)
 	String sna=request.getParameter("txtName");
	String mailid=request.getParameter("txtMail");
	long mobile=Long.parseLong( request.getParameter("txtMob") );
	String course=request.getParameter("course");
	String ttype=request.getParameter("ttype");

	//DB Operations
	//loading driver 
	Class.forName("oracle.jdbc.driver.OracleDriver"); // interaction b/w jsp and oracle db
	//establishing connection with oracle db
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "12345");
	
	//preparing query for inserting data
	String q="insert into students values('"+sna+"', '"+mailid+"', "+mobile+", '"+course+"', '"+ttype+"')";

    con.createStatement().executeUpdate(q); //sending query to db for exection

	con.close(); //dis-connecting db
    out.write("<h2 style='color:#ff9900;'>Registration Successfully Done. We Get Back Soon</h2>");
  %> 
</body>
</html>

  
					