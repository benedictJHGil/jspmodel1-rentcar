<%@ page import="db.RentCarDAO" %>
<%@ page import="db.CarListBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <%
    int no = Integer.parseInt(request.getParameter("no"));
    // DB에 접근
    RentCarDAO rdao = new RentCarDAO();
    // 렌트카 하나에 대한 정보를 얻어옴
    CarListBean bean = rdao.getOneCar(no);

    int category = bean.getCategory();
    String temp = "";
    if(category == 1) temp = "소형";
    else if(category == 2) temp = "중형";
    else if(category == 3) temp = "대형";
  %>
    <form action="RentCarMain.jsp?center=CarOptionSelect.jsp" method="post">
    <table width="1100">
      <tr height="120">
        <td align="center" colspan="3">
          <font size="6" color="gray"><%=bean.getName()%> 차량 선택</font>
        </td>
      </tr>
      <tr>
        <td rowspan="5" height="300" align="center">
          <img src="img/<%=bean.getImg()%>" alt="" width="450">
        </td>
        <td width="250" align="center">차량이름</td>
        <td width="250" align="center"><%=bean.getName()%></td>
      </tr>
      <tr>
        <td width="250" align="center">차량분류</td>
        <td width="250" align="center"><%=temp%></td>
      </tr>
      <tr>
        <td width="250" align="center">대여가격</td>
        <td width="250" align="center"><%=bean.getPrice()%></td>
      </tr>
      <tr>
        <td width="250" align="center">제조회사</td>
        <td width="250" align="center"><%=bean.getCompany()%></td>
      </tr>
      <tr>
        <td align="center" colspan="2">
          <input type="hidden" name="no" value="<%=bean.getNo()%>">
          <input type="hidden" name="img" value="<%=bean.getImg()%>">
          <input type="submit" value="옵션 선택하기">
        </td>
      </tr>
      <tr height="120">
        <td align="center" colspan="3">
          <font size="6" color="gray">차량 정보 보기</font>
          <p><%=bean.getInfo()%></p>
        </td>
      </tr>
    </table>
    </form>