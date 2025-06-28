<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改密码 - 学籍管理系统</title>
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
                        dark: '#0D2B93',
                        success: '#10B981',
                        danger: '#EF4444',
                        warning: '#F59E0B'
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
            .form-input {
                @apply w-full px-4 py-2 rounded-lg border border-gray-300 focus:outline-none focus:ring-2 focus:ring-primary/50 transition-all;
            }
            .form-label {
                @apply block text-gray-700 font-medium mb-1;
            }
            .form-error {
                @apply text-danger text-sm mt-1;
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
<form action="/user/password" method="post">
    <!-- 顶部导航 -->
    <header class="bg-white shadow-sm sticky top-0 z-50">
        <div class="container mx-auto px-4 py-3 flex justify-between items-center">
            <div class="flex items-center space-x-2">
                <i class="fa fa-graduation-cap text-primary text-xl"></i>
                <h1 class="text-lg md:text-xl font-bold text-primary">研究生学籍管理系统</h1>
            </div>
            <nav>
                <ul class="flex space-x-4">
                    <li><a href="#" class="text-gray-600 hover:text-primary">个人信息</a></li>
                    <li><a href="#" class="text-primary font-medium">修改密码</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- 主要内容区 -->
    <main class="container mx-auto px-4 py-8">
        <div class="max-w-md mx-auto">
            <div class="bg-white rounded-xl shadow-md p-6 md:p-8 animate-fade-in">
                <div class="text-center mb-8">
                    <h2 class="text-2xl font-bold text-gray-800 mb-2">修改密码</h2>
                    <p class="text-gray-600">设置您的账户新密码</p>
                </div>

                <!-- 密码修改表单 -->
                <div class="animate-slide-up" style="animation-delay: 0.2s">
                    <form id="changePasswordForm" method="post" action="${pageContext.request.contextPath}/account/password">
                        <!-- 从Session获取用户ID并作为隐藏字段 -->
                        <input type="hidden" id="userId" name="id" value="${sessionScope.account.id}">

                        <div class="space-y-6">
                            <!-- 原密码 -->
                            <div>
                                <label for="oldPassword" class="form-label">原密码</label>
                                <input type="password" id="oldPassword" class="form-input" placeholder="请输入原密码">
                                <div id="oldPasswordError" class="form-error hidden"></div>
                            </div>

                            <!-- 新密码 -->
                            <div>
                                <label for="newPassword" class="form-label">新密码</label>
                                <input type="password" id="newPassword" class="form-input" placeholder="请输入新密码">
                                <div id="newPasswordError" class="form-error hidden"></div>
                                <div class="mt-2 text-xs text-gray-500">
                                    <i class="fa fa-info-circle mr-1"></i>密码长度至少8位，包含字母和数字
                                </div>
                            </div>

                            <!-- 确认新密码 -->
                            <div>
                                <label for="confirmPassword" class="form-label">确认新密码</label>
                                <input type="password" id="confirmPassword" class="form-input" placeholder="请再次输入新密码">
                                <div id="confirmPasswordError" class="form-error hidden"></div>
                            </div>

                            <!-- 提交按钮 -->
                            <div class="pt-4">
                                <button type="button" id="submitBtn" class="w-full bg-primary text-white py-3 px-6 rounded-lg font-medium hover:bg-primary/90 transition-colors flex items-center justify-center">
                                    <i class="fa fa-check-circle mr-2"></i>
                                    确认修改
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>

    <!-- 成功提示模态框 -->
    <div id="successModal" class="fixed inset-0 flex items-center justify-center z-50 hidden">
        <div class="absolute inset-0 bg-black/50 backdrop-blur-sm"></div>
        <div class="bg-white rounded-lg p-6 max-w-md w-full mx-4 relative z-10 animate-fade-in">
            <div class="text-center">
                <div class="w-16 h-16 bg-success/20 rounded-full flex items-center justify-center mx-auto mb-4">
                    <i class="fa fa-check text-success text-2xl"></i>
                </div>
                <h3 class="text-xl font-bold text-gray-800 mb-2">密码修改成功</h3>
                <p class="text-gray-600 mb-6">您的密码已成功更新，请使用新密码登录。</p>
                <button id="closeSuccessModal" class="bg-primary text-white py-2 px-6 rounded-lg hover:bg-primary/90 transition-colors">
                    确定
                </button>
            </div>
        </div>
    </div>

    <!-- 错误提示模态框 -->
    <div id="errorModal" class="fixed inset-0 flex items-center justify-center z-50 hidden">
        <div class="absolute inset-0 bg-black/50 backdrop-blur-sm"></div>
        <div class="bg-white rounded-lg p-6 max-w-md w-full mx-4 relative z-10 animate-fade-in">
            <div class="text-center">
                <div class="w-16 h-16 bg-danger/20 rounded-full flex items-center justify-center mx-auto mb-4">
                    <i class="fa fa-times text-danger text-2xl"></i>
                </div>
                <h3 class="text-xl font-bold text-gray-800 mb-2">修改失败</h3>
                <p id="errorMessage" class="text-gray-600 mb-6">原密码不正确，请重新输入。</p>
                <button id="closeErrorModal" class="bg-primary text-white py-2 px-6 rounded-lg hover:bg-primary/90 transition-colors">
                    确定
                </button>
            </div>
        </div>
    </div>

    <script>
        // 表单验证
        document.getElementById('submitBtn').addEventListener('click', function() {
            let isValid = true;

            // 重置所有错误提示
            document.querySelectorAll('.form-error').forEach(el => {
                el.classList.add('hidden');
                el.textContent = '';
            });

            // 验证原密码
            const oldPassword = document.getElementById('oldPassword').value;
            if (!oldPassword) {
                document.getElementById('oldPasswordError').textContent = '请输入原密码';
                document.getElementById('oldPasswordError').classList.remove('hidden');
                isValid = false;
            }

            // 验证新密码
            const newPassword = document.getElementById('newPassword').value;
            if (!newPassword) {
                document.getElementById('newPasswordError').textContent = '请输入新密码';
                document.getElementById('newPasswordError').classList.remove('hidden');
                isValid = false;
            } else if (newPassword.length < 8) {
                document.getElementById('newPasswordError').textContent = '密码长度至少8位';
                document.getElementById('newPasswordError').classList.remove('hidden');
                isValid = false;
            } else if (!/[A-Za-z]/.test(newPassword) || !/[0-9]/.test(newPassword)) {
                document.getElementById('newPasswordError').textContent = '密码必须包含字母和数字';
                document.getElementById('newPasswordError').classList.remove('hidden');
                isValid = false;
            }

            // 验证确认密码
            const confirmPassword = document.getElementById('confirmPassword').value;
            if (!confirmPassword) {
                document.getElementById('confirmPasswordError').textContent = '请确认新密码';
                document.getElementById('confirmPasswordError').classList.remove('hidden');
                isValid = false;
            } else if (confirmPassword !== newPassword) {
                document.getElementById('confirmPasswordError').textContent = '两次输入的密码不一致';
                document.getElementById('confirmPasswordError').classList.remove('hidden');
                isValid = false;
            }

            // 如果验证通过，提交表单
            if (isValid) {
                // 将新密码赋值给表单中的password字段
                document.getElementById('changePasswordForm').password = newPassword;

                // 使用fetch API提交表单数据
                const formData = new FormData();
                formData.append('id', document.getElementById('userId').value);
                formData.append('password', newPassword);

                fetch('${pageContext.request.contextPath}/account/password', {
                    method: 'POST',
                    body: formData
                })
                .then(response => {
                    if (response.ok) {
                        return response.text();
                    } else {
                        throw new Error('服务器错误');
                    }
                })
                .then(data => {
                    if (data) {
                        // 服务器返回错误信息
                        showError(data);
                    } else {
                        // 成功
                        document.getElementById('successModal').classList.remove('hidden');
                    }
                })
                .catch(error => {
                    showError('网络错误，请稍后重试');
                    console.error('Error:', error);
                });
            }
        });

        // 关闭成功模态框
        document.getElementById('closeSuccessModal').addEventListener('click', function() {
            document.getElementById('successModal').classList.add('hidden');
            // 清空表单
            document.getElementById('changePasswordForm').reset();
        });

        // 关闭错误模态框
        document.getElementById('closeErrorModal').addEventListener('click', function() {
            document.getElementById('errorModal').classList.add('hidden');
        });

        // 显示错误提示
        function showError(message) {
            document.getElementById('errorMessage').textContent = message;
            document.getElementById('errorModal').classList.remove('hidden');
        }
    </script>
</form>
</body>
</html>