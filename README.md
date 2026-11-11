# PA1poo — Proyecto POO 1 (Java Web, Jakarta EE)

**Curso:** Programación Orientada a Objetos  
**Tecnología:** Java 17, Jakarta EE 11-M1, Maven, Tomcat, JSP, Servlet

## Descripción

Proyecto Maven (WAR) con 6 módulos de práctica de POO en Java Web: conversión de monedas, cálculo de figuras geométricas, números romanos, teatro, trapecio y página de inicio.

## Servlets

| Servlet | URL | Descripción |
|---------|-----|-------------|
| HomeController | `/` | Página de inicio |
| TeatroController | `/teatro` | Módulo teatro |
| ConversionController | `/conversion` | Conversión de monedas |
| FiguraController | `/figuras` | Áreas de figuras geométricas |
| RomanosController | `/romanos` | Arábigo a romano (1-3999) |
| TrapecioController | `/trapecios` | Área y perímetro de trapecio |

## Estructura

```
PA1-PA1poo/
├── pom.xml
├── src/main/java/com/pa1poo/Controller/  # 6 Servlets
├── src/main/java/com/pa1poo/Model/       # Modelos de negocio
├── src/main/webapp/WEB-INF/View/*.jsp    # Vistas JSP
├── src/main/webapp/WEB-INF/web.xml       # Descriptor Servlet 3.1
└── target/  (excluido por .gitignore)
```

## Ejecución

1. Abre en Apache NetBeans.
2. Configura Apache Tomcat.
3. Ejecuta el proyecto (F6).

## Nota

- `FiguraController` tiene `@WebServlet(urlPatterns = {})` vacío; revisar si requiere mapeo explícito.
- Carpeta `target/` excluida por `.gitignore`.