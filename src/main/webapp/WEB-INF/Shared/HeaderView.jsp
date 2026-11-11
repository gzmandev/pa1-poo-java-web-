<%-- 
    HEADER.JSP - Barra de navegación reutilizable
    Incluye: Logo editable, Navbar con Bootstrap
    Uso: En cada vista, agregar: <%@ include file="header.jsp" %>
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="es">
    <link href="../assets/css/style.css" rel="stylesheet" type="text/css"/>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Educación Interactiva</title>
    
    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome para iconos -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    
    <style>
        /* ESTILOS DEL HEADER - Diseño para jóvenes/niños */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .navbar-custom {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            padding: 1rem 0;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1030;
        }
        
        .navbar-brand {
            font-weight: bold;
            font-size: 1.5rem;
            color: white !important;
            display: flex;
            align-items: center;
            gap: 10px;
            transition: transform 0.3s ease;
        }
        
        .navbar-brand:hover {
            transform: scale(1.05);
        }
        
        .navbar-brand-logo {
            width: 45px;
            height: 45px;
            background: rgba(255, 255, 255, 0.3);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            border: 2px solid white;
        }
        
        .navbar-nav .nav-link {
            color: white !important;
            font-weight: 500;
            margin: 0 10px;
            padding: 0.75rem 0.5rem !important;
            border-radius: 8px;
            transition: all 0.3s ease;
            position: relative;
        }
        
        .navbar-nav .nav-link:hover {
            background-color: rgba(255, 255, 255, 0.2);
            transform: translateY(-2px);
        }
        
        .navbar-nav .nav-link.active {
            background-color: rgba(255, 255, 255, 0.3);
            border-bottom: 3px solid #FFD700;
        }
        
        .nav-icon {
            margin-right: 5px;
        }
        
        /* Estilo del toggler (menú móvil) */
        .navbar-toggler {
            border-color: rgba(255, 255, 255, 0.5);
        }
        
        .navbar-toggler-icon {
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 30 30'%3e%3cpath stroke='rgba(255, 255, 255, 0.8)' stroke-linecap='round' stroke-miterlimit='10' stroke-width='2' d='M4 7h22M4 15h22M4 23h22'/%3e%3c/svg%3e");
        }
        
        /* Animación suave en los enlaces */
        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-5px); }
        }
        
        .navbar-nav .nav-link:active {
            animation: bounce 0.4s ease;
        }
    </style>
</head>
<body>

<!-- NAVBAR PRINCIPAL -->
<nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
    <div class="container-fluid px-4">
        
        <!-- LOGO Y NOMBRE (EDITABLE) -->
         <a class="navbar-brand" href="${pageContext.request.contextPath}/home">
            <div class="navbar-brand-logo">
                <i class="bi bi-book"></i> <!-- CAMBIAR ESTE ICONO AQUÍ - Ver opciones abajo -->
            </div>
            <span>EduMath</span> <!-- CAMBIAR EL NOMBRE AQUÍ -->
        </a>
        
        <!-- BOTÓN TOGGLER (para móvil) -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" 
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <!-- MENÚ NAVEGACIÓN -->
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/home">
                        <i class="nav-icon fas fa-home"></i>Home
                    </a>
                </li>
                
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/trapecios">
                        <i class="nav-icon fas fa-shapes"></i>Trapecios
                    </a>
                </li>
                
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/figuras">
                        <i class="nav-icon fas fa-star"></i>Figuras
                    </a>
                </li>
                
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/romanos">
                        <i class="nav-icon fas fa-scroll"></i>Romanos
                    </a>
                </li>
                
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/teatro">
                        <i class="nav-icon fas fa-masks-theater"></i>Teatro
                    </a>
                </li>
                
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/conversion">
                        <i class="nav-icon fas fa-exchange-alt"></i>Conversión
                    </a>
                </li>
                
            </ul>
        </div>
        
    </div>
</nav>

<!-- Bootstrap JS (necesario para que funcione el toggle) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>