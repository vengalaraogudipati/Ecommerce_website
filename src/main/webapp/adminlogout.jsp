<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    // Get current session
    session = request.getSession(false);

    // If session exists, invalidate it
    if (session != null) {
        session.invalidate();
    }

    // Redirect to login page
    response.sendRedirect("adminlogin.jsp");
%>
