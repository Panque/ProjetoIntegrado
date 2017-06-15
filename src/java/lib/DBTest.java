package lib;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Properties;

public class DBTest {
	//conn stores connection info from DBMS (Database Management System)

	private Connection conn;
	//stmt is used to send commands to the DBMS
	private Statement stmt;

	public DBTest() {
		try {
			Class.forName("org.postgresql.Driver").newInstance();

			String url = "jdbc:postgresql://localhost/proj";

			Properties props = new Properties();
			props.setProperty("user", "postgres");
			props.setProperty("password", "77rulez");
			conn = DriverManager.getConnection(url, props);
			stmt = conn.createStatement();

			System.out.println("Cool Bananas!");

			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error: something went wrong...");
		}
	}

	public static void main(String args[]) {
		DBTest t = new DBTest();
	}
}
