<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>User Detail Page</h1>
    ID: ${duser.userid }<br>
    PWD: ${duser.pwd }<br>
    NAME: ${duser.uname }<br>
    <a href="udel.mc?id=${duser.userid }">DELETE</a>
    <a href="uupdate.mc?id=${duser.userid }">UPDATE</a>