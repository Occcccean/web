<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>个人信息 - 研究生学籍管理系统</title>
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
                @apply text-gray-800 bg-gray-50 p-2 rounded-lg border border-gray-200;
            }
            .section-title {
                @apply text-xl font-bold text-primary mb-4 pb-2 border-b border-gray-200;
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
                    <li><a href="#" class="text-gray-600 hover:text-primary transition-colors">课程信息</a></li>
                    <li><a href="#" class="text-gray-600 hover:text-primary transition-colors">成绩查询</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- 主要内容区 -->
    <main class="container mx-auto px-4 py-8">
        <div class="max-w-4xl mx-auto">
            <div class="bg-white rounded-xl shadow-md p-6 md:p-8">
                <div class="text-center mb-8">
                    <h2 class="text-2xl md:text-3xl font-bold text-gray-800 mb-2">个人信息</h2>
                    <p class="text-gray-600">查看您的学籍信息（只读）</p>
                </div>

                <!-- 信息卡片 -->
                <div class="space-y-6">
                    <!-- 基础信息 -->
                    <div class="bg-blue-50 rounded-lg p-6">
                        <h3 class="section-title"><i class="fa fa-user-circle mr-2"></i>基本信息</h3>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <div>
                                <label class="field-label block mb-1">学号</label>
                                <div class="field-value">${student.student_id}</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">姓名</label>
                                <div class="field-value">${student.name}</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">性别</label>
                                <div class="field-value">${student.gender}</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">民族</label>
                                <div class="field-value">${student.nation}</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">出生日期</label>
                                <div class="field-value">${student.birth_date}</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">出生地</label>
                                <div class="field-value">${student.birth_place}</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">身份证号</label>
                                <div class="field-value">${student.id_number}</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">国籍</label>
                                <div class="field-value">${student.country}</div>
                            </div>
                        </div>
                    </div>

                    <!-- 学籍信息 -->
                    <div class="bg-blue-50 rounded-lg p-6">
                        <h3 class="section-title"><i class="fa fa-graduation-cap mr-2"></i>学籍信息</h3>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <div>
                                <label class="field-label block mb-1">学院</label>
                                <div class="field-value">${student.college}</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">专业</label>
                                <div class="field-value">${student.major}</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">年级</label>
                                <div class="field-value">${student.grade}</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">校区</label>
                                <div class="field-value">${student.campus}</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">班级</label>
                                <div class="field-value">${student.class_id}</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">入学日期</label>
                                <div class="field-value">${student.entrance_date}</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">导师</label>
                                <div class="field-value">${student.mentor}</div>
                            </div>
                        </div>
                    </div>

                    <!-- 联系方式 -->
                    <div class="bg-blue-50 rounded-lg p-6">
                        <h3 class="section-title"><i class="fa fa-phone mr-2"></i>联系方式</h3>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <div>
                                <label class="field-label block mb-1">手机号</label>
                                <div class="field-value">${student.phone_number}</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">邮箱</label>
                                <div class="field-value">${student.email}</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">微信</label>
                                <div class="field-value">${student.wechat}</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">QQ</label>
                                <div class="field-value">${student.qq}</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">家庭地址</label>
                                <div class="field-value">${student.home_address}</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">家庭电话</label>
                                <div class="field-value">${student.home_phone_number}</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">家庭联系人</label>
                                <div class="field-value">${student.home_contact_man}</div>
                            </div>
                        </div>
                    </div>

                    <!-- 操作按钮 -->
                    <div class="flex justify-center mt-8">
                        <button onclick="window.print()" class="px-6 py-3 bg-primary text-white font-medium rounded-lg hover:bg-primary/90 focus:ring-4 focus:ring-primary/20 transition-all flex items-center">
                            <i class="fa fa-print mr-2"></i> 打印信息
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- 页脚 -->
    <footer class="bg-gray-50 py-4 mt-8">
        <div class="container mx-auto px-4 text-center text-gray-500 text-sm">
            <p>© 2025 某大学研究生院 | 技术支持：信息中心</p>
        </div>
    </footer>

    <script>
        // 页面加载后格式化日期
        document.addEventListener('DOMContentLoaded', function() {
            // 日期格式化函数
            function formatDate(dateString) {
                if (!dateString) return '';
                const date = new Date(dateString);
                return date.toLocaleDateString('zh-CN');
            }

            // 格式化出生日期和入学日期
            const birthDateElement = document.querySelector('.field-value:contains("${student.birth_date}")');
            const entranceDateElement = document.querySelector('.field-value:contains("${student.entrance_date}")');

            if (birthDateElement && birthDateElement.textContent.trim() !== '${student.birth_date}') {
                birthDateElement.textContent = formatDate(birthDateElement.textContent);
            }

            if (entranceDateElement && entranceDateElement.textContent.trim() !== '${student.entrance_date}') {
                entranceDateElement.textContent = formatDate(entranceDateElement.textContent);
            }
        });
    </script>
</body>
</html>