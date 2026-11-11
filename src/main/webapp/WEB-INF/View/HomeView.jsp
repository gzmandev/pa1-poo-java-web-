<%-- 
    HomeView.jsp MEJORADO V3 - Con tarjetas de integrantes y curso
    Muestra el nombre del curso y los integrantes con sus contribuciones
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - EduMath</title>
    
    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <!-- Google Fonts para mejor tipografía -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Poppins:wght@600;700&display=swap" rel="stylesheet">
    
    <style>
        /* ESTILOS GENERALES */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            background: linear-gradient(135deg, #f5f7fb 0%, #e9ecef 100%);
            font-family: 'Inter', sans-serif;
            color: #2d3748;
        }
        
        main {
            flex: 1;
            padding: 3rem 0;
        }
        
        .container-custom {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 1.5rem;
        }
        
        /* SECCIÓN HERO MEJORADA */
        .hero-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 4rem 2rem;
            border-radius: 20px;
            text-align: center;
            margin-bottom: 4rem;
            box-shadow: 0 10px 40px rgba(102, 126, 234, 0.3);
            position: relative;
            overflow: hidden;
        }
        
        .hero-section::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -50%;
            width: 400px;
            height: 400px;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 50%;
            z-index: 0;
        }
        
        .hero-section > * {
            position: relative;
            z-index: 1;
        }
        
        .hero-section h1 {
            font-family: 'Poppins', sans-serif;
            font-size: 3rem;
            font-weight: 700;
            margin-bottom: 1rem;
            letter-spacing: -0.5px;
        }
        
        .hero-section p {
            font-size: 1.2rem;
            margin-bottom: 2rem;
            opacity: 0.95;
            font-weight: 300;
        }
        
        .btn-custom {
            background: rgba(255, 255, 255, 0.2);
            color: white;
            border: 2px solid white;
            border-radius: 10px;
            padding: 0.9rem 2rem;
            font-weight: 600;
            transition: all 0.3s ease;
            display: inline-block;
            cursor: pointer;
            text-decoration: none;
        }
        
        .btn-custom:hover {
            background: white;
            color: #667eea;
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }
        
        /* TARJETA DE CONTENIDO MEJORADA */
        .card-content {
            background: white;
            border-radius: 18px;
            padding: 3rem;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
            margin-bottom: 4rem;
            transition: all 0.3s ease;
            border: 1px solid rgba(102, 126, 234, 0.1);
        }
        
        .card-content:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 40px rgba(102, 126, 234, 0.15);
        }
        
        .card-content h2 {
            font-family: 'Poppins', sans-serif;
            color: #667eea;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 12px;
            font-size: 1.8rem;
            font-weight: 700;
        }
        
        .card-content p {
            color: #555;
            line-height: 1.8;
            font-size: 1rem;
            margin-bottom: 1rem;
        }
        
        .card-content p:last-child {
            margin-bottom: 0;
        }
        
        /* SECCIÓN DE CURSO */
        .course-section {
            background: white;
            border-radius: 18px;
            padding: 3rem;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
            margin-bottom: 4rem;
            border-left: 6px solid #667eea;
            border: 1px solid rgba(102, 126, 234, 0.1);
            border-left: 6px solid #667eea;
        }
        
        .course-section h2 {
            font-family: 'Poppins', sans-serif;
            color: #667eea;
            margin-bottom: 1.5rem;
            font-size: 1.8rem;
            font-weight: 700;
            display: flex;
            align-items: center;
            gap: 12px;
        }
        
        .course-name {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 1.5rem;
            border-radius: 12px;
            font-size: 1.4rem;
            font-weight: 700;
            text-align: center;
            font-family: 'Poppins', sans-serif;
        }
        
        /* SECCIÓN DE INTEGRANTES */
        .section-title {
            font-family: 'Poppins', sans-serif;
            color: #667eea;
            margin-top: 3rem;
            margin-bottom: 2.5rem;
            font-size: 1.8rem;
            font-weight: 700;
            display: flex;
            align-items: center;
            gap: 12px;
        }
        
        .grid-members {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-bottom: 2rem;
            justify-items: center;
        }
        
        .member-card {
            width: 100%;
            max-width: 330px;
        }
        
        /* TARJETAS DE INTEGRANTES */
        .member-card {
            background: white;
            border-radius: 18px;
            padding: 2.5rem 2rem;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.08);
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            border: 2px solid transparent;
            position: relative;
            overflow: hidden;
            display: flex;
            flex-direction: column;
        }
        
        /* Línea superior degradada */
        .member-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 5px;
            background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
        }
        
        /* Fondo decorativo */
        .member-card::after {
            content: '';
            position: absolute;
            width: 100px;
            height: 100px;
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.1) 0%, rgba(118, 75, 162, 0.1) 100%);
            border-radius: 50%;
            top: -30px;
            right: -30px;
            z-index: 0;
        }
        
        .member-card:hover {
            transform: translateY(-12px);
            box-shadow: 0 20px 50px rgba(102, 126, 234, 0.25);
            border-color: #667eea;
        }
        
        /* Avatar del integrante */
        .member-avatar {
            position: relative;
            z-index: 1;
            width: 80px;
            height: 80px;
            margin: 0 auto 1.5rem;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2.5rem;
            color: white;
            box-shadow: 0 8px 20px rgba(102, 126, 234, 0.3);
        }
        
        /* Información del integrante */
        .member-info {
            position: relative;
            z-index: 1;
            text-align: center;
            flex-grow: 1;
        }
        
        .member-card h3 {
            font-family: 'Poppins', sans-serif;
            color: #667eea;
            margin-bottom: 0.5rem;
            font-size: 1.3rem;
            font-weight: 700;
        }
        
        .member-role {
            color: #764ba2;
            font-size: 0.95rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
            display: inline-block;
            background: rgba(102, 126, 234, 0.1);
            padding: 0.4rem 1rem;
            border-radius: 20px;
        }
        
        .member-contributions {
            margin-top: 1.5rem;
            padding-top: 1.5rem;
            border-top: 1px solid #e2e6fb;
            /* La sección de contribuciones ya no hereda el centrado del padre */
            text-align: left;
        }
        
        .contribution-label {
            color: #764ba2;
            font-size: 0.85rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 0.8rem;
            display: block;
            text-align: center; /* la etiqueta "CONTRIBUCIONES" se mantiene centrada */
        }
        
        .contribution-items {
            list-style: none;
            text-align: left;
        }
        
        .contribution-items li {
            color: #666;
            font-size: 0.9rem;
            margin-bottom: 0.6rem;
            display: flex;
            align-items: flex-start;
            gap: 0.6rem;
            text-align: left;
            line-height: 1.45;
        }
        
        .contribution-items li:last-child {
            margin-bottom: 0;
        }
        
        .contribution-items li::before {
            content: '✓';
            color: #667eea;
            font-weight: bold;
            flex-shrink: 0;
            margin-top: 0.15rem;
        }
        
        .contribution-items li span {
            flex: 1;
        }
        
        /* RESPONSIVE */
        @media (max-width: 768px) {
            .hero-section {
                padding: 3rem 1.5rem;
            }
            
            .hero-section h1 {
                font-size: 2rem;
            }
            
            .hero-section p {
                font-size: 1rem;
            }
            
            .card-content,
            .course-section {
                padding: 2rem;
            }
            
            .card-content h2,
            .course-section h2 {
                font-size: 1.5rem;
            }
            
            .grid-members {
                grid-template-columns: 1fr;
                gap: 1.5rem;
            }
            
            .section-title {
                font-size: 1.5rem;
            }
            
            main {
                padding: 2rem 0;
            }
            
            .course-name {
                font-size: 1.2rem;
            }
        }
        
        @media (max-width: 480px) {
            .hero-section h1 {
                font-size: 1.5rem;
            }
            
            .btn-custom {
                padding: 0.8rem 1.5rem;
                font-size: 0.95rem;
            }
            
            .member-card {
                padding: 1.5rem;
            }
            
            .member-avatar {
                width: 70px;
                height: 70px;
                font-size: 2rem;
            }
            
            .member-card h3 {
                font-size: 1.1rem;
            }
        }
    </style>
