<%@ page import="db.RentCarDAO" %>
<%@ page import="java.util.Vector" %>
<%@ page import="db.CarListBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--DB에 연결하여 최신순 자동차 3대만 뿌려주는 데이터를 가져옴--%>
<%
  RentCarDAO rdao = new RentCarDAO();
  // 벡터를 이용하여 자동차를 저장
  Vector<CarListBean> v = rdao.getSelectCar();
%>
<table width="1100">
  <tr height="100">
    <td align="center" colspan="3">
      <font size="6" color="gray">최신형 자동차</font>
    </td>
  </tr>
  <tr height="350">
    <%
      for (int i = 0; i < v.size(); i++) {
        CarListBean bean = v.get(i);
    %>
    <td width="333" align="center">
      <a href="RentCarMain.jsp?center=CarReserveInfo.jsp?no=<%=bean.getNo()%>">
        <img src="img/<%=bean.getImg()%>" alt="" width="300" height="220">
      </a>
      <p><font size="3" color="gray"><b>차량명: <%=bean.getName()%></b></font></p>
      <p><font size="3" color="gray"><b>가격: <%=bean.getPrice()%></b></font></p>
    </td>
    <%
      }
    %>
  </tr>
  <tr align="center">
    <td colspan="3">
      <font size="4" color="gray"><b>차량 검색 하기</b></font>
    </td>
  </tr>
  <tr align="center">
    <td colspan="3">
      <form action="RentCarMain.jsp?center=CarCategoryList.jsp" method="post">
        <font size="4" color="gray"><b>차량 종류</b></font>&nbsp;&nbsp;
        <select name="category">
          <option value="1">소형</option>
          <option value="2">중형</option>
          <option value="3">대형</option>
        </select>&nbsp;&nbsp;
        <input type="submit" value="검색">
      </form>
      <button onclick="location.href='RentCarMain.jsp?center=CarAllList.jsp'">전체 검색</button>
    </td>
  </tr>
</table>
