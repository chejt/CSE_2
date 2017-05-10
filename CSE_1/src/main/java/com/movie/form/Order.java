package com.movie.form;

import java.io.Serializable;
import java.util.List;

@SuppressWarnings("serial")
public class Order implements Serializable {
  private int id;
  private int userId;
  private int movieId;
  private List<String> seatNumbers;
  private Double price;
  private PaymentInfo payment;
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
public List<String> getSeatNumbers() {
	return seatNumbers;
}
public void setSeatNumbers(List<String> seatNumbers) {
	this.seatNumbers = seatNumbers;
}
public Double getPrice() {
	return price;
}
public void setPrice(Double price) {
	this.price = price;
}
public PaymentInfo getPayment() {
	return payment;
}
public void setPayment(PaymentInfo payment) {
	this.payment = payment;
}

}
