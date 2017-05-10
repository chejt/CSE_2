package com.movie.dao.api;


import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.movie.form.Actor;
import com.movie.form.Movie;
import com.movie.form.Review;

public interface ReviewDao {
	public List<Review> getReviewByMovieId(int movieId);
	public Review getReviewById(int reviewId);
	public boolean addReview(Review review);
	public boolean deleteReview(Review review);
	public List<Review> getReviewByKeyWordPage(String keyword,int page,int pageSize);
	public boolean updateReview(Review review);
	public long getReviewCount(String keyword);
}
