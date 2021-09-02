<%@ page import="db.RentCarDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  request.setCharacterEncoding("utf-8");

  String id = request.getParameter("id");
  String pwd = request.getParameter("password");
  // 회원 아이디와 패스워드가 일치하는지 비교
  RentCarDAO rdao = new RentCarDAO();

  // 해당 회원이 있는지 여부를 숫자로 표현
  int result = rdao.getMember(id, pwd);

  if (result == 0) {
%>
<script !src="">
  alert("회원 아이디 또는 패스워드가 틀립니다.");
  location.href = "RentCarMain.jsp?center=MemberLogin.jsp"
</script>
<%
  } else {
      // 로그인 처리가 되었다면
    session.setAttribute("id", id);
    response.sendRedirect("RentCarMain.jsp");
  }
%>