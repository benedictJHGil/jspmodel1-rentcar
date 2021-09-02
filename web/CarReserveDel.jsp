<%@ page import="db.RentCarDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String id = request.getParameter("id");
  String rentalDate = request.getParameter("rentaldate");

  RentCarDAO rdao = new RentCarDAO();

  // 예약 삭제 메소드 호출
  rdao.carRemoveReserve(id, rentalDate);

  response.sendRedirect("RentCarMain.jsp?center=CarReserveView.jsp");
%>