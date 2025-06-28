<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ page import = "com.util.Utils, com.dao.MentorDao, com.dao.StudentDao, com.dao.SecretaryDao, com.model.Student"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>学院秘书管理系统 - 研究生学籍管理</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <!-- Tailwind CSS 配置 -->
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: '#2563EB',
                        secondary: '#3B82F6',
                        accent: '#10B981',
                        warning: '#F59E0B',
                        danger: '#EF4444',
                        light: '#F8FAFC',
                        dark: '#1E293B'
                    },
                    fontFamily: {
                        inter: ['Inter', 'system-ui', 'sans-serif']
                    }
                }
            }
        }
    </script>

    <style type="text/tailwindcss">
        @layer utilities {
            .content-auto {
                content-visibility: auto;
            }
            .card-shadow {
                @apply shadow-md hover:shadow-lg transition-all duration-300;
            }
            .btn-primary {
                @apply bg-primary text-white font-medium py-2 px-4 rounded-lg hover:bg-primary/90 transition-colors flex items-center;
            }
            .btn-secondary {
                @apply bg-white text-primary border border-primary font-medium py-2 px-4 rounded-lg hover:bg-primary/5 transition-colors;
            }
            .btn-accent {
                @apply bg-accent text-white font-medium py-2 px-4 rounded-lg hover:bg-accent/90 transition-colors;
            }
            .table-row-hover {
                @apply hover:bg-gray-50 transition-colors;
            }
            .animate-fade-in {
                animation: fadeIn 0.5s ease-in-out;
            }
            .animate-slide-up {
                animation: slideUp 0.5s ease-out;
            }
            @keyframes fadeIn {
                from { opacity: 0; }
                to { opacity: 1; }
            }
            @keyframes slideUp {
                from { transform: translateY(20px); opacity: 0; }
                to { transform: translateY(0); opacity: 1; }
            }
        }
    </style>
