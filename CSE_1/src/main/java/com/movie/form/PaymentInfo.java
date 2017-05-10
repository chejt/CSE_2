package com.movie.form;

import java.io.Serializable;
import java.util.List;

@SuppressWarnings("serial")
public class PaymentInfo implements Serializable {
  private String fname;
  private String lname;
  private int cardNumber;
  private int expMonth;
  private int expYear;
  private int zipcode;
public String getFname() {
	return fname;
}
public void setFname(String fname) {
	this.fname = fname;
}
public String getLname() {
	return lname;
}
public void setLname(String lname) {
	this.lname = lname;
}
public int getCardNumber() {
	return cardNumber;
}
public void setCardNumber(int cardNumber) {
	this.cardNumber = cardNumber;
}
public int getExpMonth() {
	return expMonth;
}
public void setExpMonth(int expMonth) {
	this.expMonth = expMonth;
}
public int getExpYear() {
	return expYear;
}
public void setExpYear(int expYear) {
	this.expYear = expYear;
}
public int getZipcode() {
	return zipcode;
}
public void setZipcode(int zipcode) {
	this.zipcode = zipcode;
}

}
