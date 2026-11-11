<%@ page contentType="text/html;charset=UTF-8"%>

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
    <%@ include file="/WEB-INF/Shared/HeaderView.jsp" %>
<div class="container-fluid main-content my-5">
    <div class="row justify-content-center">
        <div class="col-lg-8 col-md-10 col-sm-12">
            
            <!-- MOSTRAR ERRORES SI LOS HAY -->
            <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <strong>
                        <i class="bi bi-exclamation-triangle-fill me-2"></i>Error
                    </strong> ${error}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            <% } %>
            
            <!-- CARD PRINCIPAL -->
            <div class="card shadow border-0" style="border-radius: 1rem; overflow: hidden;">
                
                <!-- Header de Card -->
                <div class="card-header text-white text-center py-4" 
                     style="background: linear-gradient(135deg, #667eea, #764ba2);">
                    <h3 class="mb-0">Conversor de Monedas</h3>
                </div>
                
                <!-- Body de Card - Formulario de Entrada -->
                <div class="card-body p-4">
                    
                    <!-- Sección: Información -->
                    <div class="mb-4">
                        <h5 class="fw-bold mb-3" style="font-size: 1.05rem; color: #764ba2;">
                            Ingresa los Datos de Conversión
                        </h5>
                        <p class="text-muted small mb-0">Completa los campos para realizar la conversión</p>
                    </div>
                    
                    <!-- Alert de Información -->
                    <div class="alert d-flex flex-column gap-2 mb-4" 
                         style="background-color: #f2f3fc; border: 1px solid #e2e6fb;">
                        <div class="fw-bold" style="color: #764ba2;">
                            <i class="bi bi-info-circle me-2"></i>Monedas Disponibles
                        </div>
                        <ul class="list-unstyled mb-0 ms-1">
                            <li class="mb-1">
                                <i class="bi bi-check-circle-fill me-2" style="color: #667eea;"></i>
                                <strong>USD:</strong> Dólar Americano
                            </li>
                            <li class="mb-1">
                                <i class="bi bi-check-circle-fill me-2" style="color: #667eea;"></i>
                                <strong>EUR:</strong> Euro
                            </li>
                            <li class="mb-1">
                                <i class="bi bi-check-circle-fill me-2" style="color: #667eea;"></i>
                                <strong>MXN:</strong> Peso Mexicano
                            </li>
                            <li class="mb-0">
                                <i class="bi bi-check-circle-fill me-2" style="color: #667eea;"></i>
                                <strong>PEN:</strong> Sol Peruano
                            </li>
                        </ul>
                    </div>
                    
                    <!-- Fieldset: Formulario -->
                    <fieldset class="mb-4">
                        <legend class="fs-6 fw-bold border-bottom pb-2 mb-3" 
                                style="color: #764ba2; border-color: #e2e6fb !important;">
                            Datos de la Conversión
                        </legend>
                        
                        <form method="POST" action="conversion">
                            
                            <div class="row g-3">
                                <!-- Monto -->
                                <div class="col-md-12">
                                    <label for="txtMonto" class="form-label">Monto a Convertir</label>
                                    <input type="number" 
                                           class="form-control border-2" 
                                           id="txtMonto" 
                                           name="txtMonto" 
                                           placeholder="Ingresa el monto" 
                                           step="0.01" 
                                           min="0" 
                                           value="${montoIngresado}" 
                                           required
                                           style="border-color: #a9b8f2;">
                                    <div class="form-text">Especifica la cantidad a convertir</div>
                                </div>

                                <!-- Moneda Origen -->
                                <div class="col-md-6">
                                    <label for="cboOrigen" class="form-label">Moneda Origen (De)</label>
                                    <select class="form-control border-2" 
                                            id="cboOrigen" 
                                            name="cboOrigen" 
                                            required
                                            style="border-color: #a9b8f2;">
                                        <option value="">-- Selecciona moneda --</option>
                                        <option value="USD" <% if ("USD".equals(request.getAttribute("origen"))) { %>selected<% } %>>USD - Dólar Americano</option>
                                        <option value="EUR" <% if ("EUR".equals(request.getAttribute("origen"))) { %>selected<% } %>>EUR - Euro</option>
                                        <option value="MXN" <% if ("MXN".equals(request.getAttribute("origen"))) { %>selected<% } %>>MXN - Peso Mexicano</option>
                                        <option value="PEN" <% if ("PEN".equals(request.getAttribute("origen"))) { %>selected<% } %>>PEN - Sol Peruano</option>
                                    </select>
                                    <div class="form-text">La moneda que deseas convertir</div>
                                </div>

                                <!-- Moneda Destino -->
                                <div class="col-md-6">
                                    <label for="cboDestino" class="form-label">Moneda Destino (A)</label>
                                    <select class="form-control border-2" 
                                            id="cboDestino" 
                                            name="cboDestino" 
                                            required
                                            style="border-color: #a9b8f2;">
                                        <option value="">-- Selecciona moneda --</option>
                                        <option value="USD" <% if ("USD".equals(request.getAttribute("destino"))) { %>selected<% } %>>USD - Dólar Americano</option>
                                        <option value="EUR" <% if ("EUR".equals(request.getAttribute("destino"))) { %>selected<% } %>>EUR - Euro</option>
                                        <option value="MXN" <% if ("MXN".equals(request.getAttribute("destino"))) { %>selected<% } %>>MXN - Peso Mexicano</option>
                                        <option value="PEN" <% if ("PEN".equals(request.getAttribute("destino"))) { %>selected<% } %>>PEN - Sol Peruano</option>
                                    </select>
                                    <div class="form-text">La moneda resultado de la conversión</div>
                                </div>
                            </div>

                            <!-- Botón de Envío -->
                            <div class="d-grid mt-4">
                                <button type="submit" 
                                        class="btn btn-lg text-white fw-semibold"
                                        style="background: linear-gradient(135deg, #667eea, #764ba2); border: none;">
                                    <i class="bi bi-arrow-left-right me-2"></i>Convertir
                                </button>
                            </div>
                            
                        </form>
                    </fieldset>
                </div>
                
                <!-- Footer de Card -->
                <div class="card-footer p-3 text-center" style="background-color: #f2f3fc; border-top: 1px solid #e2e6fb;">
                    <div class="alert border-0 rounded-3 mb-3 py-3 shadow-sm" role="alert" style="background-color: #f2f3fc;">
                        <strong class="fs-5" style="color: #764ba2;">Resultado</strong>
                    </div>
                    <div class="text-muted small fw-semibold pt-1">
                        Desarrollado por:  Leandro Jerek Salas Bustos / Adriel Mathias Guzmán Soria
                    </div>
                </div>
                
            </div>
          
        </div>
    </div>
</div>
<%@include file="/WEB-INF/Shared/FooterView.jsp"%>
</body>>

