<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" flush="true" />
<%@ page import="java.io.*,java.util.*" %>
<% 
	String result = (String)request.getAttribute("statue");
	if(result.equals("success")){
		%>
		<script type="text/javascript">
			alert("udapte success");
			window.location.href="actroControll.jsp";
		</script>
		<% 
		
	}else{
		%>
		<script type="text/javascript">
			alert("udapte error");
			window.location.href="actroControll.jsp";
		</script>
		<% 
	}
%>
