<%@page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>系统管理员 - 用户权限管理</title>
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
    </style>
</head>
<body class="bg-gray-50 font-sans">
    <!-- 导航栏 -->
    <header class="bg-white shadow">
        <div class="container mx-auto px-4 py-3 flex justify-between items-center">
            <div class="flex items-center space-x-2">
                <i class="fa fa-cog text-primary text-xl"></i>
                <h1 class="text-lg font-bold text-primary">系统管理中心</h1>
            </div>
            <nav>
                <ul class="flex space-x-4">
                    <li><a href="#" class="text-primary font-medium border-b-2 border-primary">用户管理</a></li>
                    <li><a href="#" class="text-gray-600 hover:text-primary">角色管理</a></li>
                    <li><a href="#" class="text-gray-600 hover:text-primary">权限配置</a></li>
                    <li><a href="#" class="text-gray-600 hover:text-primary">系统设置</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- 主内容区 -->
    <main class="container mx-auto px-4 py-8">
        <h2 class="text-2xl font-bold text-gray-800 mb-6">用户权限管理</h2>

        <!-- 个人信息 -->
        <div class="bg-white rounded-lg p-6 mb-6 card">
            <h3 class="text-xl font-bold text-primary mb-4 pb-2 border-b">
                <i class="fa fa-user-circle mr-2"></i>管理员信息
            </h3>
            <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
                <div>
                    <p class="text-gray-600">姓名</p>
                    <p class="font-medium">系统管理员</p>
                </div>
                <div>
                    <p class="text-gray-600">角色</p>
                    <p class="font-medium">系统管理员</p>
                </div>
                <div>
                    <p class="text-gray-600">权限</p>
                    <p class="font-medium">所有权限</p>
                </div>
                <div>
                    <p class="text-gray-600">最后登录</p>
                    <p class="font-medium">2025-06-27 08:30</p>
                </div>
            </div>
        </div>

        <!-- 用户管理 -->
        <div class="bg-white rounded-lg p-6 mb-6 card">
            <h3 class="text-xl font-bold text-primary mb-4 pb-2 border-b">
                <i class="fa fa-users mr-2"></i>用户列表
            </h3>
            <div class="flex justify-between mb-4">
                <div class="relative">
                    <input type="text" placeholder="搜索用户..." class="pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary/50">
                    <i class="fa fa-search absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400"></i>
                </div>
                <button class="bg-primary text-white px-4 py-2 rounded-lg hover:bg-primary/90 transition-colors">
                    <i class="fa fa-plus mr-1"></i>新增用户
                </button>
            </div>
            <div class="overflow-x-auto">
                <table class="min-w-full divide-y divide-gray-200">
                    <thead>
                        <tr>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500">用户名</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500">姓名</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500">角色</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500">状态</th>
                            <th class="px-6 py-3 text-right text-xs font-medium text-gray-500">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="table-row">
                            <td class="px-6 py-4 text-sm">grad_admin</td>
                            <td class="px-6 py-4 text-sm">张院长</td>
                            <td class="px-6 py-4 text-sm"><span class="px-2 py-1 bg-blue-100 text-blue-800 rounded text-xs">研究生院管理员</span></td>
                            <td class="px-6 py-4 text-sm"><span class="px-2 py-1 bg-green-100 text-green-800 rounded text-xs">启用</span></td>
                            <td class="px-6 py-4 text-sm text-right">
                                <button class="text-primary hover:text-primary/80 mr-3">编辑</button>
                                <button class="text-red-500 hover:text-red-600">删除</button>
                            </td>
                        </tr>
                        <tr class="table-row">
                            <td class="px-6 py-4 text-sm">audit_admin</td>
                            <td class="px-6 py-4 text-sm">刘审计</td>
                            <td class="px-6 py-4 text-sm"><span class="px-2 py-1 bg-purple-100 text-purple-800 rounded text-xs">审计管理员</span></td>
                            <td class="px-6 py-4 text-sm"><span class="px-2 py-1 bg-green-100 text-green-800 rounded text-xs">启用</span></td>
                            <td class="px-6 py-4 text-sm text-right">
                                <button class="text-primary hover:text-primary/80 mr-3">编辑</button>
                                <button class="text-red-500 hover:text-red-600">删除</button>
                            </td>
                        </tr>
                        <tr class="table-row">
                            <td class="px-6 py-4 text-sm">sys_assistant</td>
                            <td class="px-6 py-4 text-sm">王助理</td>
                            <td class="px-6 py-4 text-sm"><span class="px-2 py-1 bg-gray-100 text-gray-800 rounded text-xs">普通用户</span></td>
                            <td class="px-6 py-4 text-sm"><span class="px-2 py-1 bg-yellow-100 text-yellow-800 rounded text-xs">待审核</span></td>
                            <td class="px-6 py-4 text-sm text-right">
                                <button class="text-primary hover:text-primary/80 mr-3">编辑</button>
                                <button class="text-red-500 hover:text-red-600">删除</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- 角色权限配置 -->
        <div class="bg-white rounded-lg p-6 card">
            <h3 class="text-xl font-bold text-primary mb-4 pb-2 border-b">
                <i class="fa fa-shield mr-2"></i>角色权限配置
            </h3>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <!-- 角色列表 -->
                <div>
                    <h4 class="text-lg font-medium text-gray-800 mb-3">角色列表</h4>
                    <div class="space-y-2">
                        <div class="flex items-center justify-between p-3 bg-gray-50 rounded-lg">
                            <span class="font-medium">系统管理员</span>
                            <button class="text-primary hover:text-primary/80 text-sm">配置权限</button>
                        </div>
                        <div class="flex items-center justify-between p-3 bg-gray-50 rounded-lg">
                            <span class="font-medium">研究生院管理员</span>
                            <button class="text-primary hover:text-primary/80 text-sm">配置权限</button>
                        </div>
                        <div class="flex items-center justify-between p-3 bg-gray-50 rounded-lg">
                            <span class="font-medium">审计管理员</span>
                            <button class="text-primary hover:text-primary/80 text-sm">配置权限</button>
                        </div>
                        <div class="flex items-center justify-between p-3 bg-gray-50 rounded-lg">
                            <span class="font-medium">普通用户</span>
                            <button class="text-primary hover:text-primary/80 text-sm">配置权限</button>
                        </div>
                    </div>
                </div>

                <!-- 审计管理员权限预览 -->
                <div>
                    <h4 class="text-lg font-medium text-gray-800 mb-3">审计管理员权限</h4>
                    <div class="p-4 bg-gray-50 rounded-lg">
                        <ul class="space-y-2">
                            <li class="flex items-center">
                                <i class="fa fa-check text-green-500 mr-2"></i>
                                <span>查看系统日志</span>
                            </li>
                            <li class="flex items-center">
                                <i class="fa fa-check text-green-500 mr-2"></i>
                                <span>导出日志记录</span>
                            </li>
                            <li class="flex items-center text-gray-400">
                                <i class="fa fa-times text-red-400 mr-2"></i>
                                <span>修改用户信息</span>
                            </li>
                            <li class="flex items-center text-gray-400">
                                <i class="fa fa-times text-red-400 mr-2"></i>
                                <span>配置系统参数</span>
                            </li>
                            <li class="flex items-center text-gray-400">
                                <i class="fa fa-times text-red-400 mr-2"></i>
                                <span>管理研究生数据</span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- 页脚 -->
    <footer class="bg-gray-100 py-4 mt-8">
        <div class="container mx-auto px-4 text-center text-gray-500 text-sm">
            <p>© 2025 系统管理中心</p>
        </div>
    </footer>
</body>
</html>