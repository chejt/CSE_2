package com.movie.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.movie.dao.api.ActorDao;
import com.movie.dao.api.MovieDao;
import com.movie.dao.api.PerformDao;
import com.movie.dao.api.ReviewDao;
import com.movie.form.Actor;
import com.movie.form.Movie;
import com.movie.form.Performs;
import com.movie.form.Review;

@Controller
public class MovieController {
	@Resource(name="movieDaoImpl")
	MovieDao movieDao;
	@Resource(name="performDaoImpl")
	PerformDao performDao;
	@Resource(name="actorDaoImpl")
	ActorDao actorDao;
	@Resource(name="reviewDaoImpl")
	ReviewDao reviewDao;
	@RequestMapping(value="movieDetail.do")
	public String movieDetail(HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		int movieId = Integer.parseInt(request.getParameter("movieId"));
		Movie movie = movieDao.getMovieById(movieId);
		request.setAttribute("movie", movie);
		List<Performs> performs = performDao.getPerformByMoiveId(movieId);
		List<Actor> actors = new ArrayList<Actor>();
		for(Performs p:performs){
			actors.add(actorDao.getActorById(p.getActorId()));
		}
		request.setAttribute("actors", actors);
		request.setAttribute("reviews", reviewDao.getReviewByMovieId(movieId));
		return "movie";
	}
	@RequestMapping(value="deleteMovie.do")
	public void allMoviePaging(HttpServletRequest request, HttpServletResponse response) throws IOException  {
		JSONObject result = new JSONObject();
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		int movieId = Integer.parseInt(request.getParameter("movieId"));
		System.out.println("movieId"+movieId);
		//级联删除
		Movie m = new Movie();
		m.setId(movieId);
		List<Performs> performs = performDao.getPerformByMoiveId(movieId);
		List<Review> reviews = reviewDao.getReviewByMovieId(movieId);
		if(performs!=null){
			for(Performs p:performs){
				performDao.deletePerform(p);
			}
		}
		if(reviews!=null){
			for(Performs p:performs){
				performDao.deletePerform(p);
			}
		}
		if(movieDao.deleteMovie(m)){
			result.put("statue", "success");
		}else{
			result.put("statue", "fail");
		}
		response.getWriter().write(result.toString());
	}
	@RequestMapping(value="movieUpdatePre.do")
	public String movieUpdatePre(HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		int movieId = Integer.parseInt(request.getParameter("movieId"));
		Movie movie = movieDao.getMovieById(movieId);
		request.setAttribute("movie", movie);
		return "movieUpdate";
	}
	@RequestMapping(value="movieUpdate.do")
	public String movieUpdate(HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		int movieId = Integer.parseInt(request.getParameter("movieId"));
		String title = request.getParameter("title");
		String length = request.getParameter("length");
		String synopsis = request.getParameter("synopsis");
		Movie movie = movieDao.getMovieById(movieId);
		movie.setTitle(title);
		movie.setLength(Integer.parseInt(length));
		movie.setSynopsis(synopsis);
		if(movieDao.updateMovie(movie)){
			request.setAttribute("statue", "success");
		}else{
			request.setAttribute("statue", "fail");
		}
		return "movieUpdateResult";
	}
}
