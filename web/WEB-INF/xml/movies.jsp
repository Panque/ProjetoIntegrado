<?xml version="1.0" encoding="UTF-8"?>
<%@page contentType="application/xml" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<data>
	<movies>
		<c:forEach items="${movies}" var="movie">
			<tr>
				<td class="hidden-xs">${movie.getId()}</td>
				<td><c:out value="${movie.getTitle()}"/></td>
				<td><c:out value="${movie.getYear()}"/></td>
			</tr>
		</c:forEach>
	</movies>
	<qtdPg>
		${qtdPg}
	</qtdPg>
</data>