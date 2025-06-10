<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>研究生学籍管理系统</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Microsoft YaHei", sans-serif;
        }

        body {
            background: linear-gradient(135deg, #e8f3ff 0%, #ffffff 100%);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            overflow-x: hidden;
        }

        /* 主内容居中容器 */
        .content-center {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 2rem;
            text-align: center;
            max-width: 800px;
            margin: 0 auto;
        }

        /* 标题样式 */
        .title {
            font-size: clamp(2.5rem, 6vw, 4rem);
            font-weight: bold;
            color: #165DFF;
            margin-bottom: 1.5rem;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
            line-height: 1.2;
        }

        /* 副标题样式 */
        .subtitle {
            font-size: clamp(1.25rem, 3vw, 1.75rem);
            color: #333;
            margin-bottom: 3rem;
            opacity: 0.9;
        }

        /* 登录按钮样式 */
        .login-button {
            background: #165DFF;
            color: white;
            font-size: clamp(1.25rem, 3vw, 1.5rem);
            padding: 1rem 3rem;
            border-radius: 2rem;
            text-decoration: none;
            font-weight: 500;
            box-shadow: 0 8px 20px rgba(22, 93, 255, 0.25);
            transition: all 0.3s ease;
        }

        .login-button:hover {
            background: #0D2B93;
            transform: translateY(-3px);
            box-shadow: 0 12px 25px rgba(22, 93, 255, 0.35);
        }

        /* 页脚样式 */
        footer {
            position: fixed;
            bottom: 1rem;
            left: 1rem;
            color: #666;
            font-size: 0.9rem;
            background: rgba(255, 255, 255, 0.7);
            padding: 0.5rem 1rem;
            border-radius: 0.5rem;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }

        /* 装饰元素 */
        .decor-circle {
            position: absolute;
            width: 200px;
            height: 200px;
            border-radius: 50%;
            background: rgba(54, 191, 250, 0.1);
            z-index: -1;
        }

        .decor-circle.top {
            top: -100px;
            right: -100px;
        }

        .decor-circle.bottom {
            bottom: -100px;
            left: -100px;
        }
    </style>
</head>
<body>
    <!-- 装饰元素 -->
    <div class="decor-circle top"></div>
    <div class="decor-circle bottom"></div>

    <!-- 主内容 -->
    <div class="content-center">
        <h1 class="title">研究生学籍管理系统</h1>
        <p class="subtitle">高效便捷的学籍管理平台，为您提供一站式服务体验</p>
        <a href="login.jsp" class="login-button">
            <i class="fa fa-sign-in mr-1"></i> 立即登录
        </a>
    </div>

    <!-- 页脚 -->
    <footer>
        © 2025 某大学研究生院 | 技术支持：信息中心
    </footer>
</body>
</html>