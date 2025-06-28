<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@page import = "com.dao.StudentDao, com.dao.MentorDao, com.model.Student" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>学生个人信息 - 学籍管理系统</title>
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
                    <li><a href="#" class="text-primary font-medium">个人信息</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- 主要内容区 -->
    <main class="container mx-auto px-4 py-8">
        <div class="max-w-4xl mx-auto">
            <div class="bg-white rounded-xl shadow-md p-6 md:p-8 animate-fade-in">
                <div class="text-center mb-8">
                    <h2 class="text-2xl md:text-3xl font-bold text-gray-800 mb-2">个人信息</h2>
                    <p class="text-gray-600">查看您的学籍信息</p>
                </div>

                <!-- 信息卡片 - 静态数据示例，实际应用中可通过JavaScript动态填充 -->
                <div class="space-y-6 animate-slide-up" style="animation-delay: 0.2s">
                    <!-- 基础信息 -->
                    <% request.setAttribute("student", new StudentDao().getById(Long.parseLong(request.getParameter("id")))); %>
                    <div class="bg-blue-50 rounded-lg p-6 card-shadow">
                        <h3 class="section-title"><i class="fa fa-user-circle mr-2"></i>基本信息</h3>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <div>
                                <label class="field-label block mb-1">学号</label>
                                <div class="field-value student-field" >${student.student_id}</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">姓名</label>
                                <div class="field-value student-field" >${student.name}</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">性别</label>
                                <div class="field-value student-field" >${student.gender}</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">民族</label>
                                <div class="field-value student-field" >${student.nation}</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">出生日期</label>
                                <div class="field-value student-field" >${student.birth_date}</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">身份证号</label>
                                <div class="field-value student-field" >${student.id_number}</div>
                            </div>
                        </div>
                    </div>

                    <!-- 学籍信息 -->
                    <div class="bg-blue-50 rounded-lg p-6 card-shadow">
                        <h3 class="section-title"><i class="fa fa-graduation-cap mr-2"></i>学籍信息</h3>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <div>
                                <label class="field-label block mb-1">学院</label>
                                <div class="field-value student-field" >${student.college}</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">专业</label>
                                <div class="field-value student-field" >${student.major}</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">年级</label>
                                <div class="field-value student-field" >${student.grade}</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">导师</label>
                                <% pageContext.setAttribute("mentor", new MentorDao().getById(((Student) request.getAttribute("student")).getId())); %>
                                <div class="field-value student-field" >${mentor.name}</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">入学日期</label>
                                <div class="field-value student-field" >${student.entrance_date}</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">班级</label>
                                <div class="field-value student-field" >${student.class_id}</div>
                            </div>
                        </div>
                    </div>

                    <!-- 联系方式 -->
                    <div class="bg-blue-50 rounded-lg p-6 card-shadow">
                        <h3 class="section-title"><i class="fa fa-phone mr-2"></i>联系方式</h3>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <div>
                                <label class="field-label block mb-1">手机号</label>
                                <div class="field-value student-field" >${student.phone_number}</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">邮箱</label>
                                <div class="field-value student-field" >${student.email}</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">微信</label>
                                <div class="field-value student-field" >${student.wechat}</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">家庭地址</label>
                                <div class="field-value student-field" >${student.home_address}</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</body>
</html>
