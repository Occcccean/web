<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@page import="com.dao.StudentDao"%>
<%@page import="com.model.Student"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>导师个人中心 - 学籍管理系统</title>
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
            .field-label {
                @apply font-medium text-gray-700;
            }
            .field-value {
                @apply text-gray-800 bg-gray-50 p-3 rounded-lg border border-gray-200 transition-all hover:shadow-sm;
            }
            .section-title {
                @apply text-xl font-bold text-primary mb-4 pb-2 border-b border-gray-200;
            }
            .card-shadow {
                @apply shadow-md hover:shadow-lg transition-shadow duration-300;
            }
            .student-card {
                @apply border border-gray-200 rounded-lg p-4 hover:bg-gray-50 transition-colors cursor-pointer;
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
        </div>
    </header>

    <!-- 主要内容区 -->
    <main class="container mx-auto px-4 py-8">
        <div class="max-w-6xl mx-auto">
            <div class="bg-white rounded-xl shadow-md p-6 md:p-8 animate-fade-in">
                <div class="text-center mb-8">
                    <h2 class="text-2xl md:text-3xl font-bold text-gray-800 mb-2">导师个人中心</h2>
                    <p class="text-gray-600">查看您的个人信息和指导的学生</p>
                </div>

                <!-- 信息卡片 -->
                <div class="space-y-6 animate-slide-up" style="animation-delay: 0.2s">
                    <!-- 导师个人信息 - 实际应用中应从数据库获取 -->
                    <div class="bg-blue-50 rounded-lg p-6 card-shadow">
                        <h3 class="section-title"><i class="fa fa-user-circle mr-2"></i>个人信息</h3>
                        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                            <div class="md:col-span-2">
                                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                    <div>
                                        <label class="field-label block mb-1">姓名</label>
                                        <div class="field-value">
                                            <%-- 实际应用中应从session或数据库获取导师信息 --%>
                                            <c:set var="mentorName" value="李四教授" />
                                            ${mentorName}
                                        </div>
                                    </div>
                                    <div>
                                        <label class="field-label block mb-1">学院</label>
                                        <div class="field-value">
                                            <c:set var="mentorCollege" value="计算机科学与技术学院" />
                                            ${mentorCollege}
                                        </div>
                                    </div>
                                    <div>
                                        <label class="field-label block mb-1">职称</label>
                                        <div class="field-value">
                                            <c:set var="mentorTitle" value="教授" />
                                            ${mentorTitle}
                                        </div>
                                    </div>
                                    <div>
                                        <label class="field-label block mb-1">研究方向</label>
                                        <div class="field-value">
                                            <c:set var="mentorResearch" value="人工智能与机器学习" />
                                            ${mentorResearch}
                                        </div>
                                    </div>
                                    <div>
                                        <label class="field-label block mb-1">联系方式</label>
                                        <div class="field-value">
                                            <c:set var="mentorContact" value="13900139000" />
                                            ${mentorContact}
                                        </div>
                                    </div>
                                    <div>
                                        <label class="field-label block mb-1">邮箱</label>
                                        <div class="field-value">
                                            <c:set var="mentorEmail" value="lisi@example.com" />
                                            ${mentorEmail}
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="flex items-center justify-center md:justify-end">
                                <img src="https://picsum.photos/200/200?random=10" alt="导师头像" class="w-32 h-32 rounded-full object-cover border-4 border-primary/20">
                            </div>
                        </div>
                    </div>

                    <!-- 指导的学生列表 -->
                    <div class="bg-blue-50 rounded-lg p-6 card-shadow">
                        <h3 class="section-title"><i class="fa fa-graduation-cap mr-2"></i>指导的学生</h3>

                        <%-- 获取导师ID，实际应用中应从session获取 --%>
                        <%
                            long mentorId = 1; // 假设导师ID为1
                            request.setAttribute("mentorId", mentorId);
                            StudentDao studentDao = new StudentDao();
                            ArrayList<Student> students = studentDao.getByMentorId(mentorId);
                            request.setAttribute("students", students);
                        %>

                        <c:if test="${empty students || students.size() == 0}">
                            <div class="text-center py-8 text-gray-500">
                                <i class="fa fa-info-circle text-3xl mb-3 text-primary/30"></i>
                                <p>您目前没有指导的学生</p>
                            </div>
                        </c:if>

                        <c:if test="${not empty students && students.size() > 0}">
                            <div class="space-y-4">
                                <c:forEach items="${students}" var="student" varStatus="status">
                                    <div class="student-card" onclick="window.location.href='student.jsp?id=${student.id}'">
                                        <div class="flex flex-col md:flex-row md:items-center justify-between">
                                            <div class="flex items-center mb-3 md:mb-0">
                                                <img src="https://picsum.photos/100/100?random=${status.index}" alt="学生头像" class="w-12 h-12 rounded-full object-cover mr-3">
                                                <div>
                                                    <h4 class="font-medium text-gray-800">${student.name}</h4>
                                                    <p class="text-gray-600">${student.college} | ${student.major}</p>
                                                </div>
                                            </div>
                                            <div class="text-right">
                                                <p class="text-sm text-gray-500">学号: ${student.student_id}</p>
                                                <p class="text-sm text-gray-500">${student.grade}级</p>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </main>
</body>
</html>