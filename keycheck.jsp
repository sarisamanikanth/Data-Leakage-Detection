<%@ page import="java.sql.*,databaseconnection.*"%>
<html>
    <head>
	<title>login</title>
    </head>
    <body>
	<form>
	<% 
	String filename = (String)session.getAttribute("fname");
	String key=request.getParameter("key");		
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	String k=null;
	String sql="select file.key from  file  where filename='"+filename+"'";
	try
	{
	    //con=databasecon.getconnection();
		Class.forName("com.mysql.jdbc.Driver");	
		//con=databasecon.getconnection();
		con =  DriverManager.getConnection("jdbc:mysql://localhost:3306/dataleakage","root","teja");
	    st=con.createStatement();
	    rs=st.executeQuery(sql);
				
		
	    if(rs.next())
		{
		k=rs.getString(1);
				
		}
		
		if(k.equals(key))
		{
		 
		response.sendRedirect("userfileview.jsp");
		}
				
		
		else
	  out.println("Login Error-please check ur key");
	}
	catch(SQLException e1)
	{
		
		System.out.println(e1);
	
	 }

	finally
	{
	     st.close();
	      con.close();
	}
            %>
             </form>
       </body> 	
</html>