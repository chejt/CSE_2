package com.movie.form;

import java.io.Serializable;
import java.util.List;

@SuppressWarnings("serial")
public class Theater implements Serializable {
  private int id;
  private String name;
  private String address;
  private String city;
  private int zipcode;
  private String imagePath;
  //TODO list<room>
  //TODO list<movieShowing>
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
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public String getCity() {
	return city;
}
public void setCity(String city) {
	this.city = city;
}
public int getZipcode() {
	return zipcode;
}
public void setZipcode(int zipcode) {
	this.zipcode = zipcode;
}
public String getImagePath() {
	return imagePath;
}
public void setImagePath(String imagePath) {
	this.imagePath = imagePath;
}

}
