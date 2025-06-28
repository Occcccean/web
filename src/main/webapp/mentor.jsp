<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ page import = "com.util.Utils, com.dao.MentorDao, com.dao.StudentDao" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>导师个人中心 - 研究生学籍管理系统</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <!-- Tailwind CSS 配置 -->
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: '#165DFF',
                        secondary: '#36BFFA',
                        light: '#E8F3FF',
                        dark: '#0D2B93'
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
                @apply shadow-md hover:shadow-lg transition-shadow duration-300;
            }
            .btn-primary {
                @apply bg-primary text-white font-medium py-2 px-4 rounded-lg hover:bg-primary/90 transition-colors;
            }
            .btn-secondary {
                @apply bg-white text-primary border border-primary font-medium py-2 px-4 rounded-lg hover:bg-primary/5 transition-colors;
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
<body class="min-h-screen bg-gradient-to-br from-light to-white font-inter">
    <!-- 顶部导航 -->
    <header class="bg-white shadow-sm sticky top-0 z-50">
        <div class="container mx-auto px-4 py-3 flex justify-between items-center">
            <div class="flex items-center space-x-2">
                <i class="fa fa-graduation-cap text-primary text-xl"></i>
                <h1 class="text-lg md:text-xl font-bold text-primary">研究生学籍管理系统</h1>
            </div>
            <nav>
                <ul class="flex space-x-4">
                    <li><a href="#" class="text-primary font-medium">个人中心</a></li>
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
                <h2 class="text-2xl md:text-3xl font-bold text-gray-800 mb-2">导师个人中心</h2>
                <p class="text-gray-600">查看个人信息和指导的学生</p>
            </div>

            <!-- 信息卡片 -->
            <div class="space-y-6 animate-slide-up" style="animation-delay: 0.2s">
                <!-- 导师个人信息 -->
                <div class="bg-white rounded-xl p-6 md:p-8 card-shadow">
                    <h3 class="text-xl font-bold text-primary mb-4 pb-2 border-b border-gray-200 flex items-center">
                        <i class="fa fa-user-circle mr-2"></i>个人信息
                    </h3>
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                        <div class="md:col-span-2">
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                              <% 
                                var id = Utils.getAccount(request).getId();
                                var mentor = new MentorDao().getByAccountId(id);
                                request.setAttribute("mentor", mentor);
                                pageContext.setAttribute("students", new StudentDao().getByMentorId(mentor.getId()));
                              %>
                                <div>
                                    <label class="block text-gray-700 font-medium mb-1">姓名</label>
                                    <div class="text-gray-800 bg-gray-50 p-3 rounded-lg border border-gray-200">
                                      <span id="mentorName">${mentor.name}</span>
                                    </div>
                                </div>
                                <div>
                                    <label class="block text-gray-700 font-medium mb-1">学院</label>
                                    <div class="text-gray-800 bg-gray-50 p-3 rounded-lg border border-gray-200">
                                      <span id="mentorCollege">${mentor.college}</span>
                                    </div>
                                </div>
                                <div>
                                    <label class="block text-gray-700 font-medium mb-1">账号ID</label>
                                    <div class="text-gray-800 bg-gray-50 p-3 rounded-lg border border-gray-200">
                                      <span id="mentorAccountId">${mentor.account_id}</span>
                                    </div>
                                </div>
                                <div>
                                    <label class="block text-gray-700 font-medium mb-1">用户名</label>
                                    <div class="text-gray-800 bg-gray-50 p-3 rounded-lg border border-gray-200">
                                      <span id="mentorContact">${account.username}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="flex items-center justify-center md:justify-end">
                            <img src="https://picsum.photos/200/200" alt="导师头像" class="w-32 h-32 rounded-full object-cover border-4 border-primary/20">
                        </div>
                    </div>
                </div>

                <!-- 学生列表 -->
                <div class="bg-white rounded-xl p-6 md:p-8 card-shadow">
                    <div class="flex flex-col md:flex-row md:items-center justify-between mb-6">
                        <h3 class="text-xl font-bold text-primary mb-4 md:mb-0 pb-2 md:pb-0 border-b md:border-b-0 md:border-r border-gray-200 md:pr-6">
                            <i class="fa fa-graduation-cap mr-2"></i>指导的学生
                        </h3>
                    </div>

                    <!-- 学生列表卡片 -->
                    <c:if test="${}">
                    <div id="studentsList" class="space-y-4 hidden">
                        <!-- 学生项1 -->
                        <c:forEach var="student" items="students">
                          <div class="border border-gray-200 rounded-lg p-4 hover:bg-gray-50 transition-colors">
                              <div class="flex flex-col md:flex-row md:items-center justify-between">
                                  <div class="flex items-center mb-3 md:mb-0">
                                      <img src="https://picsum.photos/100/100?random=1" alt="学生头像" class="w-12 h-12 rounded-full object-cover mr-3">
                                      <div>
                                        <h4 class="font-medium text-gray-800" id="student1Name">${student.name}</h4>
                                        <p class="text-gray-600" id="student1Info">${student.college} | ${student.major}</p>
                                      </div>
                                  </div>
                                  <button class="btn-secondary view-student-btn" data-student-id="1">
                                      <i class="fa fa-info-circle mr-1"></i>查看详情
                                  </button>
                              </div>
                          </div>
                        <c:forEach>
                    </div>
                    </c:if>
                    <c:else>
                    <!-- 暂无学生提示 -->
                    <div id="noStudentsTip" class="text-center py-8 text-gray-500 hidden">
                        <i class="fa fa-info-circle text-3xl mb-3 text-primary/30"></i>
                        <p>您目前没有指导的学生</p>
                    </div>
                    </c:else>
                </div>
            </div>
        </div>
    </main>
</body>
</html>
