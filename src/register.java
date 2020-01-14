

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class register
 */
@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public register() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String firstName=request.getParameter("firstName");
		String lastName=request.getParameter("lastName");
		String pass=request.getParameter("Pass_word");
		String email=request.getParameter("email");
		String userName=request.getParameter("userName");
		
		String url="jdbc:mysql://localhost:3306/class_assignment";
		String username="root";
		String password_Db="pass123";
		PrintWriter out1=response.getWriter(); 
		
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,username,password_Db);
			PreparedStatement ps=con.prepareStatement("insert into class_c values(?,?,?,?,?)");
			
			ps.setString(1, firstName);
			ps.setString(2, lastName);
			ps.setString(3, userName);
			ps.setString(4, pass);
			ps.setString(5, email);
			
			ps.executeUpdate();
			
			ps.close();
			con.close();
			System.out.println("registered successfully");
			
		}catch(Exception e){
			e.printStackTrace();
		
	}

	}
	}


