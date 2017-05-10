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

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.movie.dao.api.ActorDao;
import com.movie.dao.api.MovieDao;
import com.movie.dao.api.PerformDao;
import com.movie.form.Actor;
import com.movie.form.Movie;
import com.movie.form.Performs;
import com.movie.form.Review;

@Controller
public class ActorController {
	@Resource(name="actorDaoImpl")
	ActorDao actorDao;
	@Resource(name="movieDaoImpl")
	MovieDao movieDao;
	@Resource(name="performDaoImpl")
	PerformDao performDao;
	@RequestMapping(value="actor.do")
	public String actorIndex(HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		int actorId = Integer.parseInt(request.getParameter("actorId"));
		Actor actor = actorDao.getActorById(actorId);
		request.setAttribute("actor", actor);
		List<Performs> performs = performDao.getPerformByActorId(actorId);
		List<Movie> movies = new ArrayList<Movie>();
		for(Performs p:performs){
			movies.add(movieDao.getMovieById(p.getMovieId()));
		}
		request.setAttribute("movies", movies);
		return "actor";
	}
	@RequestMapping(value="allMoviePaging.do")
	public void allMoviePaging(HttpServletRequest request, HttpServletResponse response) throws IOException  {
		JSONObject result = new JSONObject();
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		int page = Integer.parseInt(request.getParameter("page"));
		int pageSize = Integer.parseInt(request.getParameter("pageSize"));
		System.out.println(page+" "+pageSize);
		JSONArray arr = new JSONArray();
		List<Movie> movies = movieDao.getMovieByKeyWordPage("", page, pageSize);
		for(Movie m:movies){
			arr.add(m);
		}
		result.put("info2", arr);
		result.put("currentpage", page);
		result.put("totalpage", Math.ceil(movieDao.getMovieCount("")/pageSize));
		response.getWriter().write(result.toString());
	}
	@RequestMapping(value="allActorPaging.do")
	public void allActorPaging(HttpServletRequest request, HttpServletResponse response) throws IOException  {
		JSONObject result = new JSONObject();
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		int page = Integer.parseInt(request.getParameter("page"));
		int pageSize = Integer.parseInt(request.getParameter("pageSize"));
		System.out.println(page+" "+pageSize);
		JSONArray arr = new JSONArray();
		List<Actor> actors = actorDao.getActorByKeyWordPage("", page, pageSize);
		for(Actor a:actors){
			arr.add(a);
		}
		result.put("info2", arr);
		result.put("currentpage", page);
		result.put("totalpage", Math.ceil(actorDao.getActorCount("")/pageSize));
		response.getWriter().write(result.toString());
	}
	@RequestMapping(value="deleteActor.do")
	public void deleteAcor(HttpServletRequest request, HttpServletResponse response) throws IOException  {
		JSONObject result = new JSONObject();
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		int actorId = Integer.parseInt(request.getParameter("actorId"));
		System.out.println("actorId"+actorId);
		//级联删除
		Actor a = new Actor();
		a .setId(actorId);
		List<Performs> performs = performDao.getPerformByActorId(actorId);
		if(performs!=null){
			for(Performs p:performs){
				performDao.deletePerform(p);
			}
		}
		if(actorDao.deleteActor(a)){
			result.put("statue", "success");
		}else{
			result.put("statue", "fail");
		}
		response.getWriter().write(result.toString());
	}
	@RequestMapping(value="actorUpdatePre.do")
	public String actorUpdatePre(HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		int actorId = Integer.parseInt(request.getParameter("actorId"));
		Actor actor = actorDao.getActorById(actorId);
		request.setAttribute("actor", actor);
		return "actorUpdate";
	}
	@RequestMapping(value="actorUpdate.do")
	public String actorUpdate(HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		int actorId = Integer.parseInt(request.getParameter("actorId"));
		String name = request.getParameter("name");
		String biography = request.getParameter("biography");
		String birthPlace = request.getParameter("birthPlace");
		Actor actor = actorDao.getActorById(actorId);
		actor.setName(name);
		actor.setBiography(biography);
		actor.setBirthPlace(birthPlace);
		if(actorDao.updateActor(actor)){
			request.setAttribute("statue", "success");
		}else{
			request.setAttribute("statue", "fail");
		}
		return "actorUpdateResult";
	}
}
