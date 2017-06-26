/*
 * This is free and unencumbered software released into the public domain.
 * 
 * Anyone is free to copy, modify, publish, use, compile, sell, or
 * distribute this software, either in source code form or as a compiled
 * binary, for any purpose, commercial or non-commercial, and by any
 * means.

 * In jurisdictions that recognize copyright laws, the author or authors
 * of this software dedicate any and all copyright interest in the
 * software to the public domain. We make this dedication for the benefit
 * of the public at large and to the detriment of our heirs and
 * successors. We intend this dedication to be an overt act of
 * relinquishment in perpetuity of all present and future rights to this
 * software under copyright law.

 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 * IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
 * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
 * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.

 * For more information, please refer to <http://unlicense.org/>
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.B1Result;

import model.Movie;
import persistence.DAOException;
import persistence.BuscaDAO;

/**
 *
 * @author renan
 */
public class Busca1 extends HttpServlet {

	/**
	 * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
	 * methods.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	
	private ArrayList<String> atores;
	private ArrayList<String> personagens;
	private String genero;
	private int qtdPg;
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			/* TODO output your page here. You may use following sample code. */
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet Busca1</title>");			
			out.println("</head>");
			out.println("<body>");
			out.println("<h1>Servlet Busca1 at " + request.getContextPath() + "</h1>");
			out.println("</body>");
			out.println("</html>");
		}
	}

	// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
	/**
	 * Handles the HTTP <code>GET</code> method.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * Handles the HTTP <code>POST</code> method.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		if (request.getParameter("source") != null){
			B1Result resultado = null;

			try{
				BuscaDAO b1DAO = new BuscaDAO();
				resultado = b1DAO.busca1(atores, personagens, genero, Integer.valueOf(request.getParameter("page")));

			} catch(DAOException | SQLException ex) {
				Logger.getLogger(Busca1.class.getName()).log(Level.SEVERE, null, ex);
			}

			qtdPg = resultado.getQtdPg();

			request.setAttribute("movies", resultado.getMovies());
			request.setAttribute("qtdPg", qtdPg);
			request.getRequestDispatcher("/WEB-INF/xml/movies.jsp").forward(request, response);	
		} else {
		
			atores = new ArrayList<>();
			personagens = new ArrayList<>();

			atores.addAll(Arrays.asList(request.getParameterValues("ator[]")));
			personagens.addAll(Arrays.asList(request.getParameterValues("personagem[]")));
			genero = request.getParameter("genero");		

			B1Result resultado = null;

			try{
				BuscaDAO b1DAO = new BuscaDAO();
				resultado = b1DAO.busca1(atores, personagens, genero, 1);

			} catch(DAOException | SQLException ex) {
				Logger.getLogger(Busca1.class.getName()).log(Level.SEVERE, null, ex);
			}

			qtdPg = resultado.getQtdPg();

			request.setAttribute("movies", resultado.getMovies());
			request.setAttribute("qtdPg", qtdPg);
			request.getRequestDispatcher("/WEB-INF/xml/movies.jsp").forward(request, response);	
		}
	}

	/**
	 * Returns a short description of the servlet.
	 *
	 * @return a String containing servlet description
	 */
	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>

}
