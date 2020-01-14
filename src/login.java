

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
//import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import org.apache.jasper.tagplugins.jstl.core.Out;


import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName=request.getParameter("userName");
		String pass=request.getParameter("pass_word");
		
		String url="jdbc:mysql://localhost:3306/class_assignment";
		String username="root";
		String password_Db="pass123";
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,username,password_Db);
			PreparedStatement stmt=con.prepareStatement("select * from class_c");
		
			
//		    String user=request.getParameter("userName");
//			String password=request.getParameter("password");
			stmt.setString(3, userName);
			stmt.setString(4,pass);
			System.out.println("rupesh");
			ResultSet rs= stmt.executeQuery();
			
			if(rs.next()){
				
				//System.out.println(u+"  "+p);
				//(u.equals(userName)&&p.equals(pass)){
		        HttpSession session=request.getSession();
			    session.setAttribute("userName", userName);
			    response.sendRedirect("WelcomeUser.jsp");
			}
        		else{
				response.sendRedirect("home.jsp");
				System.out.println("wrong username or password");
			}
			//}
		}catch(Exception e){
			e.printStackTrace();
		
	}

	}
}
