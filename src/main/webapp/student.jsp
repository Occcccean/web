<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.model.Account"%>
<%@page import="com.dao.StudentDao"%>
<%@page import="com.model.Student"%>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>学生个人信息 - 研究生学籍管理系统</title>
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
                    <li><a href="/logout" class="text-gray-600 hover:text-primary transition-colors">退出登录</a></li>
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

                <%
                // 验证登录状态（从sessionStorage获取前端传递的角色信息）
                String role = request.getParameter("role");
                if (role == null || !"student".equals(role)) {
                    // 非学生角色或未传递角色信息，重定向到登录页
                    response.sendRedirect("login.jsp");
                    return;
                }

                // 从Login Servlet返回的结果中获取账户信息（示例：假设通过session传递）
                Account account = (Account) request.getAttribute("account");
                if (account == null) {
                    // 未获取到账户信息，重定向到登录页
                    response.sendRedirect("login.jsp");
                    return;
                }

                // 根据账户ID获取学生信息
                StudentDao studentDao = new StudentDao();
                Student student = studentDao.getByAccountId(account.getId());
                %>

                <% if (student != null) { %>
                <!-- 信息卡片 -->
                <div class="space-y-6">
                    <!-- 基础信息 -->
                    <div class="bg-blue-50 rounded-lg p-6">
                        <h3 class="section-title"><i class="fa fa-user-circle mr-2"></i>基本信息</h3>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <div>
                                <label class="field-label block mb-1">学号</label>
                                <div class="field-value"><%= student.getStudent_id() %></div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">姓名</label>
                                <div class="field-value"><%= student.getName() %></div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">性别</label>
                                <div class="field-value"><%= student.getGender() %></div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">民族</label>
                                <div class="field-value"><%= student.getNation() %></div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">出生日期</label>
                                <div class="field-value"><%= student.getBirth_date() != null ? student.getBirth_date() : "未填写" %></div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">身份证号</label>
                                <div class="field-value"><%= student.getId_number() %></div>
                            </div>
                        </div>
                    </div>

                    <!-- 学籍信息 -->
                    <div class="bg-blue-50 rounded-lg p-6">
                        <h3 class="section-title"><i class="fa fa-graduation-cap mr-2"></i>学籍信息</h3>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <div>
                                <label class="field-label block mb-1">学院</label>
                                <div class="field-value"><%= student.getCollege() %></div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">专业</label>
                                <div class="field-value"><%= student.getMajor() %></div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">年级</label>
                                <div class="field-value"><%= student.getGrade() %></div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">导师</label>
                                <div class="field-value"><%= student.getMentor() %></div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">入学日期</label>
                                <div class="field-value"><%= student.getEntrance_date() != null ? student.getEntrance_date() : "未填写" %></div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">班级</label>
                                <div class="field-value"><%= student.getClass_id() %></div>
                            </div>
                        </div>
                    </div>

                    <!-- 联系方式 -->
                    <div class="bg-blue-50 rounded-lg p-6">
                        <h3 class="section-title"><i class="fa fa-phone mr-2"></i>联系方式</h3>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <div>
                                <label class="field-label block mb-1">手机号</label>
                                <div class="field-value"><%= student.getPhone_number() %></div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">邮箱</label>
                                <div class="field-value"><%= student.getEmail() != null ? student.getEmail() : "未填写" %></div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">微信</label>
                                <div class="field-value"><%= student.getWechat() != null ? student.getWechat() : "未填写" %></div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">家庭地址</label>
                                <div class="field-value"><%= student.getHome_address() != null ? student.getHome_address() : "未填写" %></div>
                            </div>
                        </div>
                    </div>
                </div>
                <% } else { %>
                <div class="bg-red-50 border border-red-200 text-red-700 px-4 py-3 rounded-lg mb-6">
                    <div class="flex items-center">
                        <i class="fa fa-exclamation-circle mr-2"></i>
                        <span>获取个人信息失败，请联系管理员</span>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
    </main>

    <!-- 页脚 -->
    <footer class="bg-gray-50 py-4 mt-8">
        <div class="container mx-auto px-4 text-center text-gray-500 text-sm">
            <p>© 2025 某大学研究生院 | 技术支持：信息中心</p>
        </div>
    </footer>
</body>
</html>