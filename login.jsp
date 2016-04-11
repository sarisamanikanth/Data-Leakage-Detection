<%@ page import="java.sql.*,databaseconnection.*"%>
<html>
    <head>
	<title>login</title>
    </head>
    <body>
	<form>
	<% 
         String userid=request.getParameter("loginID");
	String pass=request.getParameter("password");		
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	String sql="select * from register where username='"+userid+"' AND password='"+pass+"'";
	try
	{
	   //con=databasecon.getconnection();
	   Class.forName("com.mysql.jdbc.Driver");	
		//con=databasecon.getconnection();
		con =  DriverManager.getConnection("jdbc:mysql://localhost:3306/dataleakage","root","teja");
	    st=con.createStatement();
	    rs=st.executeQuery(sql);
		if(userid.equalsIgnoreCase("distributor")&& pass.equalsIgnoreCase("distributor"))
		{
		session.setAttribute( "username", userid );
		
		 %>
			<jsp:forward page="distributorhome.jsp"/>
	    	<%
		}
	    if(rs.next())
	     {
		 session.setAttribute( "username", userid );
		 out.println("Move to agent home");
		 %>	
		<jsp:forward page="agenthome.jsp"/>
	    	<%
	             		    
	    }
		else				
		out.println("Login Error-please check ur ID and password");
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