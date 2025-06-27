<%@page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>审计管理员 - 系统日志</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <script>
        tailwind.config = {
            theme: { extend: { colors: { primary: '#7C3AED' } } }
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
                <i class="fa fa-file-text-o text-primary text-xl"></i>
                <h1 class="text-lg font-bold text-primary">系统审计中心</h1>
            </div>
            <nav>
                <ul class="flex space-x-4">
                    <li><a href="#" class="text-primary font-medium border-b-2 border-primary">系统日志</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- 主内容区 -->
    <main class="container mx-auto px-4 py-8">
        <h2 class="text-2xl font-bold text-gray-800 mb-6">系统日志管理</h2>

        <!-- 个人信息 -->
        <div class="bg-white rounded-lg p-6 mb-6 card">
            <h3 class="text-xl font-bold text-primary mb-4 pb-2 border-b">
                <i class="fa fa-user-circle mr-2"></i>审计管理员信息
            </h3>
            <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
                <div>
                    <p class="text-gray-600">姓名</p>
                    <p class="font-medium">刘审计</p>
                </div>
                <div>
                    <p class="text-gray-600">角色</p>
                    <p class="font-medium">审计管理员</p>
                </div>
                <div>
                    <p class="text-gray-600">权限范围</p>
                    <p class="font-medium">系统日志查看</p>
                </div>
                <div>
                    <p class="text-gray-600">最后登录</p>
                    <p class="font-medium">2025-06-27 09:15</p>
                </div>
            </div>
        </div>

        <!-- 日志查询 -->
        <div class="bg-white rounded-lg p-6 mb-6 card">
            <h3 class="text-xl font-bold text-primary mb-4 pb-2 border-b">
                <i class="fa fa-search mr-2"></i>日志查询
            </h3>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-4">
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">日期范围</label>
                    <div class="flex space-x-2">
                        <input type="date" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary/50">
                        <input type="date" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary/50">
                    </div>
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">操作类型</label>
                    <select class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary/50">
                        <option value="">全部操作</option>
                        <option value="login">登录</option>
                        <option value="create">创建</option>
                        <option value="update">修改</option>
                        <option value="delete">删除</option>
                        <option value="query">查询</option>
                    </select>
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">用户</label>
                    <select class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary/50">
                        <option value="">全部用户</option>
                        <option value="admin">系统管理员</option>
                        <option value="grad">研究生院管理员</option>
                        <option value="audit">审计管理员</option>
                    </select>
                </div>
            </div>
            <div class="flex justify-end">
                <button class="bg-primary text-white px-4 py-2 rounded-lg hover:bg-primary/90 transition-colors">
                    <i class="fa fa-search mr-1"></i>查询日志
                </button>
            </div>
        </div>

        <!-- 日志列表 -->
        <div class="bg-white rounded-lg p-6 card">
            <h3 class="text-xl font-bold text-primary mb-4 pb-2 border-b">
                <i class="fa fa-list-alt mr-2"></i>日志列表
            </h3>
            <div class="overflow-x-auto">
                <table class="min-w-full divide-y divide-gray-200">
                    <thead>
                        <tr>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500">时间</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500">用户</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500">操作类型</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500">操作内容</th>
                            <th class="px-6 py-3 text-left text-xs font-medium text-gray-500">IP地址</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="table-row">
                            <td class="px-6 py-4 text-sm">2025-06-27 08:30:15</td>
                            <td class="px-6 py-4 text-sm">admin</td>
                            <td class="px-6 py-4 text-sm"><span class="px-2 py-1 bg-blue-100 text-blue-800 rounded text-xs">登录</span></td>
                            <td class="px-6 py-4 text-sm">系统管理员登录系统</td>
                            <td class="px-6 py-4 text-sm">192.168.1.100</td>
                        </tr>
                        <tr class="table-row">
                            <td class="px-6 py-4 text-sm">2025-06-27 08:45:32</td>
                            <td class="px-6 py-4 text-sm">admin</td>
                            <td class="px-6 py-4 text-sm"><span class="px-2 py-1 bg-green-100 text-green-800 rounded text-xs">创建</span></td>
                            <td class="px-6 py-4 text-sm">创建用户sys_assistant</td>
                            <td class="px-6 py-4 text-sm">192.168.1.100</td>
                        </tr>
                        <tr class="table-row">
                            <td class="px-6 py-4 text-sm">2025-06-27 09:00:45</td>
                            <td class="px-6 py-4 text-sm">grad_admin</td>
                            <td class="px-6 py-4 text-sm"><span class="px-2 py-1 bg-yellow-100 text-yellow-800 rounded text-xs">修改</span></td>
                            <td class="px-6 py-4 text-sm">修改学生20230001信息</td>
                            <td class="px-6 py-4 text-sm">192.168.1.101</td>
                        </tr>
                        <tr class="table-row">
                            <td class="px-6 py-4 text-sm">2025-06-27 09:15:20</td>
                            <td class="px-6 py-4 text-sm">audit</td>
                            <td class="px-6 py-4 text-sm"><span class="px-2 py-1 bg-blue-100 text-blue-800 rounded text-xs">登录</span></td>
                            <td class="px-6 py-4 text-sm">审计管理员登录系统</td>
                            <td class="px-6 py-4 text-sm">192.168.1.102</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="flex justify-between mt-4">
                <div class="text-sm text-gray-500">显示 1-4 条，共 248 条</div>
                <div class="flex space-x-1">
                    <button class="px-3 py-1 border border-gray-300 rounded-md text-gray-500 hover:bg-gray-50">上一页</button>
                    <button class="px-3 py-1 border border-primary bg-primary text-white rounded-md">1</button>
                    <button class="px-3 py-1 border border-gray-300 rounded-md text-gray-700 hover:bg-gray-50">2</button>
                    <button class="px-3 py-1 border border-gray-300 rounded-md text-gray-700 hover:bg-gray-50">3</button>
                    <button class="px-3 py-1 border border-gray-300 rounded-md text-gray-700 hover:bg-gray-50">下一页</button>
                </div>
            </div>
        </div>
    </main>

    <!-- 页脚 -->
    <footer class="bg-gray-100 py-4 mt-8">
        <div class="container mx-auto px-4 text-center text-gray-500 text-sm">
            <p>© 2025 系统审计中心</p>
        </div>
    </footer>
</body>
</html>