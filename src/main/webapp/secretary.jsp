<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>学院秘书管理系统 - 研究生学籍管理</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <!-- Tailwind CSS 配置 -->
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: '#2563EB',
                        secondary: '#3B82F6',
                        accent: '#10B981',
                        warning: '#F59E0B',
                        danger: '#EF4444',
                        light: '#F8FAFC',
                        dark: '#1E293B'
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
                @apply shadow-md hover:shadow-lg transition-all duration-300;
            }
            .btn-primary {
                @apply bg-primary text-white font-medium py-2 px-4 rounded-lg hover:bg-primary/90 transition-colors flex items-center;
            }
            .btn-secondary {
                @apply bg-white text-primary border border-primary font-medium py-2 px-4 rounded-lg hover:bg-primary/5 transition-colors;
            }
            .btn-accent {
                @apply bg-accent text-white font-medium py-2 px-4 rounded-lg hover:bg-accent/90 transition-colors;
            }
            .table-row-hover {
                @apply hover:bg-gray-50 transition-colors;
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
<body class="min-h-screen bg-gradient-to-br from-light to-blue-50 font-inter">
    <!-- 顶部导航 -->
    <header class="bg-white shadow-sm sticky top-0 z-50">
        <div class="container mx-auto px-4 py-3 flex justify-between items-center">
            <div class="flex items-center space-x-2">
                <i class="fa fa-university text-primary text-xl"></i>
                <h1 class="text-lg md:text-xl font-bold text-primary">研究生学籍管理系统</h1>
            </div>
            <nav>
                <ul class="flex space-x-4">
                    <li><a href="#" class="text-primary font-medium">个人中心</a></li>
                    <li><a href="#" class="text-primary font-medium border-b-2 border-primary">学籍管理</a></li>
                    <li><a href="#" class="text-gray-600 hover:text-primary transition-colors">数据统计</a></li>
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
                <h2 class="text-2xl md:text-3xl font-bold text-gray-800 mb-2">学院研究生学籍管理</h2>
                <p class="text-gray-600">管理本学院研究生学籍信息</p>
            </div>

            <!-- 信息卡片 -->
            <div class="space-y-6 animate-slide-up" style="animation-delay: 0.2s">
                <!-- 秘书个人信息 -->
                <div class="bg-white rounded-xl p-6 md:p-8 card-shadow">
                    <h3 class="text-xl font-bold text-primary mb-4 pb-2 border-b border-gray-200 flex items-center">
                        <i class="fa fa-user-circle mr-2"></i>个人信息
                    </h3>
                    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
                        <div class="md:col-span-2">
                            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                <div>
                                    <label class="block text-gray-700 font-medium mb-1">姓名</label>
                                    <div class="text-gray-800 bg-gray-50 p-3 rounded-lg border border-gray-200">
                                        <span id="secretaryName">王小云</span>
                                    </div>
                                </div>
                                <div>
                                    <label class="block text-gray-700 font-medium mb-1">学院</label>
                                    <div class="text-gray-800 bg-gray-50 p-3 rounded-lg border border-gray-200">
                                        <span id="secretaryCollege">计算机科学与技术学院</span>
                                    </div>
                                </div>
                                <div>
                                    <label class="block text-gray-700 font-medium mb-1">账号ID</label>
                                    <div class="text-gray-800 bg-gray-50 p-3 rounded-lg border border-gray-200">
                                        <span id="secretaryAccountId">301</span>
                                    </div>
                                </div>
                                <div>
                                    <label class="block text-gray-700 font-medium mb-1">联系方式</label>
                                    <div class="text-gray-800 bg-gray-50 p-3 rounded-lg border border-gray-200">
                                        <span id="secretaryContact">13800138001</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="flex items-center justify-center md:justify-end">
                            <img src="https://picsum.photos/200/200?random=10" alt="秘书头像" class="w-32 h-32 rounded-full object-cover border-4 border-primary/20">
                        </div>
                    </div>
                </div>

                <!-- 学院研究生管理 -->
                <div class="bg-white rounded-xl p-6 md:p-8 card-shadow">
                    <div class="flex flex-col md:flex-row md:items-center justify-between mb-6">
                        <h3 class="text-xl font-bold text-primary mb-4 md:mb-0 pb-2 md:pb-0 border-b md:border-b-0 md:border-r border-gray-200 md:pr-6">
                            <i class="fa fa-graduation-cap mr-2"></i>本学院研究生列表
                        </h3>
                        <div class="flex space-x-3">
                            <div class="relative">
                                <input type="text" id="studentSearch" placeholder="搜索学生..."
                                    class="pl-10 pr-4 py-2 rounded-lg border border-gray-200 focus:border-primary focus:ring-2 focus:ring-primary/20 outline-none">
                                <i class="fa fa-search absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400"></i>
                            </div>
                            <button id="refreshStudentsBtn" class="btn-secondary">
                                <i class="fa fa-refresh mr-1"></i>刷新
                            </button>
                        </div>
                    </div>

                    <!-- 筛选栏 -->
                    <div class="grid grid-cols-1 md:grid-cols-4 gap-3 mb-6">
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">年级</label>
                            <select class="w-full px-4 py-2 rounded-lg border border-gray-200 focus:border-primary focus:ring-2 focus:ring-primary/20 outline-none">
                                <option value="">全部年级</option>
                                <option value="2023">2023级</option>
                                <option value="2022">2022级</option>
                                <option value="2021">2021级</option>
                            </select>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">专业</label>
                            <select class="w-full px-4 py-2 rounded-lg border border-gray-200 focus:border-primary focus:ring-2 focus:ring-primary/20 outline-none">
                                <option value="">全部专业</option>
                                <option value="software">软件工程</option>
                                <option value="ai">人工智能</option>
                                <option value="bigdata">大数据技术</option>
                            </select>
                        </div>
                        <div>
                            <label class="block text-sm font-medium text-gray-700 mb-1">状态</label>
                            <select class="w-full px-4 py-2 rounded-lg border border-gray-200 focus:border-primary focus:ring-2 focus:ring-primary/20 outline-none">
                                <option value="">全部状态</option>
                                <option value="active">在读</option>
                                <option value="graduated">已毕业</option>
                                <option value="休学">休学</option>
                            </select>
                        </div>
                        <div class="flex items-end">
                            <button class="btn-accent w-full">
                                <i class="fa fa-filter mr-1"></i>筛选
                            </button>
                        </div>
                    </div>

                    <!-- 学生列表 -->
                    <div class="overflow-x-auto">
                        <table class="min-w-full divide-y divide-gray-200">
                            <thead class="bg-gray-50">
                                <tr>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">学号</th>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">姓名</th>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">专业</th>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">年级</th>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">导师</th>
                                    <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">状态</th>
                                    <th scope="col" class="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">操作</th>
                                </tr>
                            </thead>
                            <tbody class="bg-white divide-y divide-gray-200" id="studentsTableBody">
                                <!-- 学生项1 -->
                                <tr class="table-row-hover">
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">20230001</td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <div class="flex items-center">
                                            <img src="https://picsum.photos/40/40?random=1" alt="学生头像" class="w-8 h-8 rounded-full mr-2">
                                            <span class="text-sm text-gray-900">张三</span>
                                        </div>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">软件工程</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">2023级</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">李四教授</td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">在读</span>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                                        <button class="text-primary hover:text-primary/80 mr-3 view-student-btn" data-student-id="1">
                                            <i class="fa fa-eye mr-1"></i>查看
                                        </button>
                                        <button class="text-secondary hover:text-secondary/80 edit-student-btn" data-student-id="1">
                                            <i class="fa fa-pencil mr-1"></i>编辑
                                        </button>
                                    </td>
                                </tr>

                                <!-- 学生项2 -->
                                <tr class="table-row-hover">
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">20230002</td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <div class="flex items-center">
                                            <img src="https://picsum.photos/40/40?random=2" alt="学生头像" class="w-8 h-8 rounded-full mr-2">
                                            <span class="text-sm text-gray-900">李四</span>
                                        </div>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">人工智能</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">2023级</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">王五教授</td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-green-100 text-green-800">在读</span>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                                        <button class="text-primary hover:text-primary/80 mr-3 view-student-btn" data-student-id="2">
                                            <i class="fa fa-eye mr-1"></i>查看
                                        </button>
                                        <button class="text-secondary hover:text-secondary/80 edit-student-btn" data-student-id="2">
                                            <i class="fa fa-pencil mr-1"></i>编辑
                                        </button>
                                    </td>
                                </tr>

                                <!-- 学生项3 -->
                                <tr class="table-row-hover">
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">20220015</td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <div class="flex items-center">
                                            <img src="https://picsum.photos/40/40?random=3" alt="学生头像" class="w-8 h-8 rounded-full mr-2">
                                            <span class="text-sm text-gray-900">王五</span>
                                        </div>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">大数据技术</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">2022级</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">李四教授</td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full bg-yellow-100 text-yellow-800">休学</span>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                                        <button class="text-primary hover:text-primary/80 mr-3 view-student-btn" data-student-id="3">
                                            <i class="fa fa-eye mr-1"></i>查看
                                        </button>
                                        <button class="text-secondary hover:text-secondary/80 edit-student-btn" data-student-id="3">
                                            <i class="fa fa-pencil mr-1"></i>编辑
                                        </button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                    <!-- 分页 -->
                    <div class="flex items-center justify-between border-t border-gray-200 px-6 py-4 sm:px-6">
                        <div class="flex-1 flex justify-between sm:hidden">
                            <button class="relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50">
                                上一页
                            </button>
                            <button class="ml-3 relative inline-flex items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50">
                                下一页
                            </button>
                        </div>
                        <div class="hidden sm:flex-1 sm:flex sm:items-center sm:justify-between">
                            <div>
                                <p class="text-sm text-gray-700">
                                    显示 <span class="font-medium">1</span> 到 <span class="font-medium">3</span> 条，共 <span class="font-medium">12</span> 条
                                </p>
                            </div>
                            <div>
                                <nav class="relative z-0 inline-flex rounded-md shadow-sm -space-x-px" aria-label="Pagination">
                                    <button class="relative inline-flex items-center px-2 py-2 rounded-l-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50">
                                        <span class="sr-only">上一页</span>
                                        <i class="fa fa-chevron-left text-xs"></i>
                                    </button>
                                    <button class="relative inline-flex items-center px-4 py-2 border border-gray-300 bg-primary text-sm font-medium text-white">
                                        1
                                    </button>
                                    <button class="relative inline-flex items-center px-4 py-2 border border-gray-300 bg-white text-sm font-medium text-gray-700 hover:bg-gray-50">
                                        2
                                    </button>
                                    <button class="relative inline-flex items-center px-4 py-2 border border-gray-300 bg-white text-sm font-medium text-gray-700 hover:bg-gray-50">
                                        3
                                    </button>
                                    <span class="relative inline-flex items-center px-4 py-2 border border-gray-300 bg-white text-sm font-medium text-gray-700">
                                        ...
                                    </span>
                                    <button class="relative inline-flex items-center px-4 py-2 border border-gray-300 bg-white text-sm font-medium text-gray-700 hover:bg-gray-50">
                                        4
                                    </button>
                                    <button class="relative inline-flex items-center px-2 py-2 rounded-r-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50">
                                        <span class="sr-only">下一页</span>
                                        <i class="fa fa-chevron-right text-xs"></i>
                                    </button>
                                </nav>
                            </div>
                        </div>
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
        document.addEventListener('DOMContentLoaded', function() {
            // 模拟秘书数据
            const secretaryData = {
                id: 1,
                name: "王小云",
                college: "计算机科学与技术学院",
                accountId: 301,
                contact: "13800138001"
            };

            // 填充秘书数据
            document.getElementById('secretaryName').textContent = secretaryData.name;
            document.getElementById('secretaryCollege').textContent = secretaryData.college;
            document.getElementById('secretaryAccountId').textContent = secretaryData.accountId;
            document.getElementById('secretaryContact').textContent = secretaryData.contact;

            // 查看学生详情按钮事件
            document.querySelectorAll('.view-student-btn').forEach(button => {
                button.addEventListener('click', function() {
                    const studentId = this.getAttribute('data-student-id');
                    alert(`即将跳转到学生ID为 ${studentId} 的详情页面\n(实际应用中请替换为window.location.href = "studentDetail.jsp?id=" + studentId)`);

                    // 示例跳转代码（取消注释并修改为实际页面）
                    // window.location.href = `studentDetail.jsp?id=${studentId}`;
                });
            });

            // 编辑学生信息按钮事件
            document.querySelectorAll('.edit-student-btn').forEach(button => {
                button.addEventListener('click', function() {
                    const studentId = this.getAttribute('data-student-id');
                    alert(`即将跳转到学生ID为 ${studentId} 的编辑页面\n(实际应用中请替换为window.location.href = "editStudent.jsp?id=" + studentId)`);

                    // 示例跳转代码（取消注释并修改为实际页面）
                    // window.location.href = `editStudent.jsp?id=${studentId}`;
                });
            });

            // 搜索功能演示
            document.getElementById('studentSearch').addEventListener('input', function() {
                const searchTerm = this.value.toLowerCase();
                const tableBody = document.getElementById('studentsTableBody');
                const rows = tableBody.querySelectorAll('tr');

                rows.forEach(row => {
                    const studentName = row.querySelector('td:nth-child(2) span').textContent.toLowerCase();
                    const studentId = row.querySelector('td:nth-child(1)').textContent.toLowerCase();

                    if (studentName.includes(searchTerm) || studentId.includes(searchTerm)) {
                        row.style.display = '';
                    } else {
                        row.style.display = 'none';
                    }
                });
            });

            // 添加动画效果
            const fadeElements = document.querySelectorAll('.animate-fade-in');
            fadeElements.forEach(el => {
                el.style.opacity = '0';
                el.style.transition = 'opacity 0.5s ease-in-out';
                setTimeout(() => {
                    el.style.opacity = '1';
                }, 100);
            });

            const slideElements = document.querySelectorAll('.animate-slide-up');
            slideElements.forEach((el, index) => {
                el.style.transform = 'translateY(20px)';
                el.style.opacity = '0';
                el.style.transition = 'transform 0.5s ease-out, opacity 0.5s ease-out';
                setTimeout(() => {
                    el.style.transform = 'translateY(0)';
                    el.style.opacity = '1';
                }, 200 * (index + 1));
            });
        });
    </script>
</body>
</html>