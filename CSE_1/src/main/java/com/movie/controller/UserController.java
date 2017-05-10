package com.movie.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.movie.dao.api.MovieDao;
import com.movie.dao.api.UserDao;
import com.movie.dao.impl.UserDaoImpl;
import com.movie.form.Movie;
import com.movie.form.User;

@Controller
//@RequestMapping
public class UserController {
	
	@Resource(name = "userDaoImpl")
	UserDao userDao;
	@Resource(name="movieDaoImpl")
	MovieDao movieDao;
	@RequestMapping(value="login.do",method={RequestMethod.POST,RequestMethod.GET})
	public String loginView(HttpServletRequest request, HttpServletResponse response) {
		return "profile";
	}
	@RequestMapping(value="index.do")
	public String indexAction(HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar calendar = Calendar.getInstance();
		Date date = new Date(System.currentTimeMillis());
		calendar.setTime(date);
		calendar.add(Calendar.YEAR, -1);
		date = calendar.getTime();
		List<Movie> movies = movieDao.getMovieByDataTime(sdf.format(date));
		request.setAttribute("movies", movies);
		return "index";
	}
	@RequestMapping(value="loginAction.do")
	public String loginAction(HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		String username = request.getParameter("email");
		String password = request.getParameter("password");
		System.out.println(username+password);
		User user = userDao.getUserByUserName(username, password);
		request.getSession().setAttribute("user", user);
		if(user==null){
			request.setAttribute("info", "用户名或密码错误");
			return "profile";
		}else if(user.getType()==1){//表示普通用户
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar calendar = Calendar.getInstance();
	        Date date = new Date(System.currentTimeMillis());
	        calendar.setTime(date);
	        calendar.add(Calendar.YEAR, -1);
	        date = calendar.getTime();
			List<Movie> movies = movieDao.getMovieByDataTime(sdf.format(date));
			request.setAttribute("movies", movies);
			return "index";
		}else if(user.getType()==2){//表示管理员
			//List<Movie> movies = movieDao.getMovieByKeyWord("");
			List<User> users = userDao.getAllUser();
			request.setAttribute("users", users);
			return "controll";
		}
		return "profile";
	}
	@RequestMapping(value="register.do")
	public String register(HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		String email = request.getParameter("Email");
		String userName = request.getParameter("userid");
		String password = request.getParameter("password");
		User user = new User();
		user.setEmail(email);
		user.setPassword(password);
		user.setDateJoined(new Date());
		user.setUsername(userName);
		user.setFname(request.getParameter("firstName"));
		user.setLname(request.getParameter("lastName"));
		user.setZipcode(request.getParameter("zipcode"));
		user.setType(1);
		userDao.saveUser(user);
		return "profile";
	}
	@RequestMapping(value="search.do")
	public String search(HttpServletRequest request, HttpServletResponse response) throws JSONException, IOException {
		String query = request.getParameter("query");
		String searchFlag ="movieFlag";// request.getParameter("searchFlag");
		System.out.println(query+" "+searchFlag);
		if(searchFlag.equals("movieFlag")){
			List<Movie> movies = movieDao.getMovieByKeyWord(query);
			request.setAttribute("movies", movies);
		}else if(searchFlag.equals("actorFlag")){
			
		}
		return "index";
	}
}
