<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.movie.form.User, com.movie.form.Review" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
           
                <li>
                  <c:choose>
                      <c:when test="${session.isNew()}">
                          ${user.email} | Log Out
                          <br />
                      </c:when>
                      <c:otherwise>
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
<script type="text/javascript">
function editOrg(id){
	window.location.href="reviewUpdatePre.do?reviewId="+id;
}
function delOrg(id){
	$.ajax({
        url: "deleteReview.do",
        data: {
        	reviewId: id,
        },
        success: function (json) {
            var data = json.statue;
            if(data=="success"){
            	alert("delete success");
    			window.location.href="reviewControll.jsp";
            }else{
            	alert("delete fail");
    			window.location.href="reviewControll.jsp";
            }
        }
    })
}
function setCenterListData(){
	$.ajax({
        url: "allReviewPaging.do",
        data: {
            page: 1,
            pageSize: 20
        },
        success: function (json) {
            var data = json.info2;
            //console.log(JSON.stringify(data))
            var centerData = "<tr id='alldata_id'><th scope='col'>num</th><th scope='col'>title</th><th scope='col'>content</th><th scope='col'>date</th>"
                + "<th scope='col'>operate</th></tr>";
            for (var i = 0; i < data.length; i++) {
                centerData += "<tr id='org-item-" + data[i].id + "'><td>" + (i + 1) + "</td><td>" + data[i].title + "</td><td>" + data[i].content + "</td><td>" + new Date(data[i].dateWritten) + "</td>"
                    + "<td><a href='javascript:void(0);' onclick='editOrg(" + data[i].id + ")'>update</a> <a href='javascript:void(0);' onclick='delOrg(" + data[i].id + ")'>delete</a></td></tr>"
            }
            $(".centerData").html(centerData);
            document.getElementById("currentpage").value = json.currentpage;
            document.getElementById("totalpage").value = json.totalpage;
            currentpage = parseInt($("#currentpage").val());
            totalpage = parseInt($("#totalpage").val());
            initPage(currentpage, totalpage);
        }
    })
}
function topage(page) {
	$.ajax({
        type: "get",
        url: "allReviewPaging.do?page=" + page + "&pageSize=20",
        success: function (json) {
            var data = json.info2;
            var centerData = "<tr id='alldata_id'><th scope='col'>num</th><th scope='col'>title</th><th scope='col'>content</th><th scope='col'>date</th>"
                + "<th scope='col'>operate</th></tr>";
            for (var i = 0; i < data.length; i++) {
                centerData += "<tr id='org-item-" + data[i].id + "'><td>" + (i + 1) + "</td><td>" + data[i].title + "</td><td>" + data[i].content + "</td><td>" + new Date(data[i].dateWritten) + "</td>"
                    + "<td><a href='javascript:void(0);' onclick='editOrg(" + data[i].id + ")'>update</a> <a href='javascript:void(0);' onclick='delOrg(" + data[i].id + ")'>delete</a></td></tr>"
            }
            $(".centerData").html(centerData);
            document.getElementById("currentpage").value = json.currentpage;
            document.getElementById("totalpage").value = json.totalpage;
            currentpage = parseInt($("#currentpage").val());
            totalpage = parseInt($("#totalpage").val());
            initPage(currentpage, totalpage);
        }
    });
}
$(document).ready(function()
		{
	setCenterListData()
		});

</script>
				<h2><span id="listaddress">Movie</span><span id="listTitle">List</span><span ></span></h2>
					<table  border="1" cellspacing="1" cellpadding="0" class="bdata-infoitem-table centerData noheight">
						<tr id="alldata_id">
							<!--class="levelth" -->
							<th scope="col">title</th>
							<th scope="col">content</th>
							<th scope="col">date</th>
							<th scope="col"></th>
							<th scope="col">operate</th>
						</tr>
					</table>
					 <div class="mainlist_page"></div>
			<input type="hidden" id="currentpage" />
	<input type="hidden" id="totalpage" />


<p>
   Todays date is: <%= (new java.util.Date()).toLocaleString()%>
</p>

<jsp:include page="footer.jsp" flush="true" />
