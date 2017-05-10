<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.movie.form.Movie, com.movie.form.MovieShowing" %>
<link href="css/resultpage.css" rel="stylesheet">
<jsp:include page="header.jsp" flush="true" />
<body>
    <div class="container">
      <div class="row" style="background-color: ">

      <div class="gallery col-lg-12 col-md-12 col-sm-12 col-xs-12">
      <c:choose>
          <c:when test="${action == 1}">
                <h1 class="gallery-title">Showing Results for "<c:out value="${query}"/>"</h1>
                <c:set var="movies" scope="session" value="${mdao.getRelevant(query)}"/>
                <c:set var="actors" scope="session" value="${adao.getRelevant(query)}"/>
                <c:set var="reviews" scope="session" value="${rdao.getRelevant(query)}"/>
          </c:when>
      </c:choose>
      </div>

      <div align="center">
        <button type="button" class="btn btn-default filter-button active" data-filter="all">All</button>
        <button type="button" class="btn btn-default filter-button" data-filter="movies">MOVIES</button>
        <button type="button" class="btn btn-default filter-button" data-filter="actors">ACTORS</button>
        <button type="button" class="btn btn-default filter-button" data-filter="theaters">THEATERS</button>
        <button type="button" class="btn btn-default filter-button" data-filter="reviews">NEWS</button>
      </div>

      <div class="col-md-1"></div>

      <div class="col-md-10" style="background-color: ">
            <div class="row">
              <!--movies start here-->


              <c:forEach items="${movies}" var="movie" varStatus="status1">
                  <c:if test="${status1.index < 20}">

                  <div class="gallery_product filter all movies">

                          <div class="row">
                          <div class="item">
                              <div class="item col-md-3" style="background-color:">

                              <img class="item-image" src="${movie.mainImagePath}" alt="${movie.title}">
                              </div>


                              <div class="item-detail col-md-9">
                                  <div class="col-md-5">
                                      <br>
                                      <div class="item-title">
                                          <h4><a href="movie?movie=${movie.id}" class="nav-link"><c:out value="${movie.title}"/></a></h4>
                                      </div>
                                      <h6><i><c:out value="${movie.releaseDate}"/></i></h6>
                                      <br>
                                      <div class="ratings">
                                          <p>
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
                                          </p>
                                      </div>
                                      <br>
                                      <br>
                                      <h5><c:out value="${movie.length} min"/> </h5>
                                      <h5><c:out value="${ gdao.getGenreStrByMovieId(movie.id)}"/></h5>

                                  </div>
                                  <button type="button" class="pull-right btn">Buy Tickets</button>
                              </div>
                          </div>



                    </div>
                </div>
              </div>

                  </c:if>
              </c:forEach>

              <!--movies ends here-->

              <!--actors start here-->

              <c:forEach items="${actors}" var="actor" varStatus="status1">
                  <c:if test="${status1.index < 20}">

                  <div class="gallery_product filter all actors">
                      <div class="row">

                          <div class="item">

                              <div class="item col-md-3" >
                                  <img class="item-image" src="${actor.mainImagePath}" alt="">
                              </div>


                              <div class="item-detail col-md-9">
                                  <div class="col-md-5">
                                      <br>
                                      <div class="item-title">
                                          <h4><a href="actorpage.html" class="nav-link"><c:out value="${actor.name}"/></a></h4>
                                      </div>
                                      <h5>Born: <c:out value="${actor.dob}"/> <c:out value="in ${actor.birthPlace}"/></h5>
                                      <br>
                                      <h5>Occupation: Actor</h5>
                                      <br>

                                      <br>

                                  </div>
                              </div>
                          </div>

                      </div>
                  </div>

                </c:if>
            </c:forEach>

              <!--actors end here-->

              <!--theater starts here-->
              <li class="list-group-item">
                  <div class="gallery_product filter all theaters">
                      <div class="row">

                          <div class="item">
                              <div class="item col-md-3" style="background-color:">
                                  <img class="item-image" src="img/theater.jpg" alt="">
                              </div>
                              <div class="item-detail col-md-9">
                                  <div class="col-md-5">
                                      <br>
                                      <div class="item-title">
                                          <h4>AMC Loews 17 Stony Brook</h4>
                                      </div>
                                        <br>
                                      <br>
                                      <h5><a href="www.google.com/maps" class="nav-link">2196 Nesconset Highway, Stony Brook, NY 11790</a></h5>


                                  </div>
                                  <button type="button" class="pull-right btn">Buy Tickets</button>
                              </div>
                          </div>

                      </div>
                  </div>
              </li>
              <!--theater ends here-->

              <!--news start here-->
              <c:forEach items="${reviews}" var="review" varStatus="status1">
                  <c:if test="${status1.index < 20}">


              <li class="list-group-item">
                  <div class="gallery_product filter all reviews">
                      <div class="row">
                            <article>
                                <div class="row">
                                        <div class="col-sm-6 col-md-4">
                                            <figure>
                                                <img src="img/photo1.jpg">
                                            </figure>
                                        </div>
                                        <div class="col-sm-6 col-md-8">
                                            <span class="label label-default pull-right"><i class="glyphicon glyphicon-comment"></i>50</span>
                                            <h4>${review.title}</h4>
                                            <p>In the upcoming Tallulah,
                                                            Ellen Page stars as a young woman in desperate
                                                            straits who ends up caring for a stranger's baby.
                                                            The first trailer establishes the premise and the leading characters,
                                                            including Allison Janney and Tammy Blanchard. </p>
                                            <section>
                                                <i class="glyphicon glyphicon-user"></i>Author name
                                                <i class="glyphicon glyphicon-calendar"></i>2017/4/17
                                                <i class="glyphicon glyphicon-eye-open"></i>10000
                                                <a href="#" class="btn btn-default btn-sm pull-right">More ... </a>
                                            </section>
                                        </div>
                                </div>
                            </article>
                      </div>
                  </div>
              </li>

                  </c:if>
              </c:forEach>
              <!--news end here-->


          </ul>
      </div>
