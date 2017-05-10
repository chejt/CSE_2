package com.movie.form;
import javax.persistence.*;

import java.io.Serializable;
import java.util.List;
@Entity
@Table(name="actors")
public class Actor implements Serializable {
	@Id
	@GeneratedValue
	private int id;
	@Column(name="name")
	private String name;
	@Column(name="sex")
	private String sex;
	/*@Column(name="age")*/
	@Column(name="birthPlace")
	private String birthPlace;
	@Column(name="dob")
	private String dob;
	@Column(name="dod")
	private String dod;
	@Column(name="imdbId")
	private String imdbId;
	@Column(name="biography")
	private String biography;
	@Column(name="mainImagePath")
	private String mainImagePath;
	/*private List<String> photosPaths;*/
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getBirthPlace() {
		return birthPlace;
	}
	public void setBirthPlace(String birthPlace) {
		this.birthPlace = birthPlace;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getDod() {
		return dod;
	}
	public void setDod(String dod) {
		this.dod = dod;
	}
	public String getImdbId() {
		return imdbId;
	}
	public void setImdbId(String imdbId) {
		this.imdbId = imdbId;
	}
	public String getBiography() {
		return biography;
	}
	public void setBiography(String biography) {
		this.biography = biography;
	}
	public String getMainImagePath() {
		return mainImagePath;
	}
	public void setMainImagePath(String mainImagePath) {
		this.mainImagePath = mainImagePath;
	}
	/*public List<String> getPhotosPaths() {
		return photosPaths;
	}
	public void setPhotosPaths(List<String> photosPaths) {
		this.photosPaths = photosPaths;
	}
	*/


}
