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
                    <li><a href="#" class="text-gray-600 hover:text-primary transition-colors">课程信息</a></li>
                    <li><a href="#" class="text-gray-600 hover:text-primary transition-colors">成绩查询</a></li>
                    <li><a href="#" class="text-gray-600 hover:text-primary transition-colors">退出登录</a></li>
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
                    <p class="text-gray-600">查看您的学籍信息（只读）</p>
                </div>

                <!-- 信息卡片 - 静态数据示例，实际应用中可通过JavaScript动态填充 -->
                <div class="space-y-6 animate-slide-up" style="animation-delay: 0.2s">
                    <!-- 基础信息 -->
                    <div class="bg-blue-50 rounded-lg p-6 card-shadow">
                        <h3 class="section-title"><i class="fa fa-user-circle mr-2"></i>基本信息</h3>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <div>
                                <label class="field-label block mb-1">学号</label>
                                <div class="field-value student-field" data-field="student_id">20230001</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">姓名</label>
                                <div class="field-value student-field" data-field="name">张三</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">性别</label>
                                <div class="field-value student-field" data-field="gender">男</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">民族</label>
                                <div class="field-value student-field" data-field="nation">汉族</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">出生日期</label>
                                <div class="field-value student-field" data-field="birth_date">2000-01-15</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">身份证号</label>
                                <div class="field-value student-field" data-field="id_number">110101********1234</div>
                            </div>
                        </div>
                    </div>

                    <!-- 学籍信息 -->
                    <div class="bg-blue-50 rounded-lg p-6 card-shadow">
                        <h3 class="section-title"><i class="fa fa-graduation-cap mr-2"></i>学籍信息</h3>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <div>
                                <label class="field-label block mb-1">学院</label>
                                <div class="field-value student-field" data-field="college">计算机科学与技术学院</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">专业</label>
                                <div class="field-value student-field" data-field="major">软件工程</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">年级</label>
                                <div class="field-value student-field" data-field="grade">2023级</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">导师</label>
                                <div class="field-value student-field" data-field="mentor">李四教授</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">入学日期</label>
                                <div class="field-value student-field" data-field="entrance_date">2023-09-01</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">班级</label>
                                <div class="field-value student-field" data-field="class_id">软件研2301班</div>
                            </div>
                        </div>
                    </div>

                    <!-- 联系方式 -->
                    <div class="bg-blue-50 rounded-lg p-6 card-shadow">
                        <h3 class="section-title"><i class="fa fa-phone mr-2"></i>联系方式</h3>
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                            <div>
                                <label class="field-label block mb-1">手机号</label>
                                <div class="field-value student-field" data-field="phone_number">13800138000</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">邮箱</label>
                                <div class="field-value student-field" data-field="email">zhangsan@example.com</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">微信</label>
                                <div class="field-value student-field" data-field="wechat">zhangsan_2023</div>
                            </div>
                            <div>
                                <label class="field-label block mb-1">家庭地址</label>
                                <div class="field-value student-field" data-field="home_address">北京市海淀区中关村大街1号</div>
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

    <!-- JavaScript 动态填充数据示例（实际应用中可通过AJAX获取数据） -->
    <script>
        // 模拟学生数据，实际应用中可通过API获取
        const studentData = {
            id: 1,
            student_id: "20230001",
            name: "张三",
            gender: "男",
            nation: "汉族",
            birth_date: "2000-01-15",
            birth_place: "北京市",
            id_number: "110101********1234",
            country: "中国",
            home_address: "北京市海淀区中关村大街1号",
            phone_number: "13800138000",
            email: "zhangsan@example.com",
            dorm_id: "A-305",
            grade: 2023,
            college: "计算机科学与技术学院",
            major: "软件工程",
            campus: "主校区",
            entrance_date: "2023-09-01",
            class_id: "软件研2301班",
            wechat: "zhangsan_2023",
            qq: "123456789",
            home_phone_number: "010-12345678",
            home_contact_man: "张父",
            account_id: 1001,
            mentor_id: 501,
            mentor: "李四教授"
        };

        document.addEventListener('DOMContentLoaded', function() {
            // 动态填充学生数据
            const fields = document.querySelectorAll('.student-field');
            fields.forEach(field => {
                const fieldName = field.getAttribute('data-field');
                let fieldValue = studentData[fieldName];

                // 处理日期格式
                if (fieldName === 'birth_date' || fieldName === 'entrance_date') {
                    if (fieldValue) {
                        const date = new Date(fieldValue);
                        fieldValue = date.toISOString().split('T')[0]; // 格式化为 yyyy-MM-dd
                    } else {
                        fieldValue = '未填写';
                    }
                } else if (!fieldValue) {
                    fieldValue = '未填写';
                }

                field.textContent = fieldValue;
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