/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

/**
 *
 * @author renan
 */
public class ConnectionFactory {

	public static Connection getConnection() throws DAOException {
		try {
			Class.forName("org.postgresql.Driver").newInstance();

			String url = "jdbc:postgresql://localhost/proj";

			Properties props = new Properties();
			props.setProperty("user", "userpublic");
			props.setProperty("password", "1234");
			Connection conn = DriverManager.getConnection(url, props);
			
			return conn;
		} catch (SQLException | ClassNotFoundException | InstantiationException | IllegalAccessException exception) {
			throw new DAOException(exception.getMessage(), exception.fillInStackTrace());
		}
	}

	public static void closeConnection(Connection conn, PreparedStatement ps, ResultSet rs)
			throws DAOException {
		close(conn, ps, rs);
	}

	public static void closeConnection(Connection conn, PreparedStatement ps)
			throws DAOException {
		close(conn, ps, null);
	}

	public static void closeConnection(Connection conn)
			throws DAOException {
		close(conn, null, null);
	}

	private static void close(Connection conn, PreparedStatement ps, ResultSet rs)
			throws DAOException {
		try {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException exception) {
			throw new DAOException(exception.getMessage(), exception.fillInStackTrace());
		}
	}
}
