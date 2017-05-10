package com.movie.dao.api;


import java.util.List;

import com.movie.form.Movie;

public interface MovieDao {
	public List<Movie> getMovieByDataTime(String date);
	public List<Movie> getMovieByVisit();
	public List<Movie> getMovieByKeyWord(String keyword);
	public List<Movie> getMovieByKeyWordPage(String keyword,int page,int pageSize);
	public Movie getMovieById(int id);
	public boolean updateMovie(Movie movie);
	public boolean adddMovie(Movie movie);
	public boolean deleteMovie(Movie movie);
	public long getMovieCount(String keyword);
}
