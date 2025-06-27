<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>导师个人中心 - 研究生学籍管理系统</title>
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
            .card-shadow {
                @apply shadow-md hover:shadow-lg transition-shadow duration-300;
            }
            .btn-primary {
                @apply bg-primary text-white font-medium py-2 px-4 rounded-lg hover:bg-primary/90 transition-colors;
            }
            .btn-secondary {
                @apply bg-white text-primary border border-primary font-medium py-2 px-4 rounded-lg hover:bg-primary/5 transition-colors;
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
                    <li><a href="#" class="text-primary font-medium">个人中心</a></li>
                    <li><a href="#" class="text-gray-600 hover:text-primary transition-colors">学生管理</a></li>
                    <li><a href="#" class="text-gray-600 hover:text-primary transition-colors">课程管理</a></li>
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
                <h2 class="text-2xl md:text-3xl font-bold text-gray-800 mb-2">导师个人中心</h2>
                <p class="text-gray-600">查看个人信息和指导的学生</p>
            </div>

            <!-- 信息卡片 -->
            <div class="space-y-6 animate-slide-up" style="animation-delay: 0.2s">
                <!-- 导师个人信息 -->
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
                                        <span id="mentorName">李四教授</span>
                                    </div>
                                </div>
                                <div>
                                    <label class="block text-gray-700 font-medium mb-1">学院</label>
                                    <div class="text-gray-800 bg-gray-50 p-3 rounded-lg border border-gray-200">
                                        <span id="mentorCollege">计算机科学与技术学院</span>
                                    </div>
                                </div>
                                <div>
                                    <label class="block text-gray-700 font-medium mb-1">账号ID</label>
                                    <div class="text-gray-800 bg-gray-50 p-3 rounded-lg border border-gray-200">
                                        <span id="mentorAccountId">501</span>
                                    </div>
                                </div>
                                <div>
                                    <label class="block text-gray-700 font-medium mb-1">联系方式</label>
                                    <div class="text-gray-800 bg-gray-50 p-3 rounded-lg border border-gray-200">
                                        <span id="mentorContact">13900139000</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="flex items-center justify-center md:justify-end">
                            <img src="https://picsum.photos/200/200" alt="导师头像" class="w-32 h-32 rounded-full object-cover border-4 border-primary/20">
                        </div>
                    </div>
                </div>

                <!-- 学生列表 -->
                <div class="bg-white rounded-xl p-6 md:p-8 card-shadow">
                    <div class="flex flex-col md:flex-row md:items-center justify-between mb-6">
                        <h3 class="text-xl font-bold text-primary mb-4 md:mb-0 pb-2 md:pb-0 border-b md:border-b-0 md:border-r border-gray-200 md:pr-6">
                            <i class="fa fa-graduation-cap mr-2"></i>指导的学生
                        </h3>
                        <button id="viewStudentsBtn" class="btn-primary flex items-center">
                            <i class="fa fa-eye mr-2"></i>查看所有学生
                        </button>
                    </div>

                    <!-- 学生列表卡片 -->
                    <div id="studentsList" class="space-y-4 hidden">
                        <!-- 学生项1 -->
                        <div class="border border-gray-200 rounded-lg p-4 hover:bg-gray-50 transition-colors">
                            <div class="flex flex-col md:flex-row md:items-center justify-between">
                                <div class="flex items-center mb-3 md:mb-0">
                                    <img src="https://picsum.photos/100/100?random=1" alt="学生头像" class="w-12 h-12 rounded-full object-cover mr-3">
                                    <div>
                                        <h4 class="font-medium text-gray-800" id="student1Name">张三</h4>
                                        <p class="text-gray-600" id="student1Info">计算机科学与技术学院 | 软件工程专业</p>
                                    </div>
                                </div>
                                <button class="btn-secondary view-student-btn" data-student-id="1">
                                    <i class="fa fa-info-circle mr-1"></i>查看详情
                                </button>
                            </div>
                        </div>

                        <!-- 学生项2 -->
                        <div class="border border-gray-200 rounded-lg p-4 hover:bg-gray-50 transition-colors">
                            <div class="flex flex-col md:flex-row md:items-center justify-between">
                                <div class="flex items-center mb-3 md:mb-0">
                                    <img src="https://picsum.photos/100/100?random=2" alt="学生头像" class="w-12 h-12 rounded-full object-cover mr-3">
                                    <div>
                                        <h4 class="font-medium text-gray-800" id="student2Name">李四</h4>
                                        <p class="text-gray-600" id="student2Info">计算机科学与技术学院 | 人工智能专业</p>
                                    </div>
                                </div>
                                <button class="btn-secondary view-student-btn" data-student-id="2">
                                    <i class="fa fa-info-circle mr-1"></i>查看详情
                                </button>
                            </div>
                        </div>

                        <!-- 学生项3 -->
                        <div class="border border-gray-200 rounded-lg p-4 hover:bg-gray-50 transition-colors">
                            <div class="flex flex-col md:flex-row md:items-center justify-between">
                                <div class="flex items-center mb-3 md:mb-0">
                                    <img src="https://picsum.photos/100/100?random=3" alt="学生头像" class="w-12 h-12 rounded-full object-cover mr-3">
                                    <div>
                                        <h4 class="font-medium text-gray-800" id="student3Name">王五</h4>
                                        <p class="text-gray-600" id="student3Info">数据科学学院 | 大数据技术专业</p>
                                    </div>
                                </div>
                                <button class="btn-secondary view-student-btn" data-student-id="3">
                                    <i class="fa fa-info-circle mr-1"></i>查看详情
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- 暂无学生提示 -->
                    <div id="noStudentsTip" class="text-center py-8 text-gray-500 hidden">
                        <i class="fa fa-info-circle text-3xl mb-3 text-primary/30"></i>
                        <p>您目前没有指导的学生</p>
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
            // 模拟导师数据
            const mentorData = {
                id: 1,
                name: "李四教授",
                college: "计算机科学与技术学院",
                accountId: 501,
                contact: "13900139000"
            };

            // 模拟学生数据
            const studentsData = [
                { id: 1, name: "张三", college: "计算机科学与技术学院", major: "软件工程", studentId: "20230001" },
                { id: 2, name: "李四", college: "计算机科学与技术学院", major: "人工智能", studentId: "20230002" },
                { id: 3, name: "王五", college: "数据科学学院", major: "大数据技术", studentId: "20230003" }
            ];

            // 填充导师数据
            document.getElementById('mentorName').textContent = mentorData.name;
            document.getElementById('mentorCollege').textContent = mentorData.college;
            document.getElementById('mentorAccountId').textContent = mentorData.accountId;
            document.getElementById('mentorContact').textContent = mentorData.contact;

            // 查看学生按钮事件
            document.getElementById('viewStudentsBtn').addEventListener('click', function() {
                const studentsList = document.getElementById('studentsList');
                const noStudentsTip = document.getElementById('noStudentsTip');

                // 显示学生列表或提示
                if (studentsData.length > 0) {
                    studentsList.classList.remove('hidden');
                    noStudentsTip.classList.add('hidden');
                    this.innerHTML = '<i class="fa fa-eye mr-2"></i>收起学生列表';
                } else {
                    studentsList.classList.add('hidden');
                    noStudentsTip.classList.remove('hidden');
                    this.innerHTML = '<i class="fa fa-eye mr-2"></i>查看所有学生';
                }
            });

            // 查看学生详情按钮事件
            document.querySelectorAll('.view-student-btn').forEach(button => {
                button.addEventListener('click', function() {
                    const studentId = this.getAttribute('data-student-id');
                    // 在实际应用中，这里会跳转到学生详情页
                    alert(`即将跳转到学生ID为 ${studentId} 的详情页面\n(实际应用中请替换为window.location.href = "studentDetail.jsp?id=" + studentId)`);

                    // 示例跳转代码（取消注释并修改为实际页面）
                    // window.location.href = `studentDetail.jsp?id=${studentId}`;
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