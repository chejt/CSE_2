package com.movie.form;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name="reviews")
public class Review implements Serializable {
	@Id
	@GeneratedValue
	private int id;
	@Column(name="userId")
	private int userId;
	@Column(name="movieId")
	private int movieId;
	@Column(name="date")
	private Date dateWritten;
	@Column(name="title")
	private String title;
	@Column(name="content")
	private String content;
	@Column(name="authorName")
	private String authorName;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getMovieId() {
		return movieId;
	}
	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}
	public Date getDateWritten() {
		return dateWritten;
	}
	public void setDateWritten(Date dateWritten) {
		this.dateWritten = dateWritten;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAuthorName() {
		return authorName;
	}
	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}
	
}
