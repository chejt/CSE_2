package com.movie.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
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
public class ReviewController {
	@Resource(name="actorDaoImpl")
	ActorDao actorDao;
	@Resource(name="movieDaoImpl")
	MovieDao movieDao;
	@Resource(name="performDaoImpl")
	PerformDao performDao;
	@Resource(name="reviewDaoImpl")
	ReviewDao reviewDao;
	@RequestMapping(value="addReview.do")
	public String addReview(HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		System.out.println("***"+request.getParameter("userId"));
		System.out.println(request.getParameter("movieId"));
		int userId = Integer.parseInt(request.getParameter("userId")==null?"0":request.getParameter("userId"));
		int movieId = Integer.parseInt(request.getParameter("movieId"));
		String content = request.getParameter("content");
		String title = request.getParameter("title");
		Review review = new Review();
		review.setMovieId(movieId);
		review.setUserId(userId);
		review.setContent(content);
		review.setTitle(title);
		review.setDateWritten(new Date());
		if(reviewDao.addReview(review)){
			request.setAttribute("statue", "success");
		}else{
			request.setAttribute("statue", "error");
		}
		return "redirect:movieDetail.do?movieId="+movieId;
	}
	
	@RequestMapping(value="allReviewPaging.do")
	public void allReviewPaging(HttpServletRequest request, HttpServletResponse response) throws IOException  {
		JSONObject result = new JSONObject();
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		int page = Integer.parseInt(request.getParameter("page"));
		int pageSize = Integer.parseInt(request.getParameter("pageSize"));
		System.out.println(page+" "+pageSize);
		JSONArray arr = new JSONArray();
		List<Review> reviews = reviewDao.getReviewByKeyWordPage("", page, pageSize);
		for(Review r:reviews){
			arr.add(r);
		}
		result.put("info2", arr);
		result.put("currentpage", page);
		result.put("totalpage", Math.ceil(reviewDao.getReviewCount("")/pageSize));
		response.getWriter().write(result.toString());
	}
	@RequestMapping(value="deleteReview.do")
	public void deleteReview(HttpServletRequest request, HttpServletResponse response) throws IOException  {
		JSONObject result = new JSONObject();
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		int reviewId = Integer.parseInt(request.getParameter("reviewId"));
		System.out.println("reviewId"+reviewId);
		Review review = new Review();
		review.setId(reviewId);
		if(reviewDao.deleteReview(review)){
			result.put("statue", "success");
		}else{
			result.put("statue", "fail");
		}
		response.getWriter().write(result.toString());
	}
	@RequestMapping(value="reviewUpdatePre.do")
	public String reviewUpdatePre(HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		int reviewId = Integer.parseInt(request.getParameter("reviewId"));
		Review review = reviewDao.getReviewById(reviewId);
		request.setAttribute("review", review);
		return "reviewUpdate";
	}
	@RequestMapping(value="reviewUpdate.do")
	public String reviewUpdate(HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		int reviewId = Integer.parseInt(request.getParameter("reviewId"));
		Review review = reviewDao.getReviewById(reviewId);
		review.setContent(request.getParameter("content"));
		review.setTitle(request.getParameter("title"));
		review.setDateWritten(new Date());
		if(reviewDao.updateReview(review)){
			request.setAttribute("statue", "success");
		}else{
			request.setAttribute("statue", "fail");
		}
		return "reviewUpdateResult";
	}
}
