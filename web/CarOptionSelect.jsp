<%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <%
    int no = Integer.parseInt(request.getParameter("no"));
    // 이미지
    String img = request.getParameter("img");
  %>
    <form action="RentCarMain.jsp?center=CarReserveResult.jsp" method="post">
      <table width="1100">
        <tr height="120">
          <td align="center" colspan="3">
            <font size="6" color="gray">옵션 선택</font>
          </td>
        </tr>
        <tr>
          <td rowspan="8" height="300" align="center">
            <img src="img/<%=img%>" alt="" width="450">
          </td>
          <td width="250" align="center">차량수량</td>
          <td width="250" align="center"><input type="text" size="2" name="qty" value="1"/> 개</td>
        </tr>
        <tr>
          <td width="250" align="center">대여기간</td>
          <td width="250" align="center">
            <input type="text" size="2" name="lendingday" value="1"/>
            <select name="lendingperiod">
              <option value="1">일</option>
              <option value="2">주</option>
              <option value="3">개월</option>
            </select>
          </td>
        </tr>
        <tr>
          <td width="250" align="center">대여일</td>
          <td width="250" align="center"><input type="date" name="rentaldate" size="8" /></td>
        </tr>
        <tr>
          <td width="250" align="center">보험적용</td>
          <td width="250" align="center">
            <select name="insurance">
              <option value="1">비적용</option>
              <option value="2">적용 (1일 1만원)</option>
            </select>
          </td>
        </tr>
        <tr>
          <td width="250" align="center">무선 WIFI</td>
          <td width="250" align="center">
            <select name="wifi">
              <option value="1">비적용</option>
              <option value="2">적용 (1일 1만원)</option>
            </select>
          </td>
        </tr>
        <tr>
          <td width="250" align="center">네비게이션</td>
          <td width="250" align="center">
            <select name="navigation">
              <option value="1">적용 (무료)</option>
              <option value="2">비적용</option>
            </select>
          </td>
        </tr>
        <tr>
          <td width="250" align="center">베이비시트</td>
          <td width="250" align="center">
            <select name="babysheet">
              <option value="1">비적용</option>
              <option value="2">적용 (1일 1만원)</option>
            </select>
          </td>
        </tr>
        <tr>
          <td align="center" colspan="2">
            <input type="hidden" name="no" value="<%=no%>">
            <input type="submit" value="차량예약하기">
          </td>
        </tr>
        <tr height="120">
          <td align="center" colspan="3"></td>
        </tr>
      </table>
    </form>