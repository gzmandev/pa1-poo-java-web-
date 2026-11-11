<%-- 
    FOOTER.JSP - Pie de página reutilizable (Versión delgada)
    Estilos idénticos al header
    Uso: En cada vista, agregar: <%@ include file="footer.jsp" %>
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* ESTILOS DEL FOOTER - Idénticos al Header */
        .footer-custom {
            background: linear-gradient(135deg, 
#667eea 0%, 
#764ba2 100%);
            box-shadow: 0 -4px 15px rgba(0, 0, 0, 0.2);
            padding: 1.5rem 0;
            margin-top: 3rem;
            color: white;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .footer-content {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
            gap: 1.5rem;
            text-align: center;
        }

        .footer-text {
            font-weight: 500;
            font-size: 0.95rem;
            margin: 0;
            transition: all 0.3s ease;
        }

        .footer-text:hover {
            transform: scale(1.05);
        }

        .footer-separator {
            width: 2px;
            height: 25px;
            background-color: rgba(255, 255, 255, 0.3);
        }

        @media (max-width: 768px) {
            .footer-content {
                flex-direction: column;
                gap: 0.8rem;
            }

            .footer-separator {
                width: 25px;
                height: 2px;
            }
        }
    </style>
</head>
<body>

<!-- FOOTER PRINCIPAL -->
<footer class="footer-custom">
    <div class="container-fluid">
        <div class="footer-content">
            <p class="footer-text">&copy; 2026 Todos los derechos reservados</p>
            <div class="footer-separator"></div>
            <p class="footer-text">Instituto San Ignacio De Loyola</p>
        </div>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>