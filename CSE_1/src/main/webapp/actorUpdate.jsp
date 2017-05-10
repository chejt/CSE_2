<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.io.*,java.util.*, com.movie.form.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>SBU MOVIE</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/homepage.css" rel="stylesheet">
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="js/carousel-1.js" type="text/javascript"></script>
<script src="js/carousel-2.js" type="text/javascript"></script>
<script src="js/filter.js" type="text/javascript"></script>
<script type="text/javascript" src="js/pageView.js"></script>
<script type="text/javascript">
function register(){
	window.location.href="register.jsp";
}
</script>
<nav class="navbar navbar-default" role="navigation">
  <div class="container">

    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-brand-centered">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a href="index.jsp" title="">
      <div class="navbar-brand navbar-brand-centered">SBU MOVIE</div>
      </a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="navbar-brand-centered">
	      <ul class="nav navbar-nav">
	        <li><a href="index.jsp">Home</a></li>
	        <li><a href="index.jsp">Movie Times+Tickets</a></li>
	        <li><a href="index.jsp">Movie News</a></li>
	        <li><a href="index.jsp">My Movies</a></li>
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
           <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">App Download <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                    <img style="width:200px;height:200px"src="img/QRcode.png"></img>
                </ul>
          </li>
                <li>
                  <c:choose>
                      <c:when test="${session.isNew()}">
                          ${user.email} | Log Out
                          <br />
                      </c:when>
                      <c:otherwise>
                    <button class="btn btn-primary" data-toggle="modal" data-target=".bs-modal-sm" style="" onclick="register()">
                        Register
                    </button>
                    <hr class="signinform">
                     <div class="modal fade bs-modal-sm" id="myModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
        </div>
                    </c:otherwise>
                </c:choose>
                </li>
		      </ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->

		</nav>
</head>
<body>
            <form class="form-horizontal" method="post" action="actorUpdate.do">
            <fieldset>
            <!-- Sign Up Form -->
            <!-- Text input-->
            <div class="control-group">
              <label class="control-label" for="title">name:</label>
              <div class="controls">
                <input id="name" name="name" class="form-control" type="text" placeholder="${actor.name}" class="input-large" required="" value="${actor.name}">
              </div>
            </div>

            <!-- Text input-->
            <div class="control-group">
              <label class="control-label" for="userid">birthPlace:</label>
              <div class="controls">
                <input id="birthPlace" name="birthPlace" class="form-control" type="text" placeholder="${actor.birthPlace }" class="input-large" required="" value="${actor.birthPlace}">
              </div>
            </div>
             <div class="control-group">
              <label class="control-label" for="userid">biography:</label>
              <div class="controls">
                <input id="biography" name="biography" class="form-control" type="text" placeholder="${actor.biography}" class="input-large" required="  value="${actor.biography}">
              </div>
            </div>
                <input id="actorId" name="actorId" class="form-control" type="hidden" value="${actor.id}">
            <!-- Button -->
            <div class="control-group">
              <label class="control-label" for="confirmsignup"></label>
              <div class="controls">
                <input type="submit" id="confirmsignup" name="confirmsignup" class="btn btn-success" value="update">
              </div>
            </div>
            </fieldset>
            </form>
</body>