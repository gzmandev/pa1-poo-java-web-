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
        <div class="col-lg-6 col-md-8 col-sm-12">
            <div class="card shadow border-0 rounded-4 overflow-hidden">
                
                <!-- HEADER -->
                <div class="card-header text-white text-center py-4" style="background: linear-gradient(135deg, #667eea, #764ba2);">
                    <h3 class="mb-0 fw-bolder tracking-wide">Números Romanos</h3>
                </div>
                
                <!-- BODY -->
                <div class="card-body bg-white p-4">
                    
                    <!-- FORMULARIO 1: Natural a Romano -->
                    <form action="${pageContext.request.contextPath}/romanos" method="POST" class="mb-4">
                        <h5 class="fw-bold mb-3" style="font-size: 1.05rem; color: #764ba2;">Convertir a Romano</h5>
                        
                        <div class="mb-3">
                            <label for="numeroNatural" class="form-label text-muted small fw-semibold">Ingrese número natural:</label>
                            <input type="number" class="form-control form-control-lg bg-light border-2" id="numeroNatural" name="numeroNatural"
                                   placeholder="Ej. 15" required style="border-color: #a9b8f2;">
                        </div>
                        
                        <button type="submit" class="btn btn-lg w-100 text-white fw-semibold"
                                style="background: linear-gradient(135deg, #667eea, #764ba2); border: none;">
                            Convertir
                        </button>
                    </form>
                    
                    <hr class="text-muted opacity-25 my-4">
                    
                    <!-- FORMULARIO 2: Romano a Natural -->
                    <form action="${pageContext.request.contextPath}/romanos" method="POST" class="mb-3">
                        <h5 class="fw-bold mb-3" style="font-size: 1.05rem; color: #764ba2;">Convertir a Natural</h5>
                        
                        <div class="mb-3">
                            <label for="numeroRomano" class="form-label text-muted small fw-semibold">Ingrese número romano:</label>
                            <input type="text" class="form-control form-control-lg bg-light border-2 text-uppercase" id="numeroRomano" name="numeroRomano"
                                   placeholder="Ej. XIV" required style="border-color: #a9b8f2;">
                        </div>
                        
                        <button type="submit" class="btn btn-lg w-100 text-white fw-semibold"
                                style="background: linear-gradient(135deg, #667eea, #764ba2); border: none;">
                            Convertir
                        </button>
                    </form>
                    
                </div>
                
                <!-- FOOTER -->
                <div class="card-footer p-3 text-center" style="background-color: #f2f3fc; border-top: 1px solid #e2e6fb;">
                    <div class="alert border-0 rounded-3 mb-3 py-3 shadow-sm" role="alert" style="background-color: #f2f3fc;">
                        <strong class="fs-5" style="color: #764ba2;">Resultado</strong>
                    </div>
                    <div class="text-muted small fw-semibold pt-1">
                        Desarrollado por: Richard Jose Gonzalez Cordova
                    </div>
                </div>
                
            </div>
        </div>
    </div>
</div>

<%@include file="/WEB-INF/Shared/FooterView.jsp" %>
