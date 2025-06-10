<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.dao.StudentDao" %>
<%! StudentDao dao = new StudentDao(); %>
<table>
  <tr>
    <th>ID</th>
    <th>学号</th>
    <th>姓名</th>
    <th>性别</th>
    <th>学院</th>
    <th>专业</th>
    <th>国籍</th>
  </tr>
  <% for (var student : dao.getAll()){  %>
    <tr>
      <td><%= student.getId() %></td>
      <td><%= student.getStudent_id() %></td>
      <td><%= student.getName() %></td>
      <td><%= student.getGender() %></td>
      <td><%= student.getCollege() %></td>
      <td><%= student.getMajor() %></td>
      <td><%= student.getCountry() %></td>
    </tr>
  <% } %>
</table>
