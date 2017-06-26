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
public class BuscaDAO {
	private Connection conn;
	
	public BuscaDAO() throws DAOException {
		this.conn = ConnectionFactory.getConnection();
	}
	
	public B1Result busca1(
		ArrayList<String> atores,
		ArrayList<String> diretores,
		String genero,
		int pagina
	) throws SQLException {	
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		ArrayList<Movie> listaFilmes = new ArrayList<>();
		int qtdPg = 0;
		
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
			+ "WHERE a.\"name\" = ? ";
		
		String SQLCount = "SELECT count(*) AS qtd FROM (" + SQL + ") AS sql_count";
		
		try {
			ps = conn.prepareStatement(SQLCount);
			ps.setString(1, atores.get(0));
			
			rs = ps.executeQuery();
			rs.next();
			qtdPg = rs.getInt("qtd") / 10;
			
			SQL += " LIMIT 10 OFFSET " + (pagina - 1) * 10;
			
			ps = conn.prepareStatement(SQL);
			ps.setString(1, atores.get(0));
			
			rs = ps.executeQuery();
			
			while(rs.next()){
				Movie m = new Movie(rs.getInt(1), rs.getString(2), rs.getString(3));
				listaFilmes.add(m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		B1Result resultado = new B1Result(listaFilmes, qtdPg);
		return resultado;
	}
	
	public ArrayList<RankingResult> busca2(String ator, String diretor) throws SQLException {
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		ArrayList<RankingResult> resultado = new ArrayList<>();
		
		String SQL = "SELECT g.descricao AS Genero, COUNT(m.movieID) AS Qtde_Filmes" +
			"    FROM movies m " +
			"        INNER JOIN actormovie am " +
			"        	ON am.movieID = m.movieID " +
			"        INNER JOIN actor a " +
			"        	ON (a.actor_id = am.actor_id)" +
			"        INNER JOIN directorsmovies dm " +
			"        	ON (dm.movieID = m.movieID)" +
			"        INNER JOIN director d " +
			"        	ON (d.directorid = dm.directorid)" +
			"        INNER JOIN generomovie gm " +
			"        	ON (gm.movieID = m.movieID)" +
			"        INNER JOIN genero g " +
			"        	ON (g.genero_Id = gm.genero_Id)" +
			"    WHERE lower(a.name) = lower(?)" +
			"        AND lower(d.dname) = lower(?)" +
			"    GROUP BY g.descricao " +
			"    ORDER BY COUNT(m.movieID)";
		
		try {
			ps = conn.prepareStatement(SQL);
			ps.setString(1, ator);
			ps.setString(2, diretor);
			
			rs = ps.executeQuery();
			
			while(rs.next()){
				RankingResult rr = new RankingResult(rs.getString(1), rs.getInt(2));
				resultado.add(rr);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		return resultado;
	}
}
