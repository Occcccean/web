<%@page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>研究生管理系统 - 综合管理平台</title>
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
        .menu-item { transition: all 0.3s ease; }
        .menu-item:hover { transform: translateX(4px); }
    </style>
</head>
<body class="bg-gray-50 font-sans">
    <!-- 顶部导航栏 -->
    <header class="bg-white shadow">
        <div class="container mx-auto px-4 py-3 flex justify-between items-center">
            <div class="flex items-center space-x-2">
                <i class="fa fa-university text-primary text-xl"></i>
                <h1 class="text-lg font-bold text-primary">研究生管理系统</h1>
            </div>
            <div class="flex items-center space-x-4">
                <div class="relative">
                    <button id="userMenuBtn" class="flex items-center space-x-2 focus:outline-none">
                        <i class="fa fa-user-circle text-primary text-lg"></i>
                        <span id="userName" class="font-medium">张院长</span>
                        <i class="fa fa-caret-down text-gray-500"></i>
                    </button>
                    <div id="userMenu" class="hidden absolute right-0 mt-2 w-48 bg-white rounded-md shadow-lg py-1 z-10">
                        <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">个人信息</a>
                        <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">修改密码</a>
                        <a href="#" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">退出登录</a>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <div class="container mx-auto px-4 py-8 flex flex-col lg:flex-row gap-6">
        <!-- 左侧菜单 -->
        <div class="lg:w-1/5">
            <div class="bg-white rounded-lg p-4 card">
                <h3 class="text-lg font-bold text-primary mb-4 pb-2 border-b">
                    <i class="fa fa-bars mr-2"></i>功能菜单
                </h3>
                <ul class="space-y-2">
                    <li>
                        <a href="#" class="menu-item flex items-center space-x-2 p-2 rounded-lg bg-primary/10 text-primary">
                            <i class="fa fa-graduation-cap"></i>
                            <span>学籍管理</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="menu-item flex items-center space-x-2 p-2 rounded-lg text-gray-700 hover:bg-gray-100">
                            <i class="fa fa-user-teacher"></i>
                            <span>导师管理</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="menu-item flex items-center space-x-2 p-2 rounded-lg text-gray-700 hover:bg-gray-100">
                            <i class="fa fa-book"></i>
                            <span>培养方案</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="menu-item flex items-center space-x-2 p-2 rounded-lg text-gray-700 hover:bg-gray-100">
                            <i class="fa fa-certificate"></i>
                            <span>学位管理</span>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="menu-item flex items-center space-x-2 p-2 rounded-lg text-gray-700 hover:bg-gray-100">
                            <i class="fa fa-bar-chart"></i>
                            <span>统计分析</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <!-- 右侧内容 -->
        <div class="lg:w-4/5">
            <!-- 角色信息卡片 -->
            <div class="bg-white rounded-lg p-6 mb-6 card">
                <h3 class="text-xl font-bold text-primary mb-4 pb-2 border-b">
                    <i class="fa fa-id-card mr-2"></i>当前角色信息
                </h3>
                <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
                    <div>
                        <p class="text-gray-600">姓名</p>
                        <p class="font-medium" id="roleName">张院长</p>
                    </div>
                    <div>
                        <p class="text-gray-600">角色</p>
                        <p class="font-medium" id="roleType">研究生院领导</p>
                    </div>
                    <div>
                        <p class="text-gray-600">所属部门</p>
                        <p class="font-medium" id="roleDept">研究生院</p>
                    </div>
                    <div>
                        <p class="text-gray-600">最后登录</p>
                        <p class="font-medium">2025-06-27 08:30</p>
                    </div>
                </div>
            </div>

            <!-- 学籍信息管理 -->
            <div class="bg-white rounded-lg p-6 mb-6 card">
                <div class="flex justify-between items-center mb-4">
                    <h3 class="text-xl font-bold text-primary">
                        <i class="fa fa-graduation-cap mr-2"></i>研究生学籍信息管理
                    </h3>
                    <div id="adminActions" class="hidden">
                        <button class="bg-primary text-white px-4 py-2 rounded-lg hover:bg-primary/90 transition-colors mr-2">
                            <i class="fa fa-plus mr-1"></i>新增
                        </button>
                        <button class="bg-gray-200 text-gray-800 px-4 py-2 rounded-lg hover:bg-gray-300 transition-colors">
                            <i class="fa fa-download mr-1"></i>导出
                        </button>
                    </div>
                </div>
                <div class="relative w-1/3 mb-4">
                    <input type="text" placeholder="搜索学号/姓名..." class="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary/50">
                    <i class="fa fa-search absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400"></i>
                </div>
                <div class="overflow-x-auto">
                    <table class="min-w-full divide-y divide-gray-200">
                        <thead>
                            <tr>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500">学号</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500">姓名</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500">学院</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500">专业</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500">入学年份</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500">状态</th>
                                <th class="px-6 py-3 text-right text-xs font-medium text-gray-500">操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="table-row">
                                <td class="px-6 py-4 text-sm">20230001</td>
                                <td class="px-6 py-4 text-sm">张三</td>
                                <td class="px-6 py-4 text-sm">计算机学院</td>
                                <td class="px-6 py-4 text-sm">计算机科学与技术</td>
                                <td class="px-6 py-4 text-sm">2023</td>
                                <td class="px-6 py-4 text-sm"><span class="px-2 py-1 bg-green-100 text-green-800 rounded text-xs">在读</span></td>
                                <td class="px-6 py-4 text-sm text-right">
                                    <button class="text-primary hover:text-primary/80 mr-3">查看</button>
                                    <button id="editBtn1" class="text-primary hover:text-primary/80 mr-3 hidden">编辑</button>
                                    <button id="deleteBtn1" class="text-red-500 hover:text-red-600 hidden">删除</button>
                                </td>
                            </tr>
                            <tr class="table-row">
                                <td class="px-6 py-4 text-sm">20230002</td>
                                <td class="px-6 py-4 text-sm">李四</td>
                                <td class="px-6 py-4 text-sm">数学学院</td>
                                <td class="px-6 py-4 text-sm">应用数学</td>
                                <td class="px-6 py-4 text-sm">2023</td>
                                <td class="px-6 py-4 text-sm"><span class="px-2 py-1 bg-green-100 text-green-800 rounded text-xs">在读</span></td>
                                <td class="px-6 py-4 text-sm text-right">
                                    <button class="text-primary hover:text-primary/80 mr-3">查看</button>
                                    <button id="editBtn2" class="text-primary hover:text-primary/80 mr-3 hidden">编辑</button>
                                    <button id="deleteBtn2" class="text-red-500 hover:text-red-600 hidden">删除</button>
                                </td>
                            </tr>
                            <tr class="table-row">
                                <td class="px-6 py-4 text-sm">20220015</td>
                                <td class="px-6 py-4 text-sm">王五</td>
                                <td class="px-6 py-4 text-sm">数据学院</td>
                                <td class="px-6 py-4 text-sm">大数据技术与工程</td>
                                <td class="px-6 py-4 text-sm">2022</td>
                                <td class="px-6 py-4 text-sm"><span class="px-2 py-1 bg-yellow-100 text-yellow-800 rounded text-xs">休学</span></td>
                                <td class="px-6 py-4 text-sm text-right">
                                    <button class="text-primary hover:text-primary/80 mr-3">查看</button>
                                    <button id="editBtn3" class="text-primary hover:text-primary/80 mr-3 hidden">编辑</button>
                                    <button id="deleteBtn3" class="text-red-500 hover:text-red-600 hidden">删除</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="flex justify-between mt-4">
                    <div class="text-sm text-gray-500">显示 1-3 条，共 128 条</div>
                    <div class="flex space-x-1">
                        <button class="px-3 py-1 border border-gray-300 rounded-md text-gray-500 hover:bg-gray-50">上一页</button>
                        <button class="px-3 py-1 border border-primary bg-primary text-white rounded-md">1</button>
                        <button class="px-3 py-1 border border-gray-300 rounded-md text-gray-700 hover:bg-gray-50">2</button>
                        <button class="px-3 py-1 border border-gray-300 rounded-md text-gray-700 hover:bg-gray-50">3</button>
                        <button class="px-3 py-1 border border-gray-300 rounded-md text-gray-700 hover:bg-gray-50">下一页</button>
                    </div>
                </div>
            </div>

            <!-- 导师信息管理 -->
            <div class="bg-white rounded-lg p-6 card">
                <div class="flex justify-between items-center mb-4">
                    <h3 class="text-xl font-bold text-primary">
                        <i class="fa fa-user-teacher mr-2"></i>导师信息管理
                    </h3>
                    <div id="teacherAdminActions" class="hidden">
                        <button class="bg-primary text-white px-4 py-2 rounded-lg hover:bg-primary/90 transition-colors mr-2">
                            <i class="fa fa-plus mr-1"></i>新增
                        </button>
                        <button class="bg-gray-200 text-gray-800 px-4 py-2 rounded-lg hover:bg-gray-300 transition-colors">
                            <i class="fa fa-download mr-1"></i>导出
                        </button>
                    </div>
                </div>
                <div class="relative w-1/3 mb-4">
                    <input type="text" placeholder="搜索工号/姓名..." class="w-full pl-10 pr-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-primary/50">
                    <i class="fa fa-search absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400"></i>
                </div>
                <div class="overflow-x-auto">
                    <table class="min-w-full divide-y divide-gray-200">
                        <thead>
                            <tr>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500">工号</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500">姓名</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500">学院</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500">职称</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500">研究方向</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500">导师类型</th>
                                <th class="px-6 py-3 text-right text-xs font-medium text-gray-500">操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="table-row">
                                <td class="px-6 py-4 text-sm">2010001</td>
                                <td class="px-6 py-4 text-sm">王五</td>
                                <td class="px-6 py-4 text-sm">计算机学院</td>
                                <td class="px-6 py-4 text-sm">教授</td>
                                <td class="px-6 py-4 text-sm">人工智能</td>
                                <td class="px-6 py-4 text-sm"><span class="px-2 py-1 bg-blue-100 text-blue-800 rounded text-xs">博士生导师</span></td>
                                <td class="px-6 py-4 text-sm text-right">
                                    <button class="text-primary hover:text-primary/80 mr-3">查看</button>
                                    <button id="editTeacherBtn1" class="text-primary hover:text-primary/80 mr-3 hidden">编辑</button>
                                    <button id="deleteTeacherBtn1" class="text-red-500 hover:text-red-600 hidden">删除</button>
                                </td>
                            </tr>
                            <tr class="table-row">
                                <td class="px-6 py-4 text-sm">2010002</td>
                                <td class="px-6 py-4 text-sm">赵六</td>
                                <td class="px-6 py-4 text-sm">数学学院</td>
                                <td class="px-6 py-4 text-sm">副教授</td>
                                <td class="px-6 py-4 text-sm">应用数学</td>
                                <td class="px-6 py-4 text-sm"><span class="px-2 py-1 bg-green-100 text-green-800 rounded text-xs">硕士生导师</span></td>
                                <td class="px-6 py-4 text-sm text-right">
                                    <button class="text-primary hover:text-primary/80 mr-3">查看</button>
                                    <button id="editTeacherBtn2" class="text-primary hover:text-primary/80 mr-3 hidden">编辑</button>
                                    <button id="deleteTeacherBtn2" class="text-red-500 hover:text-red-600 hidden">删除</button>
                                </td>
                            </tr>
                            <tr class="table-row">
                                <td class="px-6 py-4 text-sm">2010003</td>
                                <td class="px-6 py-4 text-sm">钱七</td>
                                <td class="px-6 py-4 text-sm">电子学院</td>
                                <td class="px-6 py-4 text-sm">教授</td>
                                <td class="px-6 py-4 text-sm">通信工程</td>
                                <td class="px-6 py-4 text-sm"><span class="px-2 py-1 bg-blue-100 text-blue-800 rounded text-xs">博士生导师</span></td>
                                <td class="px-6 py-4 text-sm text-right">
                                    <button class="text-primary hover:text-primary/80 mr-3">查看</button>
                                    <button id="editTeacherBtn3" class="text-primary hover:text-primary/80 mr-3 hidden">编辑</button>
                                    <button id="deleteTeacherBtn3" class="text-red-500 hover:text-red-600 hidden">删除</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="flex justify-between mt-4">
                    <div class="text-sm text-gray-500">显示 1-3 条，共 56 条</div>
                    <div class="flex space-x-1">
                        <button class="px-3 py-1 border border-gray-300 rounded-md text-gray-500 hover:bg-gray-50">上一页</button>
                        <button class="px-3 py-1 border border-primary bg-primary text-white rounded-md">1</button>
                        <button class="px-3 py-1 border border-gray-300 rounded-md text-gray-700 hover:bg-gray-50">2</button>
                        <button class="px-3 py-1 border border-gray-300 rounded-md text-gray-700 hover:bg-gray-50">3</button>
                        <button class="px-3 py-1 border border-gray-300 rounded-md text-gray-700 hover:bg-gray-50">下一页</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 页脚 -->
    <footer class="bg-gray-100 py-4 mt-8">
        <div class="container mx-auto px-4 text-center text-gray-500 text-sm">
            <p>© 2025 研究生管理系统</p>
        </div>
    </footer>

    <script>
        // 角色权限控制函数
        function initRolePermissions(role) {
            const roleName = document.getElementById('roleName');
            const roleType = document.getElementById('roleType');
            const roleDept = document.getElementById('roleDept');
            const adminActions = document.getElementById('adminActions');
            const teacherAdminActions = document.getElementById('teacherAdminActions');
            const editButtons = document.querySelectorAll('[id^="editBtn"]');
            const deleteButtons = document.querySelectorAll('[id^="deleteBtn"]');
            const editTeacherButtons = document.querySelectorAll('[id^="editTeacherBtn"]');
            const deleteTeacherButtons = document.querySelectorAll('[id^="deleteTeacherBtn"]');

            // 设置角色信息
            if (role === 'college_manager') {
                roleName.textContent = '王老师';
                roleType.textContent = '研究生院管理员';
                roleDept.textContent = '研究生院';
            } else if (role === 'college_leader') {
                roleName.textContent = '张院长';
                roleType.textContent = '研究生院领导';
                roleDept.textContent = '研究生院';
            } else if (role === 'university_leader') {
                roleName.textContent = '李校长';
                roleType.textContent = '学校领导';
                roleDept.textContent = '学校';
            }

            // 根据角色显示不同的权限
            if (role === 'college_manager' || role === 'college_leader') {
                // 研究生院管理员和领导有编辑和删除权限
                adminActions.classList.remove('hidden');
                teacherAdminActions.classList.remove('hidden');
                editButtons.forEach(btn => btn.classList.remove('hidden'));
                deleteButtons.forEach(btn => btn.classList.remove('hidden'));
                editTeacherButtons.forEach(btn => btn.classList.remove('hidden'));
                deleteTeacherButtons.forEach(btn => btn.classList.remove('hidden'));
            } else if (role === 'university_leader') {
                // 学校领导只有查看权限
                adminActions.classList.add('hidden');
                teacherAdminActions.classList.add('hidden');
                editButtons.forEach(btn => btn.classList.add('hidden'));
                deleteButtons.forEach(btn => btn.classList.add('hidden'));
                editTeacherButtons.forEach(btn => btn.classList.add('hidden'));
                deleteTeacherButtons.forEach(btn => btn.classList.add('hidden'));
            }
        }

        // 用户菜单切换
        document.getElementById('userMenuBtn').addEventListener('click', function() {
            const menu = document.getElementById('userMenu');
            menu.classList.toggle('hidden');
        });

        // 页面加载完成后初始化
        document.addEventListener('DOMContentLoaded', function() {
            // 从URL参数获取角色，实际项目中应该从session或cookie获取
            const urlParams = new URLSearchParams(window.location.search);
            const role = urlParams.get('role') || 'college_leader';
            initRolePermissions(role);
        });
    </script>
</body>
</html>