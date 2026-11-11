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
                    <h3 class="mb-0">Sistema de Venta de Entradas - Teatro</h3>
                </div>
                
                <!-- Body de Card -->
                <div class="card-body p-4">
                    <form action="${pageContext.request.contextPath}/teatro" method="POST">
                        
                        <!-- Sección: Información de Perfiles -->
                        <div class="mb-4">
                            <h5 class="fw-bold mb-3" style="font-size: 1.05rem; color: #764ba2;">
                                Información de Perfiles
                            </h5>
                            <p class="text-muted small mb-3">Consulta los precios y edades de cada categoría</p>
                        </div>
                        
                        <!-- Alert de Información -->
                        <div class="alert d-flex flex-column gap-2 mb-4" 
                             style="background-color: #f2f3fc; border: 1px solid #e2e6fb;">
                            <div class="fw-bold" style="color: #764ba2;">
                                <i class="bi bi-info-circle me-2"></i>Categorías de Entradas
                            </div>
                            <ul class="list-unstyled mb-0 ms-1">
                                <li class="mb-2">
                                    <i class="bi bi-check-circle-fill me-2" style="color: #667eea;"></i>
                                    <strong>Niños:</strong> Menores a 8 años - S/. 150
                                </li>
                                <li class="mb-2">
                                    <i class="bi bi-check-circle-fill me-2" style="color: #667eea;"></i>
                                    <strong>Adolescente:</strong> 8 a 12 años - S/. 180
                                </li>
                                <li class="mb-2">
                                    <i class="bi bi-check-circle-fill me-2" style="color: #667eea;"></i>
                                    <strong>Adulto:</strong> 12 a 59 años - S/. 220
                                </li>
                                <li class="mb-0">
                                    <i class="bi bi-check-circle-fill me-2" style="color: #667eea;"></i>
                                    <strong>Adulto Mayor:</strong> 60 años en adelante - S/. 200
                                </li>
                            </ul>
                        </div>
                        
                        <!-- Fieldset: Formulario de Compra -->
                        <fieldset class="mb-4">
                            <legend class="fs-6 fw-bold border-bottom pb-2 mb-3" 
                                    style="color: #764ba2; border-color: #e2e6fb !important;">
                                Formulario de Compra
                            </legend>
                            
                            <div class="row g-3">
                                <!-- Seleccionar Perfil -->
                                <div class="col-md-6">
                                    <label for="perfil" class="form-label">Selecciona Perfil</label>
                                    <select class="form-control border-2" 
                                            id="perfil" 
                                            name="perfil" 
                                            required
                                            style="border-color: #a9b8f2;">
                                        <option value="">-- Selecciona un perfil --</option>
                                        <option value="Niños">Niños (Menores a 8 años)</option>
                                        <option value="Adolescente">Adolescente (8 a 12 años)</option>
                                        <option value="Adulto">Adulto (12 a 59 años)</option>
                                        <option value="Adulto Mayor">Adulto Mayor (60 años en adelante)</option>
                                    </select>
                                    <div class="form-text">Elige la categoría que corresponda</div>
                                </div>
                                
                                <!-- Número de Entradas -->
                                <div class="col-md-6">
                                    <label for="numEntradas" class="form-label">Número de Entradas</label>
                                    <input type="number" 
                                           class="form-control border-2" 
                                           id="numEntradas" 
                                           name="numEntradas" 
                                           placeholder="Ej. 5" 
                                           min="1" 
                                           max="100" 
                                           required
                                           style="border-color: #a9b8f2;">
                                    <div class="form-text">Cantidad de entradas a comprar</div>
                                </div>
                                
                                <!-- Día de la Semana -->
                                <div class="col-md-6">
                                    <label for="dia" class="form-label">Día de la Semana</label>
                                    <select class="form-control border-2" 
                                            id="dia" 
                                            name="dia" 
                                            required
                                            style="border-color: #a9b8f2;">
                                        <option value="">-- Selecciona un día --</option>
                                        <option value="Lunes">Lunes</option>
                                        <option value="Martes">Martes</option>
                                        <option value="Miércoles">Miércoles</option>
                                        <option value="Jueves">Jueves</option>
                                        <option value="Viernes">Viernes</option>
                                        <option value="Sábado">Sábado</option>
                                        <option value="Domingo">Domingo</option>
                                        <option value="Feriado">Feriado</option>
                                    </select>
                                    <div class="form-text">Selecciona el día de presentación</div>
                                </div>
                            </div>
                        </fieldset>
                        
                        <!-- Botón de Envío -->
                        <div class="d-grid mt-4">
                            <button type="submit" 
                                    class="btn btn-lg text-white fw-semibold"
                                    style="background: linear-gradient(135deg, #667eea, #764ba2); border: none;">
                                <i class="bi bi-calculator me-2"></i>Calcular Precio Total
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
                        Desarrollado por: Adriel Mathias Guzmán Soria

                    </div>
                </div>
                
            </div>
        </div>
    </div>
</div>

<%@include file="/WEB-INF/Shared/FooterView.jsp" %>
