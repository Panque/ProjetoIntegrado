/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence;

import java.sql.*;
/**
 *
 * @author renan
 */
public class busca1DAO {
	private Connection conn;
	
	public busca1DAO() throws DAOException {
		this.conn = ConnectionFactory.getConnection();
	}
}
