<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.movie.form.Actor, com.movie.form.Movie, com.movie.form.User" %>
<jsp:include page="header.jsp" flush="true" />
<% 
	User user= (User)request.getSession().getAttribute("user");
	if(user==null){
		%>
		<script type="text/javascript">  
	    window.location="login.do";  
	    </script>  
	    <% 
	}
%>
<link href="css/actorpage.css" rel="stylesheet" type="text/css"/>

<body>
    <div class="container">

        <div class="row col-md-12" style="background-color:">
            <div class="col-md-1"></div>
            <div class="col-md-3 col-md-4">
                <div class="row" style="background-color:">
                    <br>
                    <div class="col-sm-6">
                      <c:choose>
                          <c:when test="${ actor.mainImagePath != null}">
                            <img src="${actor.mainImagePath}" alt="">
                          </c:when>
                          <c:otherwise>
                              <img src="image/default_actor.jpg" alt="">
                          </c:otherwise>
                      </c:choose>

                    </div>

            </div>
            </div>
            <div class="col-md-6 col-md-12" style="background-color:">
                <div class="row" >
                        <h1>${actor.name}</h1><span class="glyphicons glyphicons-heart-empty"></span>
                        <br>
                        <h4>Actor|Producer|Director|Writer</h4>

                </div>
                <div class="btn-group">
                            <button type="button" class="btn btn-default"><a href="homepage.html">Overview</a></button>
                            <button type="button" class="btn btn-default"><a href="#">Filmography</a></button>
                            <button type="button" class="btn btn-default"><a href="#">Trailers</a></button>
                            <button type="button" class="btn btn-default"><a href="#">News</a></button>
                            <button type="button" class="btn btn-default"><a href="#">Photos</a></button>



                        </div>
                <br>
                <div class="col-md-10 text-left" style="background-color:">
                    <br>
                    <h5>Date of Birth: ${actor.dob}</h5>

                    <c:choose>
                        <c:when test="${ actor.dod != null && actor.dod.length() > 1}">
                          <h5>Date of Death: ${actor.dod}</h5>
                        </c:when>
                    </c:choose>
                    <h5>Birth Place: ${actor.birthPlace}</h5>
                    <h5>IMDB ID: ${actor.imdbId}</h5>
                    <h3>Biograph</h3>
                    <p>
                      ${actor.biography}
                    </p>

                </div>
            </div>
        </div>
        <br>
        <br>
        <h3>FILMOGRAPHY----------------------------------------------------------------------------------------------------</h3>
        <div class="row">
          <div class="visual-list-container native-scrolling">
              <ul class="list-inline">
                    <c:forEach items="${movies}" var="movie" varStatus="status1">
                                          <li class="list-group-item">
                                              <a href="movieDetail.do?movieId=${movie.id}">
                                                          <img src="${movie.mainImagePath}" alt="">
                                              </a>
                                              <h6><c:out value="${movie.title}"/></h6>
                                                <c:choose>
                                                    <c:when test="${ movie.releaseDate != null }">
                                                      <h7><c:out value="${ movie.releaseDate}"/></h7>
                                                    </c:when>
                                                </c:choose>
                                          </li>
                    </c:forEach>
             </ul>
           <div class="pull-right" ><h5><a href="#">SEE EMMA WATSON’S FULL FILMOGRAPHY</a></h5>
                 </div>

            </div></div>
        <h3>ARTICLES & NEWS-----------------------------------------------------------------------------------------------------</h3>
        <div class="container" >
            <div class="row">
    <div class="col-sm-3" >
		<div class="news">
			<div class="img-figure">
				<img src="img/photo1.jpg" class="img-responsive">
			</div>
			<div class="title">
				<h1>THERE WILL BE AN AVENGERS</h1>
			</div>
			<p class="description">
				For more detail, please click the picture
			</p>
			<p class="more">
				<a href="#">read more</a><i class="fa fa-angle-right" aria-hidden="true"></i>
			</p>
                            </div>

	</div>
                <div class="col-sm-3" >
                    <div class="news">
			<div class="img-figure">
				<img src="img/photo1.jpg" class="img-responsive">
			</div>
			<div class="title">
				<h1>News title here</h1>
			</div>
			<p class="description">
				For more detail, please click the picture
			</p>
			<p class="more">
				<a href="#">read more</a><i class="fa fa-angle-right" aria-hidden="true"></i>
			</p>
                            </div>
                </div>
                <div class="col-sm-3">
		<div class="news">
			<div class="img-figure">
				<img src="img/photo1.jpg" class="img-responsive">
			</div>
			<div class="title">
				<h1>THERE WILL BE AN AVENGERS</h1>
			</div>
			<p class="description">
				For more detail, please click the picture
			</p>
			<p class="more">
				<a href="#">read more</a><i class="fa fa-angle-right" aria-hidden="true"></i>
			</p>
                            </div>

	</div>
                <div class="col-sm-3" >
                    <div class="news">
			<div class="img-figure">
				<img src="img/photo1.jpg" class="img-responsive">
			</div>
			<div class="title">
				<h1>News title here</h1>
			</div>
			<p class="description">
				For more detail, please click the picture
			</p>
			<p class="more">
				<a href="#">read more</a><i class="fa fa-angle-right" aria-hidden="true"></i>
			</p>
                            </div>
                </div>
            </div>
        </div>

              <article>
        <div class="row">
            <div class="col-sm-6 col-md-4">
                <figure>
                    <img src="img/photo1.jpg">
                </figure>
            </div>
            <div class="col-sm-6 col-md-8">
                <span class="label label-default pull-right"><i class="glyphicon glyphicon-comment"></i>50</span>
                <h4>Article Title</h4>
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
              <br>
              <article>
        <div class="row">
            <div class="col-sm-6 col-md-4">
                <figure>
                    <img src="img/photo1.jpg">
                </figure>
            </div>
            <div class="col-sm-6 col-md-8">
                <span class="label label-default pull-right"><i class="glyphicon glyphicon-comment"></i>50</span>
                <h4>Article Title</h4>
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
              <br>

    </div>
</body>

<jsp:include page="footer.jsp" flush="true" />
