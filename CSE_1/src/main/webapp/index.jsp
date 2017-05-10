<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.movie.form.Movie, com.movie.form.Review, com.movie.form.User" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="header.jsp" flush="true" />
<c:set var="newComingMovies" scope="session" value="${movies}"/>
<c:set var="newComingSize" scope="session" value="${fn:length(newComingMovies)}"/>
<body>

  <div class="container">
      <div class="row">

             <div class="col-md-12">
                 <div class="container">
                     <div class="row">
                         <br>
                         <h3>New Coming</h3>
                         <br><br>
                     </div>
                      <div class="col-md-12">
                           <div id="Carousel" class="carousel slide">
                           

                           <!-- Carousel items -->
                           <div class="carousel-inner">

                             <c:forEach var="i" begin="0" end="${(newComingSize / 4)-1}">

                               <c:choose>
                                  <c:when test="${i == 0}">
                                      <div class="item active">
                                  </c:when>
                                  <c:otherwise>
                                      <div class="item">
                                   </c:otherwise>
                               </c:choose>
                                   <div class="row">
                                      <c:forEach var="j" begin="${i*4}" end="${(i+1)*4 - 1}">
                                          <c:choose>
                                             <c:when test="${j < newComingSize -1}">
                                                <div class="col-md-3">
                                                    <a href="movieDetail.do?movieId=${newComingMovies.get(j).id}" class="thumbnail">
                                                        <img src="${newComingMovies.get(j).mainImagePath}" alt="${newComingMovies.get(j).title}" >
                                                    </a>
                                                </div>
                                             </c:when>
                                          </c:choose>
                                      </c:forEach>
                                   </div><!--.row-->
                                 </div><!--.item-->

                             </c:forEach>
                           </div><!--.carousel-inner-->
                             <a data-slide="prev" href="#Carousel" class="left carousel-control">‹</a>
                             <a data-slide="next" href="#Carousel" class="right carousel-control">›</a>
                           </div><!--.Carousel-->

                      </div>
                </div>
           </div>

       </div>


          <br>
          <!--Advertisement-->

          <div class="row carousel-holder">
              <div class="col-md-12">
                  <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                      <ol class="carousel-indicators">
                          <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                              <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                              <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                      </ol>
                      <div class="carousel-inner">
                          <div class="item active">
                                  <img class="slide-image" src="img/sample1.jpg" alt="">
                              </div>
                              <div class="item">
                                  <img class="slide-image" src="img/sample2.jpg" alt="">
                              </div>
                              <div class="item">
                                  <img class="slide-image" src="img/sample3.jpg" alt="">
                              </div>
                      </div>
                       <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                              <span class="glyphicon glyphicon-chevron-left"></span>
                          </a>
                          <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                              <span class="glyphicon glyphicon-chevron-right"></span>
                          </a>
                  </div>
              </div>
          </div>

          <br>

  <!-- Controls -->
  <div class="carousel-controls">
    <a class="left carousel-control" href="#carousel-2" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
    </a>
    <a class="right carousel-control" href="#carousel-2" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
    </a>
  </div>


<p>
   Todays date is: <%= (new java.util.Date()).toLocaleString()%>
</p>

<jsp:include page="footer.jsp" flush="true" />
