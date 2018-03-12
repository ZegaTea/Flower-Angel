<%@page import="dao.CategoryDao"%>
<%@page import="model.Category"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page import="util.Constants" %>

<%
    request.setAttribute("ctxPath", request.getContextPath());
    request.setAttribute("ctxImage", request.getContextPath() + "/resources/client/product_image");

%>

<%--<c:set var="ctxPath" value="${pageContext.request.contextPath}" />--%>




