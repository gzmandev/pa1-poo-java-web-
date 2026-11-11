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
<body>
    <title>Trapecio - EduMath</title>
<div class="container-fluid main-content my-5">
    <div class="row justify-content-center">
        <div class="col-lg-8 col-md-10 col-sm-12">
            <div class="card shadow border-0" style="border-radius: 1rem; overflow: hidden;">

                <!-- HEADER -->
                <div class="card-header text-white text-center py-4" style="background: linear-gradient(135deg, #667eea, #764ba2);">
                    <h3 class="mb-0">Cálculo de Trapecio</h3>
                </div>

                <!-- BODY -->
                <div class="card-body p-4">
                    <form action="${pageContext.request.contextPath}/trapecios" method="POST">

                        <!-- Título de sección -->
                        <div class="mb-4">
                            <h5 class="fw-bold mb-3" style="font-size: 1.05rem; color: #764ba2;">Ingresa los datos del Trapecio</h5>
                            <p class="text-muted small mb-0">Completa todos los campos requeridos</p>
                        </div>

                        <!-- BASES -->
                        <fieldset class="mb-4">
                            <legend class="fs-6 fw-bold border-bottom pb-2 mb-3" style="color: #764ba2; border-color: #e2e6fb !important;">
                                Bases del Trapecio
                            </legend>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label for="baseMenor" class="form-label">Base Menor AB (cm)</label>
                                    <input type="number" class="form-control border-2" id="baseMenor" name="baseMenor"
                                           placeholder="Ej. 11" step="0.01" min="0.01" required
                                           style="border-color: #a9b8f2;">
                                    <div class="form-text">Distancia AB</div>
                                </div>
                                <div class="col-md-6">
                                    <label for="baseMayor" class="form-label">Base Mayor DC (cm)</label>
                                    <input type="number" class="form-control border-2" id="baseMayor" name="baseMayor"
                                           placeholder="Ej. 15" step="0.01" min="0.01" required
                                           style="border-color: #a9b8f2;">
                                    <div class="form-text">Distancia DC</div>
                                </div>
                            </div>
                        </fieldset>

                        <!-- ALTURA Y LADOS -->
                        <fieldset class="mb-4">
                            <legend class="fs-6 fw-bold border-bottom pb-2 mb-3" style="color: #764ba2; border-color: #e2e6fb !important;">
                                Altura y Lados
                            </legend>
                            <div class="row g-3 mb-3">
                                <div class="col-md-6">
                                    <label for="altura" class="form-label">Altura (h) (cm)</label>
                                    <input type="number" class="form-control border-2" id="altura" name="altura"
                                           placeholder="Ej. 18.46" step="0.01" min="0.01" required
                                           style="border-color: #a9b8f2;">
                                    <div class="form-text">Distancia perpendicular</div>
                                </div>
                                <div class="col-md-6">
                                    <label for="ladoDM" class="form-label">Lado DM (cm)</label>
                                    <input type="number" class="form-control border-2" id="ladoDM" name="ladoDM"
                                           placeholder="Ej. 1.5" step="0.01" min="0.01" required
                                           style="border-color: #a9b8f2;">
                                    <div class="form-text">Lado oblicuo</div>
                                </div>
                            </div>
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label for="ladoDA" class="form-label">Lado DA (cm)</label>
                                    <input type="number" class="form-control border-2" id="ladoDA" name="ladoDA"
                                           placeholder="Ej. 8" step="0.01" min="0.01" required
                                           style="border-color: #a9b8f2;">
                                    <div class="form-text">Lado lateral</div>
                                </div>
                                <div class="col-md-6">
                                    <label for="ladoBC" class="form-label">Lado BC (cm)</label>
                                    <input type="number" class="form-control border-2" id="ladoBC" name="ladoBC"
                                           placeholder="Ej. 8" step="0.01" min="0.01" required
                                           style="border-color: #a9b8f2;">
                                    <div class="form-text">Lado lateral</div>
                                </div>
                            </div>
                        </fieldset>

                        <!-- INFORMACIÓN -->
                        <div class="alert d-flex flex-column gap-2 mb-4" style="background-color: #f2f3fc; border: 1px solid #e2e6fb;">
                            <div class="d-flex align-items-center gap-2 fw-bold" style="color: #764ba2;">
                                <i class="bi bi-info-circle"></i>
                                <span>Cálculos que se realizarán</span>
                            </div>
                            <ul class="list-unstyled mb-0 ms-1">
                                <li class="mb-1"><i class="bi bi-check-circle-fill me-2" style="color: #667eea;"></i>La altura del trapecio</li>
                                <li class="mb-1"><i class="bi bi-check-circle-fill me-2" style="color: #667eea;"></i>El área del triángulo DAM</li>
                                <li class="mb-0"><i class="bi bi-check-circle-fill me-2" style="color: #667eea;"></i>El perímetro total del trapecio</li>
                            </ul>
                        </div>

                        <!-- BOTÓN -->
                        <div class="d-grid mt-4">
                            <button type="submit" class="btn btn-lg text-white fw-semibold"
                                    style="background: linear-gradient(135deg, #667eea, #764ba2); border: none;">
                                <i class="bi bi-calculator me-2"></i>Calcular
                            </button>
                        </div>
                    </form>
                </div>

                <!-- FOOTER -->
                <div class="card-footer p-3 text-center" style="background-color: #f2f3fc; border-top: 1px solid #e2e6fb;">
                    <div class="alert border-0 rounded-3 mb-3 py-3 shadow-sm" role="alert" style="background-color: #f2f3fc;">
                        <strong class="fs-5" style="color: #764ba2;">Resultado</strong>
                    </div>
                    <div class="text-muted small fw-semibold pt-1">
                        Desarrollado por:  Jeferson Jara Huaman / Adriel Mathias Guzmán Soria
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<%@include file="/WEB-INF/Shared/FooterView.jsp" %>
</body>