</head>
<body>

    <!-- INCLUIR HEADER -->
    <%@ include file="/WEB-INF/Shared/HeaderView.jsp" %>
    
    <!-- CONTENIDO PRINCIPAL -->
    <main>
        <div class="container-custom">
            
            <!-- SECCIÓN HERO -->
            <div class="hero-section">
                <h1>
                    <i class="bi bi-book-half"></i>
                    Bienvenido a EduMath
                </h1>
                <p>La plataforma donde el aprendizaje es divertido y fácil de entender</p>
                <button class="btn-custom">
                    <i class="bi bi-play-circle"></i> Comienza a Aprender
                </button>
            </div>
            
            <!-- SECCIÓN DEL CURSO -->
            <div class="course-section">
                <h2>
                    <i class="bi bi-file-earmark-text"></i> Información del Curso
                </h2>
                <div class="course-name">
                    Programacion Orientada a Objetos - Proyecto EduMath
                </div>
            </div>
            
            <!-- CONTENIDO PRINCIPAL -->
            <div class="card-content">
                <h2>
                    <i class="bi bi-info-circle"></i> ¿Qué es EduMath?
                </h2>
                <p>
                    EduMath es una plataforma educativa diseñada especialmente para jóvenes y niños 
                    que desean aprender matemáticas, historia y arte de una forma divertida e interactiva.
                </p>
                <p>
                    Aquí encontrarás lecciones sobre trapecios, figuras geométricas, números romanos, 
                    conversiones y mucho más. ¡Todo de una manera colorida y entretenida!
                </p>
            </div>
            
            <!-- SECCIÓN DE INTEGRANTES -->
            <h2 class="section-title">
                <i class="bi bi-people-fill"></i> Equipo de Desarrollo
            </h2>
            <div class="grid-members">
                
                <!-- INTEGRANTE 1 -->
                <div class="member-card">
                    <div class="member-avatar">
                        <i class="bi bi-person-circle"></i>
                    </div>
                    <div class="member-info">
                        <h3>Adriel Mathias Guzmán Soria</h3>
                        <span class="member-role">Arquitecto de Proyecto</span>
                        <div class="member-contributions">
                            <span class="contribution-label">Contribuciones:</span>
                            <ul class="contribution-items">
                                <li><span>Diseño de arquitectura general</span></li>
                                <li><span>Integración de módulos y componentes</span></li>
                                <li><span>Desarrollo de CSS y estilos globales</span></li>
                                <li><span>Implementación del patrón MVC</span></li>
                                <li><span>Implementación MVC Teatro</span></li>
                                <li><span>Testing y corrección de bugs</span></li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                <!-- INTEGRANTE 2 -->
                <div class="member-card">
                    <div class="member-avatar">
                        <i class="bi bi-person-circle"></i>
                    </div>
                    <div class="member-info">
                        <h3>Richard Jose Gonzalez Cordova</h3>
                        <span class="member-role">Developer Frontend</span>
                        <div class="member-contributions">
                            <span class="contribution-label">Contribuciones:</span>
                            <ul class="contribution-items">
                                <li><span>Desarrollo UI/UX interactivo</span></li>
                                <li><span>Implementación MVC Números Romanos</span></li>
                                <li><span>Integración de vistas y controladores</span></li>
                                <li><span>Conectar componentes y modelos</span></li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                <!-- INTEGRANTE 3 -->
                <div class="member-card">
                    <div class="member-avatar">
                        <i class="bi bi-person-circle"></i>
                    </div>
                    <div class="member-info">
                        <h3>Leandro Jerek Salas Bustos</h3>
                        <span class="member-role">Developer Frontend</span>
                        <div class="member-contributions">
                            <span class="contribution-label">Contribuciones:</span>
                            <ul class="contribution-items">
                                <li><span>Desarrollo UI/UX interactivo</span></li>
                                <li><span>Implementación MVC Conversión</span></li>
                                <li><span>Integración de vistas y controladores</span></li>
                                <li><span>Conectar componentes y modelos</span></li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                <!-- INTEGRANTE 4 -->
                <div class="member-card">
                    <div class="member-avatar">
                        <i class="bi bi-person-circle"></i>
                    </div>
                    <div class="member-info">
                        <h3>Matías Manuel Solano Pino</h3>
                        <span class="member-role">Developer Frontend</span>
                        <div class="member-contributions">
                            <span class="contribution-label">Contribuciones:</span>
                            <ul class="contribution-items">
                                <li><span>Desarrollo UI/UX interactivo</span></li>
                                <li><span>Implementación MVC Figuras Geométricas</span></li>
                                <li><span>Integración de vistas y controladores</span></li>
                                <li><span>Conectar componentes y modelos</span></li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                <!-- INTEGRANTE 5 -->
                <div class="member-card">
                    <div class="member-avatar">
                        <i class="bi bi-person-circle"></i>
                    </div>
                    <div class="member-info">
                        <h3>Jeferson Jara Huaman</h3>
                        <span class="member-role">Developer Frontend</span>
                        <div class="member-contributions">
                            <span class="contribution-label">Contribuciones:</span>
                            <ul class="contribution-items">
                                <li><span>Desarrollo UI/UX interactivo</span></li>
                                <li><span>Implementación MVC Cálculo de Trapecios</span></li>
                                <li><span>Integración de vistas y controladores</span></li>
                                <li><span>Conectar componentes y modelos</span></li>
                            </ul>
                        </div>
                    </div>
                </div>
                
            </div>
            
        </div>
    </main>
    
    <!-- INCLUIR FOOTER -->
    <%@ include file="/WEB-INF/Shared/FooterView.jsp" %>
    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
</body>
</html>
