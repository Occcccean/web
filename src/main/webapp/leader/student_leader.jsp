<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ page import = "com.dao.StudentDao, com.dao.StudentLeaderDao, com.util.Utils"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>研究生管理系统 - 综合管理平台</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <script>
        tailwind.config = {
            theme: { extend: { colors: { primary: '#1E40AF' } } }
        }
    </script>
    <style>
        .card { box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1); }
        .table-row:hover { background-color: #f3f4f6; }
        .menu-item { transition: all 0.3s ease; }
        .menu-item:hover { transform: translateX(4px); }
    </style>
</head>

    <%
      var id = Utils.getAccount(request).getId();
      var leader = new StudentLeaderDaoDao().getByAccountId(id);
      pageContext.setAttribute("students", new StudentDao().getAll());
      pageContext.setAttribute("leader", leader);
    %>

<body class="bg-gray-50 font-sans">
    <!-- 顶部导航栏 -->
    <header class="bg-white shadow">
        <div class="container mx-auto px-4 py-3 flex justify-between items-center">
            <div class="flex items-center space-x-2">
                <i class="fa fa-university text-primary text-xl"></i>
                <h1 class="text-lg font-bold text-primary">研究生管理系统</h1>
            </div>
            <div class="flex items-center space-x-4">
                <div class="relative">
                    <button id="userMenuBtn" class="flex items-center space-x-2 focus:outline-none">
                        <i class="fa fa-user-circle text-primary text-lg"></i>
                        <span id="userName" class="font-medium">${leader.name}</span>
                        <i class="fa fa-caret-down text-gray-500"></i>
                    </button>
                    <div id="userMenu" class="hidden absolute right-0 mt-2 w-48 bg-white rounded-md shadow-lg py-1 z-10">
                        <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">个人信息</a>
                        <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">修改密码</a>
                        <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">退出登录</a>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <div class="container mx-auto px-4 py-8 flex flex-col lg:flex-row gap-6">
        <!-- 右侧内容 -->
        <div class="lg:w-4/5">
            <!-- 角色信息卡片 -->
            <div class="bg-white rounded-lg p-6 mb-6 card">
                <h3 class="text-xl font-bold text-primary mb-4 pb-2 border-b">
                    <i class="fa fa-id-card mr-2"></i>当前角色信息
                </h3>
                <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
                    <div>
                        <p class="text-gray-600">姓名</p>
                        <p class="font-medium" id="roleName">${leader.name}</p>
                    </div>
                    <div>
                        <p class="text-gray-600">角色</p>
                        <p class="font-medium" id="roleType">${account.role}</p>
                    </div>
                    <div>
                        <p class="text-gray-600">用户名</p>
                        <p class="font-medium" id="roleDept">${account.username}</p>
                    </div>
                    <div>
                        <p class="text-gray-600">最后登录</p>
                        <p class="font-medium">${account.lastPasswordChangeDate}</p>
                    </div>
                </div>
            </div>

            <!-- 学籍信息管理 -->
            <div class="bg-white rounded-lg p-6 mb-6 card">
                <div class="flex justify-between items-center mb-4">
                    <h3 class="text-xl font-bold text-primary">
                        <i class="fa fa-graduation-cap mr-2"></i>研究生学籍信息管理
                    </h3>
                    <div id="adminActions" class="hidden">
                        <button class="bg-primary text-white px-4 py-2 rounded-lg hover:bg-primary/90 transition-colors mr-2">
                            <i class="fa fa-plus mr-1"></i>新增
                        </button>
                        <button class="bg-gray-200 text-gray-800 px-4 py-2 rounded-lg hover:bg-gray-300 transition-colors">
                            <i class="fa fa-download mr-1"></i>导出
                        </button>
                    </div>
                </div>
                <div class="relative w-1/3 mb-4">
                    <input type="text" placeholder="搜索学号/姓名..." class="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary/50">
                    <i class="fa fa-search absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400"></i>
                </div>
                <div class="overflow-x-auto">
                    <table class="min-w-full divide-y divide-gray-200">
                        <thead>
                            <tr>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500">学号</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500">姓名</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500">学院</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500">专业</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500">入学年份</th>
                                <th class="px-6 py-3 text-right text-xs font-medium text-gray-500">操作</th>
                            </tr>
                        </thead>
                        <tbody>
                          <c:forEach var="student" items="${students}">
                            <tr class="table-row">
                              <td class="px-6 py-4 text-sm">${student.student_id}</td>
                              <td class="px-6 py-4 text-sm">${student.name}</td>
                              <td class="px-6 py-4 text-sm">${student.college}</td>
                              <td class="px-6 py-4 text-sm">${student.major}</td>
                              <td class="px-6 py-4 text-sm">${student.entrance_date}</td>
                                <td class="px-6 py-4 text-sm text-right">
                                    <button class="text-primary hover:text-primary/80 mr-3"><a href="/myapp/student/view.jsp?id=${student.id}">查看</a></button>
                                    <button id="editBtn2" class="text-primary hover:text-primary/80 mr-3 hidden">编辑</button>
                                    <button id="deleteBtn2" class="text-red-500 hover:text-red-600 hidden">删除</button>
                                </td>
                            </tr>
                          </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
