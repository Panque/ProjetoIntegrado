<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="application/xml" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<data>
	<c:forEach items="${results}" var="result">
		<tr>
			<td>${result.getGenero()}</td>
			<td><c:out value="${result.getQuantidade()}"/></td>
		</tr>
	</c:forEach>
</data>