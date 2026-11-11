<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="es">
<%@include file="/WEB-INF/Shared/HeaderView.jsp" %>

<style>
    html, body {
        height: 100%;
    }
    
    body {
        display: flex;
        flex-direction: column;
        min-height: 100vh;
    }
    
    .main-content {
        flex: 1;
    }
</style>

<div class="container-fluid main-content my-5">
    <div class="row justify-content-center">
        <div class="col-lg-8 col-md-10 col-sm-12">
            
            <div class="card shadow border-0" style="border-radius: 1rem; overflow: hidden;">
                
                <!-- Header de Card -->
                <div class="card-header text-white text-center py-4" 
                     style="background: linear-gradient(135deg, #667eea, #764ba2);">
                    <h3 class="mb-0">Cálculo de Figuras Geométricas</h3>
                </div>
                
                <!-- Body de Card -->
                <div class="card-body p-4">
                    <form action="${pageContext.request.contextPath}/figuras" method="POST">
                        
                        <!-- Sección: Información -->
                        <div class="mb-4">
                            <h5 class="fw-bold mb-3" style="font-size: 1.05rem; color: #764ba2;">
                                Selecciona una Figura Geométrica
                            </h5>
                            <p class="text-muted small mb-0">Elige la figura y completa los datos requeridos</p>
                        </div>
                        
                        <!-- Alert de Información -->
                        <div class="alert d-flex flex-column gap-2 mb-4" 
                             style="background-color: #f2f3fc; border: 1px solid #e2e6fb;">
                            <div class="fw-bold" style="color: #764ba2;">
                                <i class="bi bi-info-circle me-2"></i>Figuras Disponibles
                            </div>
                            <ul class="list-unstyled mb-0 ms-1">
                                <li class="mb-1">
                                    <i class="bi bi-check-circle-fill me-2" style="color: #667eea;"></i>
                                    <strong>Cuadrado:</strong> Necesita solo el lado
                                </li>
                                <li class="mb-1">
                                    <i class="bi bi-check-circle-fill me-2" style="color: #667eea;"></i>
                                    <strong>Rectángulo:</strong> Necesita largo y ancho
                                </li>
                                <li class="mb-1">
                                    <i class="bi bi-check-circle-fill me-2" style="color: #667eea;"></i>
                                    <strong>Triángulo:</strong> Necesita base, altura y lados
                                </li>
                                <li class="mb-1">
                                    <i class="bi bi-check-circle-fill me-2" style="color: #667eea;"></i>
                                    <strong>Círculo:</strong> Necesita el radio
                                </li>
                                <li class="mb-0">
                                    <i class="bi bi-check-circle-fill me-2" style="color: #667eea;"></i>
                                    <strong>Pentágono:</strong> Necesita lado y apotema
                                </li>
                            </ul>
                        </div>
                        
                        <!-- Fieldset: Selección de Figura -->
                        <fieldset class="mb-4">
                            <legend class="fs-6 fw-bold border-bottom pb-2 mb-3" 
                                    style="color: #764ba2; border-color: #e2e6fb !important;">
                                Elegir Figura
                            </legend>
                            
                            <div class="mb-3">
                                <label for="figura" class="form-label">Figura Geométrica</label>
                                <select class="form-control border-2" 
                                        id="figura" 
                                        name="figura" 
                                        required
                                        style="border-color: #a9b8f2;">
                                    <option value="">-- Selecciona una figura --</option>
                                    <option value="Cuadrado">Cuadrado</option>
                                    <option value="Rectángulo">Rectángulo</option>
                                    <option value="Triángulo">Triángulo</option>
                                    <option value="Círculo">Círculo</option>
                                    <option value="Pentágono">Pentágono</option>
                                </select>
                                <div class="form-text">Selecciona la figura a calcular</div>
                            </div>
                        </fieldset>
                        
                        <!-- Fieldset: Campos Dinámicos -->
                        <fieldset class="mb-4">
                            <legend class="fs-6 fw-bold border-bottom pb-2 mb-3" 
                                    style="color: #764ba2; border-color: #e2e6fb !important;">
                                Parámetros
                            </legend>
                            
                            <!-- Campos Cuadrado -->
                            <div id="camposCuadrado" class="campos-figura d-none">
                                <div class="mb-3">
                                    <label for="ladoCuadrado" class="form-label">Lado (cm)</label>
                                    <input type="number" 
                                           class="form-control border-2" 
                                           id="ladoCuadrado" 
                                           name="ladoCuadrado" 
                                           placeholder="Ej. 5" 
                                           step="0.01" 
                                           min="0.01"
                                           style="border-color: #a9b8f2;">
                                    <div class="form-text">Medida del lado en centímetros</div>
                                </div>
                            </div>
                            
                            <!-- Campos Rectángulo -->
                            <div id="camposRectángulo" class="campos-figura d-none">
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <label for="largo" class="form-label">Largo (cm)</label>
                                        <input type="number" 
                                               class="form-control border-2" 
                                               id="largo" 
                                               name="largo" 
                                               placeholder="Ej. 8" 
                                               step="0.01" 
                                               min="0.01"
                                               style="border-color: #a9b8f2;">
                                        <div class="form-text">Medida del largo</div>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="ancho" class="form-label">Ancho (cm)</label>
                                        <input type="number" 
                                               class="form-control border-2" 
                                               id="ancho" 
                                               name="ancho" 
                                               placeholder="Ej. 5" 
                                               step="0.01" 
                                               min="0.01"
                                               style="border-color: #a9b8f2;">
                                        <div class="form-text">Medida del ancho</div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Campos Triángulo -->
                            <div id="camposTriángulo" class="campos-figura d-none">
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <label for="baseTriángulo" class="form-label">Base (cm)</label>
                                        <input type="number" 
                                               class="form-control border-2" 
                                               id="baseTriángulo" 
                                               name="baseTriángulo" 
                                               placeholder="Ej. 6" 
                                               step="0.01" 
                                               min="0.01"
                                               style="border-color: #a9b8f2;">
                                        <div class="form-text">Base del triángulo</div>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="alturaTriángulo" class="form-label">Altura (cm)</label>
                                        <input type="number" 
                                               class="form-control border-2" 
                                               id="alturaTriángulo" 
                                               name="alturaTriángulo" 
                                               placeholder="Ej. 4" 
                                               step="0.01" 
                                               min="0.01"
                                               style="border-color: #a9b8f2;">
                                        <div class="form-text">Altura del triángulo</div>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="lado1" class="form-label">Lado 1 (cm)</label>
                                        <input type="number" 
                                               class="form-control border-2" 
                                               id="lado1" 
                                               name="lado1" 
                                               placeholder="Ej. 5" 
                                               step="0.01" 
                                               min="0.01"
                                               style="border-color: #a9b8f2;">
                                        <div class="form-text">Primer lado</div>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="lado2" class="form-label">Lado 2 (cm)</label>
                                        <input type="number" 
                                               class="form-control border-2" 
                                               id="lado2" 
                                               name="lado2" 
                                               placeholder="Ej. 5" 
                                               step="0.01" 
                                               min="0.01"
                                               style="border-color: #a9b8f2;">
                                        <div class="form-text">Segundo lado</div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Campos Círculo -->
                            <div id="camposCirculo" class="campos-figura d-none">
                                <div class="mb-3">
                                    <label for="radio" class="form-label">Radio (cm)</label>
                                    <input type="number" 
                                           class="form-control border-2" 
                                           id="radio" 
                                           name="radio" 
                                           placeholder="Ej. 3.5" 
                                           step="0.01" 
                                           min="0.01"
                                           style="border-color: #a9b8f2;">
                                    <div class="form-text">Medida del radio en centímetros</div>
                                </div>
                            </div>
                            
                            <!-- Campos Pentágono -->
                            <div id="camposPentágono" class="campos-figura d-none">
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <label for="ladoPentágono" class="form-label">Lado (cm)</label>
                                        <input type="number" 
                                               class="form-control border-2" 
                                               id="ladoPentágono" 
                                               name="ladoPentágono" 
                                               placeholder="Ej. 5" 
                                               step="0.01" 
                                               min="0.01"
                                               style="border-color: #a9b8f2;">
                                        <div class="form-text">Medida del lado</div>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="apotema" class="form-label">Apotema (cm)</label>
                                        <input type="number" 
                                               class="form-control border-2" 
                                               id="apotema" 
                                               name="apotema" 
                                               placeholder="Ej. 3.44" 
                                               step="0.01" 
                                               min="0.01"
                                               style="border-color: #a9b8f2;">
                                        <div class="form-text">Distancia del centro al lado</div>
                                    </div>
                                </div>
                            </div>
                        </fieldset>
                        
                        <!-- Botón de Envío -->
                        <div class="d-grid mt-4">
                            <button type="submit" 
                                    class="btn btn-lg text-white fw-semibold"
                                    style="background: linear-gradient(135deg, #667eea, #764ba2); border: none;">
                                <i class="bi bi-calculator me-2"></i>Calcular
                            </button>
                        </div>
                    </form>
                </div>
                
                <!-- Footer de Card -->
                <div class="card-footer p-3 text-center" style="background-color: #f2f3fc; border-top: 1px solid #e2e6fb;">
                    <div class="alert border-0 rounded-3 mb-3 py-3 shadow-sm" role="alert" style="background-color: #f2f3fc;">
                        <strong class="fs-5" style="color: #764ba2;">Resultado</strong>
                    </div>
                    <div class="text-muted small fw-semibold pt-1">
                        Desarrollado por:  Matías Manuel Solano Pino / Adriel Mathias Guzmán Soria
                    </div>
                </div>
                
            </div>
        </div>
    </div>
</div>

<script>
    document.getElementById('figura').addEventListener('change', function() {
        document.querySelectorAll('.campos-figura').forEach(el => el.classList.add('d-none'));
        
        const figura = this.value;
        if (figura === 'Cuadrado') {
            document.getElementById('camposCuadrado').classList.remove('d-none');
        } else if (figura === 'Rectángulo') {
            document.getElementById('camposRectángulo').classList.remove('d-none');
        } else if (figura === 'Triángulo') {
            document.getElementById('camposTriángulo').classList.remove('d-none');
        } else if (figura === 'Círculo') {
            document.getElementById('camposCirculo').classList.remove('d-none');
        } else if (figura === 'Pentágono') {
            document.getElementById('camposPentágono').classList.remove('d-none');
        }
    });
</script>

<%@include file="/WEB-INF/Shared/FooterView.jsp" %>
