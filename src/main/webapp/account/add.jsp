<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "com.service.AccountService" %>
<html lang="zh-CN">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>账号添加系统</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" rel="stylesheet">
  <script>
    tailwind.config = {
      theme: {
        extend: {
          colors: {
            primary: '#165DFF',
            secondary: '#36CFC9',
            neutral: '#F2F3F5',
            dark: '#1D2129',
          },
          fontFamily: {
            inter: ['Inter', 'system-ui', 'sans-serif'],
          },
        }
      }
    }
  </script>
  <style type="text/tailwindcss">
    @layer utilities {
            .content-auto {
                content-visibility: auto;
            }
            .shadow-soft {
                box-shadow: 0 2px 15px rgba(0, 0, 0, 0.05);
            }
            .transition-custom {
                transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            }
        }
  </style>
</head>

<div id="app" class="bg-gray-50 font-inter text-dark min-h-screen flex flex-col">

  <main class="xl:grid xl:grid-cols-2 lg:gap-8 flex-grow container mx-auto px-4 py-8">

    <div class="bg-white rounded-xl shadow-soft p-6 md:p-8 mb-8 transform hover:translate-y-[-2px] transition-custom">
      <div class="flex items-center justify-between mb-6">
        <h2 class="text-[clamp(1.5rem,3vw,2rem)] font-bold text-dark">添加新账号</h2>
      </div>

      <form id="accountForm" class="space-y-6" method="post" action="/myapp/account/add">
        <div class="space-y-5">
          <div class="space-y-2">
            <label for="name" class="block font-medium text-gray-700">
              姓名
            </label>
            <div class="relative">
              <span class="absolute inset-y-0 left-0 flex items-center pl-3 text-gray-500">
                <i class="fa fa-user"></i>
              </span>
              <input type="text" id="name" name="name" required
                class="block w-full pl-10 pr-3 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary/50 focus:border-primary outline-none transition-custom"
                placeholder="请输入账号名">
            </div>
            <p class="text-xs text-gray-500">姓名必须要是人名</p>
          </div>

          <div class="space-y-2">
            <label for="username" class="block font-medium text-gray-700">
              账号名
            </label>
            <div class="relative">
              <span class="absolute inset-y-0 left-0 flex items-center pl-3 text-gray-500">
                <i class="fa fa-user"></i>
              </span>
              <input type="text" id="username" name="username" required
                class="block w-full pl-10 pr-3 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary/50 focus:border-primary outline-none transition-custom"
                placeholder="请输入账号名">
            </div>
            <p class="text-xs text-gray-500">账号名长度应为4-20个字符，可包含字母、数字和下划线</p>
          </div>

          <div class="space-y-2">
            <label for="password" class="block font-medium text-gray-700">
              密码
            </label>
            <div class="relative">
              <span class="absolute inset-y-0 left-0 flex items-center pl-3 text-gray-500">
                <i class="fa fa-lock"></i>
              </span>
              <input type="password" id="password" name="password" required
                class="block w-full pl-10 pr-10 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary/50 focus:border-primary outline-none transition-custom"
                placeholder="请输入密码">
              <button type="button" id="togglePassword"
                class="absolute inset-y-0 right-0 flex items-center pr-3 text-gray-500 hover:text-gray-700 transition-custom">
                <i class="fa fa-eye-slash"></i>
              </button>
            </div>
            <p class="text-xs text-gray-500">密码长度应为8-20个字符，需包含大小写字母和数字</p>
          </div>

          <div class="space-y-2">
            <label for="role" class="block font-medium text-gray-700">
              身份
            </label>
            <div class="relative">
              <span class="absolute inset-y-0 left-0 flex items-center pl-3 text-gray-500">
                <i class="fa fa-id-card"></i>
              </span>
              <select id="role" name="role" required
                class="block w-full pl-10 pr-10 py-2.5 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary/50 focus:border-primary outline-none transition-custom appearance-none bg-white">
                <option value="">请选择身份</option>
                <option value="student">研究生</option>
                <option value="mentor">导师</option>
                <option value="secretary">学院研究生秘书</option>
                <option value="college_leader">学院领导</option>
                <option value="student_manager">研究生院管理员</option>
                <option value="student_leader">研究生院领导</option>
                <option value="university_leader">学校领导</option>
                <option value="system_manager">系统管理员</option>
                <option value="audit_manager">审计管理员</option>
              </select>
              <div class="pointer-events-none absolute inset-y-0 right-0 flex items-center px-3 text-gray-500">
                <i class="fa fa-chevron-down text-xs"></i>
              </div>
            </div>
          </div>
        </div>

        <div class="flex justify-end space-x-4 pt-4 ">
          <button type="submit"
            class="px-5 py-2.5 bg-primary text-white rounded-lg hover:bg-primary/90 transition-custom shadow-md hover:shadow-lg flex items-center">
            <i class="fa fa-check-circle mr-2"></i> 提交
          </button>
        </div>
      </form>
    </div>

    <div class="bg-white rounded-xl shadow-soft p-6 md:p-8 transform hover:translate-y-[-2px] transition-custom">
      <h3 class="text-xl font-semibold mb-6 flex items-center">
        <i class="fa fa-table text-primary mr-2"></i> 账号列表预览
      </h3>
      <div class="overflow-x-auto">
        <table class="min-w-full divide-y divide-gray-200">
          <thead class="bg-gray-50">
            <tr>
              <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">账号名
              </th>
              <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">身份
              </th>
              <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">
                密码修改时间</th>
              <th scope="col" class="px-6 py-3 text-right text-xs font-medium text-gray-500 uppercase tracking-wider">操作
              </th>
            </tr>
          </thead>
          <tbody class="bg-white divide-y divide-gray-200">
            <% for (var account : AccountService.getAll()) { %>
            <tr class="hover:bg-gray-50 transition-custom">
              <td class="px-6 py-4 whitespace-nowrap">
                <div class="flex items-center">
                  <div :class="`text-${colorOf( '<%= account.getRole() %>' )}-600`"
                    class="h-8 w-8 bg-blue-100 rounded-full flex items-center justify-center mr-3">
                    <i class="fa fa-user"></i>
                  </div>
                  <div>
                    <div class="text-sm font-medium text-gray-900"><%= account.getUsername() %></div>
                  </div>
                </div>
              </td>
              <td class="px-6 py-4 whitespace-nowrap">
                <span class="px-2 inline-flex text-xs leading-5 font-semibold rounded-full"
                      :class="`bg-${colorOf('<%= account.getRole() %>')}-100 text-${colorOf('<%= account.getRole() %>')}-800`">
                      <%= account.getRole() %>
                </span>
              </td>
              <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">
                  <%= account.getLastPasswordChangeDate() %>
              </td>

              <td class="px-6 py-4 whitespace-nowrap text-right text-sm font-medium">
                <a href="#" class="text-indigo-600 hover:text-indigo-900 mr-3">
                  <i class="fa fa-edit"></i>
                </a>
                <a href="#" class="text-red-600 hover:text-red-900">
                  <i class="fa fa-trash"></i>
                </a>
              </td>
            </tr>
            <% } %>
          </tbody>
        </table>
      </div>
    </div>
  </main>

</div>

<script>
  const {createApp} = Vue
  const color_map = {
    student: 'blue',
    mentor: 'purple',
    secretary: 'green',
    college_leader: 'yellow',
    student_manager: 'red',
    student_leader: 'indigo',
    university_leader: 'pink',
    system_manager: 'gray',
    audit_manager: 'teal',
  }

  createApp({
    methods: {
      colorOf(role) {
        return color_map[role] || 'blue'
      }
    }
  }).mount('#app')
</script>

</html>
