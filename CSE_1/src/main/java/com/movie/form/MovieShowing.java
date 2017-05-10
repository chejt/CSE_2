package com.movie.form;

import java.io.Serializable;
import java.util.List;
import java.util.Map;


@SuppressWarnings("serial")
public class MovieShowing implements Serializable {
  private List<Movie> movieShowing;
  private List<Movie> movieUpcoming;
  private List<Movie> movieDisplay;
  private int num = 16;
  private int start = 0;

}
