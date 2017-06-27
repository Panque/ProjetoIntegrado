/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package persistence;

import java.math.*;

import java.sql.*;
import java.util.ArrayList;
import model.*;
/**
 *
 * @author renan
 */
public class BuscaDAO {
	private final int PAGE_SIZE = 50;
	private Connection conn;
	
	public BuscaDAO() throws DAOException {
		this.conn = ConnectionFactory.getConnection();
	}
	
	public B1Result busca1(
		ArrayList<String> atores,
		ArrayList<String> personagens,
		String genero,
		int pagina
	) throws SQLException {	
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		ArrayList<Movie> listaFilmes = new ArrayList<>();
		int qtdPg = 0;
		
		String strAtores = "";
		String strPersonagens = "";
		int i;
		
		if((atores.size() == 1) && (atores.get(0).equals(""))){
			strAtores = "null";
		} else {
			strAtores += "ARRAY[";
			for (i=0;i<atores.size();i++){
				strAtores += "lower('";
				strAtores += atores.get(i);
				strAtores += "')";
				if (i != (atores.size()-1)){
					strAtores += ", ";
				}
			}
			strAtores += "]";
		}

		if((personagens.size() == 1) && (personagens.get(0).equals(""))){
			strPersonagens = "null";
		} else {
			strPersonagens += "ARRAY[";
			for (i=0;i<personagens.size();i++){
				strPersonagens += "lower('";
				strPersonagens += personagens.get(i);
				strPersonagens += "')";
				if (i != (personagens.size()-1)){
					strPersonagens += ", ";
				}
			}
			strPersonagens += "]";
		}
		
		if (genero.equals("")){
			genero = "null";
		} else {
			genero = "lower('" + genero + "')";
		}
		
		String SQL = "SELECT * "
				+ "FROM cosulta_one_flow(" + strAtores + ", " + strPersonagens + ", " + genero + ")";
		
		String SQLCount = "SELECT count(*) AS qtd FROM (" + SQL + ") AS sql_count";
		
		try {
			ps = conn.prepareStatement(SQLCount);
			
			rs = ps.executeQuery();
			rs.next();
			qtdPg = (int) Math.ceil(Float.valueOf(rs.getInt("qtd")) / PAGE_SIZE);
			
			SQL += " LIMIT" + PAGE_SIZE + " OFFSET " + (pagina - 1) * PAGE_SIZE;
			
			ps = conn.prepareStatement(SQL);
			
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
		
		String SQL = "SELECT * FROM ranking_genero_ator_diretor(?, ?)";
		
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
