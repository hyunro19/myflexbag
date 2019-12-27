<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>User List Page</h1>
<c:forEach var="u" items="${ulist }">
<h3><a href="udetail.mc?id=${u.userid }">${u.userid }  ${u.uname }</a></h3>
</c:forEach>