<%-- <!-- movie -->
      <c:choose>
          <c:when test="${action == 1}">
              <div style="background-color: ;">
                  <div class="container">
                      <br>
                      <div style="clear: both">
                          <h3 style="color: white;margin: 0 0 0 0; float: left">Movie Results</h3>
                          <h6 style="color: grey;margin: 0 0 0 0; float: left">(Showing 1-2 of 41)</h6>
                          <h5 style="color: grey;margin: 0 2% 0 0; float: right"><a href="#">See All Movies</a></h5>
                      </div>
                      <br><br>
                  </div>
              </div>
              <div class="row">
                  <div class="col-md-12">
                      <ul class="list-group">


                          <c:forEach items="${movies}" var="movie" varStatus="status1">
                              <c:if test="${status1.index < 20}">
                              <li class="list-group-item">
                                  <div class="row">
                                      <div class="col-md-2">
                                        <c:choose>
                                             <c:when test="${movie.mainImagePath != null && movie.mainImagePath.length() > 1}">
                                                <img src="${movie.mainImagePath}" alt="">
                                             </c:when>
                                             <c:otherwise>
                                                <img src="image/default_poster.jpg" alt="">
                                             </c:otherwise>
                                        </c:choose>
                                      </div>
                                      <div class="col-md-10">
                                          <div class="col-md-5">
                                              <h3><a href="movie?movie=${movie.id}" class="nav-link"><c:out value="${movie.title}"/></a></h3>
                                              <h6><i><c:out value="${movie.releaseDate}"/></i></h6>
                                              <div class="ratings">
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
                                              <h6><c:out value="${movie.length} min"/></h6>
                                              <h6><c:out value="${rdao.getGenreStrByMovieId(movie.id)}"/></h6>
                                          </div>
                                          <div class="col-md-7">
                                              Cast + Crew
                                              <c:forEach items="${adao.getActorsByMovieId(movie.id)}" var="actor" varStatus="status1">

                                                  <c:choose>
                                                        <c:when test="${ status1.index < 10 }">
                                                          <a href="/CSE308/actor?actor=${actor.id}">
                                                            <c:out value="${actor.name}"/> /
                                                          </a>
                                                        </c:when>
                                                  </c:choose>

                                              </c:forEach>
                                          </div>
                                          <button type="button" class="pull-right btn btn-primary">Buy Tickets</button>
                                      </div>
                                  </div>
                              </li>
                              </c:if>
                          </c:forEach>
                      </ul>
                  </div>
              </div>
          </c:when>
      </c:choose>

<!-- actor -->
      <c:choose>
          <c:when test="${action == 1}">
              <div style="background-color:;">
                  <div class="container">
                      <br>
                      <div style="clear: both">
                          <h3 style="color: white;margin: 0 0 0 0; float: left">Actor Results</h3>
                          <h5 style="color: grey;margin: 0 2% 0 0; float: right"><a href="#">See All Actors</a></h5>
                      </div>
                      <br><br>
                  </div>
              </div>
              <div class="row">
                  <div class="col-md-12">
                      <ul class="list-group">

                          <c:forEach items="${actors}" var="actor" varStatus="status1">
                              <c:if test="${status1.index < 20}">
                              <li class="list-group-item">
                                  <div class="row">
                                      <div class="col-md-2">
                                        <c:choose>
                                           <c:when test="${actor.mainImagePath != null}">
                                             <img src="${actor.mainImagePath}" alt="">
                                           </c:when>
                                           <c:otherwise>
                                             <img src="image/default_actor.jpg" alt="">
                                           </c:otherwise>
                                        </c:choose>
                                      </div>
                                      <div class="col-md-10">
                                          <div class="col-md-5">
                                              <h3><a href="actor?actor=${actor.id}" class="nav-link"><c:out value="${actor.name}"/></a></h3>
                                          </div>
                                      </div>
                                  </div>
                              </li>
                              </c:if>
                          </c:forEach>
                      </ul>
                  </div>
              </div>
          </c:when>
      </c:choose>

<!-- article -->

      <c:choose>
          <c:when test="${action == 1}">
              <div style="background-color: ;">
                  <div class="container">
                      <br>
                      <div style="clear: both">
                          <h3 style="color: white;margin: 0 0 0 0; float: left">Article Results</h3>
                          <h5 style="color: grey;margin: 0 2% 0 0; float: right"><a href="#">See All Articles</a></h5>
                      </div>
                      <br><br>
                  </div>
              </div>
              <div class="row">
                  <div class="col-md-12">
                      <ul class="list-group">

                          <c:forEach items="${reviews}" var="review" varStatus="status1">
                              <c:if test="${status1.index < 20}">
                                <li class="list-group-item">
                                    <div class="row">
                                        <div class="col-md-10">
                                            <div class="col-md-5">
                                                <h3><a href="" class="nav-link"><c:out value="${review.title}"/></a></h3>
                                                <h3><a href="" class="nav-link"><c:out value="${review.content}"/></a></h3>
                                                <p><c:out value="${review.dateWritten}"/></p>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                              </c:if>
                          </c:forEach>
                      </ul>
                  </div>
              </div>
          </c:when>
      </c:choose> --%>

    </div>
  </div>
</div>

</body>
<jsp:include page="footer.jsp" flush="true" />
