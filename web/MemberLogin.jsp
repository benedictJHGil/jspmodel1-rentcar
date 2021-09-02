<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form action="MemberLoginProc.jsp">
  <table width="300" border="1" bordercolor="#a52a2a">
    <tr height="100">
      <td align="center" colspan="2">
        <font size="6" color="gray">로그인</font>
      </td>
    </tr>
    <tr height="40">
      <td width="120" align="center">아이디</td>
      <td width="180"><input type="text" name="id" size="15"></td>
    </tr>
    <tr height="40">
      <td width="120" align="center">패스워드</td>
      <td width="180"><input type="password" name="password" size="15"></td>
    </tr>
    <tr height="40">
      <td align="center" colspan="2"><input type="submit" value="로그인"></td>
    </tr>
  </table>
</form>