</head>
<body class="min-h-screen bg-gradient-to-br from-light to-blue-50 font-inter">
    <!-- 顶部导航 -->
    <header class="bg-white shadow-sm sticky top-0 z-50">
        <div class="container mx-auto px-4 py-3 flex justify-between items-center">
            <div class="flex items-center space-x-2">
                <i class="fa fa-university text-primary text-xl"></i>
                <h1 class="text-lg md:text-xl font-bold text-primary">研究生学籍管理系统</h1>
            </div>
            <nav>
                <ul class="flex space-x-4">
                    <li><a href="#" class="text-primary font-medium">个人中心</a></li>
                    <li><a href="#" class="text-primary font-medium border-b-2 border-primary">学籍管理</a></li>
                    <li><a href="#" class="text-gray-600 hover:text-primary transition-colors">数据统计</a></li>
                    <li><a href="#" class="text-gray-600 hover:text-primary transition-colors">退出登录</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- 主要内容区 -->
    <main class="container mx-auto px-4 py-8">
        <div class="max-w-6xl mx-auto">
            <!-- 页面标题 -->
            <div class="text-center mb-8 animate-fade-in">
                <h2 class="text-2xl md:text-3xl font-bold text-gray-800 mb-2">学院研究生学籍管理</h2>
                <p class="text-gray-600">管理本学院研究生学籍信息</p>
            </div>
            <% 
              var id = Utils.getAccount(request).getId();
              var secretary = new SecretaryDao().getByAccountId(id);
              request.setAttribute("secretary", secretary);
              pageContext.setAttribute("students", new StudentDao().getByCollege(secretary.getCollege()));
            %>
            <!-- 信息卡片 -->
            <div class="space-y-6 animate-slide-up" style="animation-delay: 0.2s">
                <!-- 秘书个人信息 -->
                <div class="bg-white rounded-xl p-6 md:p-8 card-shadow">
                    <h3 class="text-xl font-bold text-primary mb-4 pb-2 border-b border-gray-200 flex items-center">
                        <i class="fa fa-user-circle mr-2"></i>个人信息
                    </h3>
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                        <div class="md:col-span-2">
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                <div>
                                    <label class="block text-gray-700 font-medium mb-1">姓名</label>
                                    <div class="text-gray-800 bg-gray-50 p-3 rounded-lg border border-gray-200">
                                      <span id="secretaryName">${secretary.name}</span>
                                    </div>
                                </div>
                                <div>
                                    <label class="block text-gray-700 font-medium mb-1">学院</label>
                                    <div class="text-gray-800 bg-gray-50 p-3 rounded-lg border border-gray-200">
                                      <span id="secretaryCollege">${secretary.college}</span>
                                    </div>
                                </div>
                                <div>
                                    <label class="block text-gray-700 font-medium mb-1">学生数量</label>
                                    <div class="text-gray-800 bg-gray-50 p-3 rounded-lg border border-gray-200">
                                      <span id="secretaryAccountId">${students.size()}</span>
                                    </div>
                                </div>
                                <div>
                                    <label class="block text-gray-700 font-medium mb-1">联系方式</label>
                                    <div class="text-gray-800 bg-gray-50 p-3 rounded-lg border border-gray-200">
                                        <span id="secretaryContact">13800138001</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="flex items-center justify-center md:justify-end">
                            <img src="https://picsum.photos/200/200?random=10" alt="秘书头像" class="w-32 h-32 rounded-full object-cover border-4 border-primary/20">
                        </div>
                    </div>
                </div>
                <!-- 学院研究生管理 -->
                <div class="bg-white rounded-xl p-6 md:p-8 card-shadow">
                    <div class="flex flex-col md:flex-row md:items-center justify-between mb-6">
                        <h3 class="text-xl font-bold text-primary mb-4 md:mb-0 pb-2 md:pb-0 border-b md:border-b-0 md:border-r border-gray-200 md:pr-6">
                            <i class="fa fa-graduation-cap mr-2"></i>本学院研究生列表
                        </h3>
                        <div class="flex space-x-3">
                            <div class="relative">
                                <input type="text" id="studentSearch" placeholder="搜索学生..."
                                    class="pl-10 pr-4 py-2 rounded-lg border border-gray-200 focus:border-primary focus:ring-2 focus:ring-primary/20 outline-none">
                                <i class="fa fa-search absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400"></i>
                            </div>
                            <button id="refreshStudentsBtn" class="btn-secondary">
                                <i class="fa fa-refresh mr-1"></i>刷新
                            </button>
                        </div>
                    </div>
                    <!-- 学生列表 -->
                    <div class="overflow-x-auto">
                        <table class="min-w-full divide-y divide-gray-200">
                            <thead class="bg-gray-50">
                                <tr>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">学号</th>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">姓名</th>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">专业</th>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">年级</th>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">导师</th>
                                    <th scope="col" class="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">操作</th>
                                </tr>
                            </thead>
                            <tbody class="bg-white divide-y divide-gray-200" id="studentsTableBody">
                                <!-- 学生项1 -->
                                <c:forEach var="student" varStatus="status" items="${students}">
                                  <tr class="table-row-hover">
                                      <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">20230001</td>
                                      <td class="px-6 py-4 whitespace-nowrap">
                                          <div class="flex items-center">
                                              <span class="text-sm text-gray-900">${student.name}</span>
                                          </div>
                                      </td>
                                      <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${student.major}</td>
                                      <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${student.grade}</td>
                                      <% request.setAttribute("mentor", new MentorDao().getById(((Student) pageContext.getAttribute("student")).getMentor_id())); %>
                                      <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">${mentor.name}</td>
                                      <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                                          <button class="text-primary hover:text-primary/80 mr-3 view-student-btn" >
                                            <i class="fa fa-eye mr-1"></i><a href="/myapp/student/view.jsp?id=${student.id}">查看</a>
                                          </button>
                                          <button class="text-secondary hover:text-secondary/80 edit-student-btn">
                                            <i class="fa fa-pencil mr-1"></i>编辑
                                          </button>
                                      </td>
                                  </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </main>
</body>
</html>
