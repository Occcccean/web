<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.service.AccountService"%>

<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>研究生学籍管理系统 - 登录</title>
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
                    },
                    animation: {
                        'fade-in': 'fadeIn 0.5s ease-in-out forwards',
                        'slide-up': 'slideUp 0.5s ease-out forwards'
                    },
                    keyframes: {
                        fadeIn: {
                            '0%': { opacity: 0 },
                            '100%': { opacity: 1 }
                        },
                        slideUp: {
                            '0%': { transform: 'translateY(20px)', opacity: 0 },
                            '100%': { transform: 'translateY(0)', opacity: 1 }
                        }
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
            .bg-glass {
                background: rgba(255, 255, 255, 0.7);
                backdrop-filter: blur(10px);
                -webkit-backdrop-filter: blur(10px);
            }
            .text-shadow {
                text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }
            .input-focus {
                transition: all 0.3s ease;
            }
            .input-focus:focus {
                transform: translateY(-2px);
                box-shadow: 0 10px 15px -3px rgba(22, 93, 255, 0.1), 0 4px 6px -2px rgba(22, 93, 255, 0.05);
            }
        }
    </style>
</head>
<body class="min-h-screen bg-gradient-to-br from-light to-white overflow-x-hidden font-inter">
    <!-- 装饰元素 -->
    <div class="fixed -top-20 -right-20 w-96 h-96 bg-primary/10 rounded-full blur-3xl animate-pulse-slow"></div>
    <div class="fixed -bottom-40 -left-20 w-80 h-80 bg-secondary/10 rounded-full blur-3xl animate-pulse-slow" style="animation-delay: 2s;"></div>

    <!-- 主内容 -->
    <div class="relative min-h-screen flex flex-col items-center justify-center px-4 py-12">
        <!-- 登录卡片 -->
        <div class="w-full max-w-md bg-glass rounded-2xl shadow-lg p-8 border border-white/30 animate-fade-in">
            <div class="text-center mb-8">
                <h2 class="text-3xl font-bold text-primary mb-2">研究生学籍管理系统</h2>
                <p class="text-gray-600">请输入账号密码登录</p>
            </div>

            <form class="space-y-6 animate-slide-up" style="animation-delay: 0.2s" method="post" action="/myapp/login">
                <!-- 用户名输入 -->
                <div>
                    <label for="username" class="block text-gray-700 font-medium mb-2">用户名</label>
                    <div class="relative">
                        <span class="absolute inset-y-0 left-0 flex items-center pl-4 text-gray-500">
                            <i class="fa fa-user"></i>
                        </span>
                        <input type="text" id="username" name="username"
                            class="w-full pl-12 pr-4 py-4 rounded-xl border border-gray-200 input-focus focus:border-primary/50 outline-none transition-all"
                            placeholder="请输入学号/工号" required>
                    </div>
                </div>

                <!-- 密码输入 -->
                <div>
                    <label for="password" class="block text-gray-700 font-medium mb-2">密码</label>
                    <div class="relative">
                        <span class="absolute inset-y-0 left-0 flex items-center pl-4 text-gray-500">
                            <i class="fa fa-lock"></i>
                        </span>
                        <input type="password" id="password" name="password"
                            class="w-full pl-12 pr-4 py-4 rounded-xl border border-gray-200 input-focus focus:border-primary/50 outline-none transition-all"
                            placeholder="请输入密码" required>
                    </div>
                </div>

                <!-- 角色选择 -->
                <div>
                    <label class="block text-gray-700 font-medium mb-2">用户类型</label>
                    <div class="grid grid-cols-3 gap-3">
                        <label class="flex items-center justify-center p-3 border border-gray-200 rounded-xl cursor-pointer hover:bg-primary/5 transition-colors">
                            <input type="radio" name="role" value="student" class="mr-2" checked>
                            <span>学生</span>
                        </label>
                        <label class="flex items-center justify-center p-3 border border-gray-200 rounded-xl cursor-pointer hover:bg-primary/5 transition-colors">
                            <input type="radio" name="role" value="teacher" class="mr-2">
                            <span>导师</span>
                        </label>
                        <label class="flex items-center justify-center p-3 border border-gray-200 rounded-xl cursor-pointer hover:bg-primary/5 transition-colors">
                            <input type="radio" name="role" value="admin" class="mr-2">
                            <span>管理员</span>
                        </label>
                    </div>
                </div>

                <!-- 登录按钮 -->
                <button type="submit"
                    class="w-full py-4 bg-primary text-white font-medium rounded-xl hover:bg-primary/90 focus:ring-4 focus:ring-primary/20 transition-all transform hover:-translate-y-1 shadow-lg shadow-primary/20">
                    <i class="fa fa-sign-in mr-2"></i> 登录系统
                </button>
            </form>

            <div class="mt-8 text-center">
                <a href="#" class="text-primary hover:text-primary/80 transition-colors inline-flex items-center">
                    <i class="fa fa-question-circle mr-1"></i> 忘记密码?
                </a>
            </div>
        </div>

        <!-- 页脚信息 -->
        <div class="absolute bottom-6 text-center text-gray-500 text-sm">
            <p>© 2025 某大学研究生院 | 技术支持：信息中心</p>
        </div>
    </div>
</body>
</html>