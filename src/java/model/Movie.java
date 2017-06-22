/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author renan
 */
public class Movie {
	private int id;
	private String title;
	private String year;
	private ArrayList<String> generos;
	private ArrayList<String> diretores;
	
	private ArrayList<Actor> atores;

	public Movie(int id, String title, String year) {
		this.id = id;
		this.title = title;
		this.year = year;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public ArrayList<String> getGeneros() {
		return generos;
	}

	public void addGenero(String genero) {
		if (this.generos != null){
			this.generos.add(genero);
		}
	}

	public ArrayList<String> getDiretores() {
		return diretores;
	}

	public void addDiretor(String diretor) {
		if (this.diretores != null){
			this.diretores.add(diretor);
		}
	}

	public ArrayList<Actor> getAtores() {
		return atores;
	}

	public void addActor(Actor ator) {
		if(this.atores != null){
			this.atores.add(ator);
		}
	}
	}
