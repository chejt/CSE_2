<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.movie.form.Movie, com.movie.form.MovieShowing" %>
<%@ page import="java.io.*,java.util.*, com.movie.form.User" %>

<jsp:include page="header.jsp" flush="true" />
<c:set var="actors" scope="session" value="${adao.getActorsByMovieId(movie.id)}"/>
<link href="css/moviepage.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="http://fontawesome.io/assets/font-awesome/css/font-awesome.css">
<script src="commenteditor.js" type="text/javascript"></script>
<!--
<hr>
<a href="/CSE308/edit?action=4&id=${movie.id}">Edit</a> ||
<a href="/CSE308/edit?action=401&id=${movie.id}">Delete</a>
<hr>
-->

<body>
    <div class="container">
        <br>
        <br>
        <br>
        <br>
        <div class="row col-md-12" style="background-color: ">
            <div class="col-md-1"></div>
            <div class="col-md-3 col-md-4">
                <div class="row" style="background-color:">
                    <br>
                    <div class="col-sm-6" style="background-color: #28a4c9">
                      <c:choose>
                          <c:when test="${movie.releaseDate != null }">
                              <img src="${movie.mainImagePath}" alt="">
                          </c:when>
                          <c:otherwise>
                              <img src="image/default_actor.jpg" alt="">
                          </c:otherwise>
                      </c:choose>

                </div>

            </div>
            </div>
            <div class="col-md-8 col-md-12" style="background-color:">
                <div class="row" >
                        <h1>${ movie.title }
                        <c:choose>
            						    <c:when test="${ movie.releaseDate != null }">
            						        (${movie.releaseDate })
            						    </c:when>
            						</c:choose>

                        </h1><span class="glyphicons glyphicons-heart-empty"></span>
                        <br>
                        <h4>${ movie.length } min - ${ gdao.getGenreStrByMovieId(movie.id) } </h4>

                </div>

                        <div class="btn-group">
                            <button type="button" class="btn btn-default"><a href="homepage.html">Synopsis</a></button>
                            <button type="button" class="btn btn-default"><a href="#">Movie Times</a></button>
                            <button type="button" class="btn btn-default"><a href="#">Trailers</a></button>
                            <button type="button" class="btn btn-default"><a href="#">Cast</a></button>
                            <button type="button" class="btn btn-default"><a href="#">Reviews</a></button>
                            <button type="button" class="btn btn-default"><a href="#">News</a></button>
                            <button type="button" class="btn btn-default"><a href="#">Photos</a></button>

                            <button data-toggle="dropdown" class="btn btn-default dropdown-toggle" type="button"><span class="caret"></span>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a href="#"></a></li>
                                <li><a href="#"></a></li>
                            </ul>

                        </div>
                        <br>
                        <div class="container">
                            <div class="row">
                                <div class="col-md-2 col-md-2 text-center" style="background-color:" >
                                    <h1 class="rating-num">${movie.fanRating}</h1>
                                    <div class="rating">
                                      <c:forEach  var = "i" begin="2" end="10" step="2">
                                      <c:choose>
                                            <c:when test="${ i < movie.fanRating }">
                                              <span class="glyphicon glyphicon-star"></span>
                                            </c:when>
                                            <c:otherwise>
                                              <span class="glyphicon glyphicon-star-empty"></span>
                                            </c:otherwise>
                                        </c:choose>
                                      </c:forEach>
                                    </div>
                    <div>
                        <span class="glyphicon glyphicon-user"></span>${movie.numFanRatings} total
                    </div>
                    <div class="row rating-desc">
                        <div class="col-xs-3 col-md-3 text-right">
                            <span class="glyphicon glyphicon-star"></span>5
                        </div>
                        <div class="col-xs-8 col-md-9">
                            <div class="progress progress-striped">
                                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20"
                                    aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                    <span class="sr-only">80%</span>
                                </div>
                            </div>
                        </div>
                        <!-- end 5 -->
                        <div class="col-xs-3 col-md-3 text-right">
                            <span class="glyphicon glyphicon-star"></span>4
                        </div>
                        <div class="col-xs-8 col-md-9">
                            <div class="progress">
                                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20"
                                    aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                    <span class="sr-only">60%</span>
                                </div>
                            </div>
                        </div>
                        <!-- end 4 -->
                        <div class="col-xs-3 col-md-3 text-right">
                            <span class="glyphicon glyphicon-star"></span>3
                        </div>
                        <div class="col-xs-8 col-md-9">
                            <div class="progress">
                                <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20"
                                    aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                    <span class="sr-only">40%</span>
                                </div>
                            </div>
                        </div>
                        <!-- end 3 -->
                        <div class="col-xs-3 col-md-3 text-right">
                            <span class="glyphicon glyphicon-star"></span>2
                        </div>
                        <div class="col-xs-8 col-md-9">
                            <div class="progress">
                                <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="20"
                                    aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                    <span class="sr-only">20%</span>
                                </div>
                            </div>
                        </div>
                        <!-- end 2 -->
                        <div class="col-xs-3 col-md-3 text-right">
                            <span class="glyphicon glyphicon-star"></span>1
                        </div>
                        <div class="col-xs-8 col-md-9">
                            <div class="progress">
                                <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80"
                                    aria-valuemin="0" aria-valuemax="100" style="width: 15%">
                                    <span class="sr-only">15%</span>
                                </div>
                            </div>
                        </div>
                        <!-- end 1 -->
                    </div>
                                    <br></div>
                <div class="col-md-3 text-left" style="background-color: ">
                    <br>
                    <h5>Director:  <a href="actorpage.html"> xx xx xx</a></h5>
                    <h5>Cast:
                      <c:forEach items="${actors}" var="actor" varStatus="status1">

                          <c:choose>
                                <c:when test="${ status1.index < 10 }">
                                  <a href="/CSE308/actor?actor=${actor.id}">
                                    <c:out value="${actor.name}"/> /
                                  </a>
                                </c:when>
                          </c:choose>

                      </c:forEach>

                    <h5>Genre: ${ gdao.getGenreStrByMovieId(movie.id) } </h5>
                    <h5>Country/Region: United States</h5>
                    <h5>Released Time: ${movie.releaseDate}</h5>
                    <h5>Duration: ${movie.length} min</h5>
                    <h5>Language: ${movie.language} </h5>
                    <h5>IMDB ID: ${movie.imdbId} </h5>
                    <br>

                </div>

            </div>
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-4 text-left" style="background-color:; width: 150px; height: 100px">


            </div>
                                    <div class="btn-group col-md-4">
                        <button type="button" class="btn btn-default">Write Comment</button>
                        <button type="button" class="btn btn-default">Write Review</button>
                    </div>

                                </div>
                            </div>




        </div>

                </div>
        <br>
            <h3>CAST + CREW-------------------------------------------------------------------------------------------------------</h3>
            <div class="visual-list-container  native-scrolling text-left" style="background-color: s">

        <ul class="list-inline">
            <c:forEach items="${actors}" var="actor" varStatus="status1">
                <li class="list-group-item">
                    <a href="actor.do?actorId=${actor.id}">
                        <c:choose>
                              <c:when test="${ actor.mainImagePath != null && actor.mainImagePath.length() > 1 }">
                                <img src="${actor.mainImagePath}" alt="">
                              </c:when>
                              <c:otherwise>
                                <img src="img/default_actor.jpg" alt="">
                              </c:otherwise>
                          </c:choose>
                    </a>
                    <h6>${actor.name}</h6>
                    <h6 style="color: lightgray"><i>${adao.getCharacter(movie.id, actor.id)}</i></h6>
                </li>
            </c:forEach>

        </ul>

    </div>
    
    <% 
	User user= (User)request.getSession().getAttribute("user");
	if(user!=null){
		%>
		<h3>REVIEWS--------------------------------------------------------------------------------------------------------------</h3>

            <div class="col-md-10">
                <div class="widget-area no-padding blank">
                    <div class="status-upload">
                        <form action="addReview.do" method="post">
                        	title:<input type="text" name="title">
                        	<br>
                            content:<textarea placeholder="Say something" name="content"></textarea>
                            <br>
                            <input type="hidden" name="movieId" value="${movie.id}">
                            <input type="hidden" name="userId" value="${user.id}" >
                            <input type="submit" class="btn btn-success green" value="comment"><i class="fa fa-share"></i>
                        </form>
                    </div>
                </div>
            </div>
	    <% 
	}
%>
            


        <c:forEach items="${reviews}" var="review" varStatus="status1">
                    <div class="col-md-8">

                        <div class="span8">
                            <h4><strong>${ review.title }</strong></h4>
                        </div>

                    <div class="span6">
                        review content: ${review.content }
                    </div>

                    <div class="span8">
                        <p>
              <i class="icon-user"></i> by <a href="#">${review.authorName}</a>
              | <i class="icon-calendar"></i> ${review.dateWritten}
            </p>
                    </div>

                    </div>
        	<br>
        </c:forEach>

        </div>
</body>
<jsp:include page="footer.jsp" flush="true" />
