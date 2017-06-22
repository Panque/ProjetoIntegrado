/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence;

import java.sql.*;
import java.util.ArrayList;
import model.*;
/**
 *
 * @author renan
 */
public class busca1DAO {
	private Connection conn;
	
	public busca1DAO() throws DAOException {
		this.conn = ConnectionFactory.getConnection();
	}
	
	public ArrayList<Movie> busca(
		ArrayList<String> atores,
		ArrayList<String> diretores,
		ArrayList<String> generos
	) throws SQLException {	
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		ArrayList<Movie> resultado = new ArrayList<>();
		
//		String SQL = "SELECT DISTINCT" +
//			"m.movieid AS movie_ID," +
//			"m.title AS titulo, " +
//			"m.mvyear AS ano" +
//		"FROM " +
//			"movies m, " +
//			"((actormovie INNER JOIN actor " +
//				"ON(actormovie.actor_id = actor.actor_id)) as am " +
//				"INNER JOIN (genero INNER JOIN generomovie " +
//					"ON (genero.genero_id = generomovie.genero_id)) as gm " +
//				"ON (gm.movieid = am.movieid)) " +
//		"WHERE " +
//			"am.movieId = m.movieId AND m.movieId = gm.movieId " +
//			"AND (lower(am.name) LIKE any(array[<lower('ator%')>]) " +
//			"OR lower(am.as_character) LIKE any (array[<lower('personagem%')>]) " +
//			"OR lower(gm.descricao) LIKE any (array[<lower('genero%')>]))";
//		return null;

		String SQL = "SELECT m.* "
			+ "FROM actormovie am "
				+ "INNER JOIN actor a ON am.actor_id = a.actor_id "
				+ "INNER JOIN movies m ON am.movieid = m.movieid "
			+ "WHERE a.\"name\" = '?'"
			+ "LIMITE 10";
		
		try {
			ps = conn.prepareStatement(SQL);
			ps.setString(1, atores.get(0));
			
			rs = ps.executeQuery();
			
			while(rs.next()){
				Movie m = new Movie(rs.getInt(1), rs.getString(2), rs.getString(3));
				resultado.add(m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		return resultado;
	}
}
