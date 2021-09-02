<%@ page import="db.CarListBean" %>
<%@ page import="db.RentCarDAO" %>
<%@ page import="java.util.Vector" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <table width="1100">
    <tr height="100">
      <td align="center" colspan="3">
        <font size="6" color="gray">전체 렌트카 보기</font>
      </td>
    </tr>
      <%
        RentCarDAO rdao = new RentCarDAO();
        Vector<CarListBean> v = rdao.getAllCar();

        // tr을 3개씩 보여주고 다시 tr을 실행할 수 있도록 하는 변수 선언
        int j = 0;
        for (int i = 0; i < v.size(); i++) {
          //벡터에 저장되어있는 빈클래스 추출
          CarListBean bean = v.get(i);
          if (j % 3 == 0) {
        %>
    <tr height="350">
      <%
        }
      %>
      <td width="333" align="center">
        <a href="RentCarMain.jsp?center=CarReserveInfo.jsp?no=<%=bean.getNo()%>">
          <img src="img/<%=bean.getImg()%>" alt="" width="300" height="200">
        </a>
        <p><font size="3" color="gray"><b>차량명: <%=bean.getName()%></b></font></p>
        <p><font size="3" color="gray"><b>가격: <%=bean.getPrice()%></b></font></p>
      </td>
      <%
          j = j + 1; // j값을 증가하여 하나의 행에 총 3개의 차량정보를 보여주기 위해서 증가
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