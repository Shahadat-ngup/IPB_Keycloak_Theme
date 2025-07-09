<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        <script>
            // Hide Keycloak's default header
            document.addEventListener('DOMContentLoaded', function() {
                var kcHeader = document.getElementById('kc-header');
                if (kcHeader) kcHeader.style.display = 'none';
                
                var kcContent = document.getElementById('kc-content');
                if (kcContent) {
                    kcContent.style.padding = '0';
                    kcContent.style.margin = '0';
                    kcContent.style.background = 'transparent';
                }
                
                var kcContentWrapper = document.getElementById('kc-content-wrapper');
                if (kcContentWrapper) {
                    kcContentWrapper.style.padding = '0';
                    kcContentWrapper.style.margin = '0';
                    kcContentWrapper.style.background = 'transparent';
                }
                
                var loginPfPage = document.querySelector('.login-pf-page');
                if (loginPfPage) {
                    loginPfPage.style.background = '#787878';
                    loginPfPage.style.backgroundImage = 'url("${url.resourcesPath}/img/background.png")';
                    loginPfPage.style.backgroundRepeat = 'repeat-x';
                }
                
                var cardPf = document.querySelector('.card-pf');
                if (cardPf) {
                    cardPf.style.background = 'transparent';
                    cardPf.style.border = 'none';
                    cardPf.style.boxShadow = 'none';
                }
                
                var loginPfHeader = document.querySelector('.login-pf-header');
                if (loginPfHeader) loginPfHeader.style.display = 'none';
                
                var kcPageTitle = document.getElementById('kc-page-title');
                if (kcPageTitle) kcPageTitle.style.display = 'none';
                
                // Hide any potential brand elements
                var brandElements = document.querySelectorAll('.login-pf-brand, .kc-logo-text');
                brandElements.forEach(function(el) {
                    el.style.display = 'none';
                });
                
                // Remove any potential white backgrounds
                var allDivs = document.querySelectorAll('div');
                allDivs.forEach(function(div) {
                    if (div.style.backgroundColor === 'white' || div.style.backgroundColor === '#ffffff') {
                        div.style.backgroundColor = 'transparent';
                    }
                });
            });
            
            function handleEnter (field, event) {
                var keyCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
                if (keyCode == 13) {
                    var i;
                    for (i = 0; i < field.form.elements.length; i++)
                        if (field == field.form.elements[i])
                            break;
                    i = (i + 1) % field.form.elements.length;
                    field.form.elements[i].focus();
                    return false;
                }
                else
                return true;
            }
        </script>
        
        <style>
            /* Ultra-Professional IPB Theme Styles with Enhanced Design */
            .login-pf-page {
                background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 50%, #dee2e6 100%) !important;
                background-attachment: fixed !important;
                font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', Arial, sans-serif !important;
                font-size: 14px !important;
                margin: 0 !important;
                padding: 0 !important;
                min-height: 100vh !important;
                color: #212529 !important;
                -webkit-font-smoothing: antialiased !important;
                -moz-osx-font-smoothing: grayscale !important;
            }
            
            #kc-header { display: none !important; }
            .login-pf-header { display: none !important; }
            #kc-page-title { display: none !important; }
            
            .card-pf {
                background: transparent !important;
                border: none !important;
                box-shadow: none !important;
                margin: 0 !important;
                padding: 0 !important;
            }
            
            #kc-content {
                padding: 0 !important;
                margin: 0 !important;
                background: transparent !important;
            }
            
            #kc-content-wrapper {
                padding: 0 !important;
                margin: 0 !important;
                background: transparent !important;
            }
            
            /* Ensure no white backgrounds cover the header */
            .login-pf-brand, .kc-logo-text {
                display: none !important;
            }
            
            /* Remove any potential overlays */
            .login-pf-page::before,
            .login-pf-page::after {
                display: none !important;
            }
            
            body {
                width: 100% !important;
                padding: 0 !important;
                font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', Arial, sans-serif !important;
                font-size: 14px !important;
                margin: 0 !important;
                background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 50%, #dee2e6 100%) !important;
                background-attachment: fixed !important;
                color: #212529 !important;
                line-height: 1.6 !important;
                font-weight: 400 !important;
                -webkit-font-smoothing: antialiased !important;
                -moz-osx-font-smoothing: grayscale !important;
            }
            
            /* Ultra-Professional Typography */
            .ultra-professional-text { 
                font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', Arial, sans-serif !important; 
                color: #212529 !important; 
                font-size: 14px !important;
                line-height: 1.5 !important;
                font-weight: 400 !important;
            }
            
            .ultra-professional-small { 
                font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', Arial, sans-serif !important; 
                color:rgb(66, 93, 117) !important; 
                font-size: 12px !important;
                line-height: 1.4 !important;
                font-weight: 400 !important;
            }
            
            /* Ultra-Professional Links */
            a {
                color: #0d6efd !important; 
                font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', Arial, sans-serif !important; 
                font-size: 14px !important;
                text-decoration: none !important;
                transition: all 0.2s ease-in-out !important;
                font-weight: 500 !important;
            }
            
            a:active, a:visited {
                color: #0d6efd !important;
            }
            
            a:hover {
                color: #0a58ca !important; 
                text-decoration: underline !important;
            }
            
            /* Ultra-Professional Form Inputs */
            .ultra-professional-input { 
                font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', Arial, sans-serif !important; 
                font-size: 16px !important; 
                color: #212529 !important; 
                border: 2px solid #ced4da !important; 
                background-color: #ffffff !important; 
                border-radius: 8px !important;
                padding: 14px 16px !important;
                transition: all 0.2s ease-in-out !important;
                box-shadow: 0 1px 3px rgba(0,0,0,0.05) !important;
                font-weight: 400 !important;
                width: 100% !important;
                box-sizing: border-box !important;
            }
            
            .ultra-professional-input:focus {
                border-color: #f7931e !important;
                background-color: #ffffff !important;
                box-shadow: 0 0 0 3px rgba(247, 147, 30, 0.1), 0 2px 8px rgba(0,0,0,0.1) !important;
                outline: none !important;
                transform: translateY(-1px) !important;
            }
            
            /* Ultra-Professional Button */
            .ultra-professional-button { 
                font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', Arial, sans-serif !important; 
                font-size: 16px !important; 
                font-weight: 600 !important; 
                color: #ffffff !important; 
                border: none !important; 
                background: linear-gradient(135deg, #f7931e 0%, #e67e00 100%) !important; 
                border-radius: 8px !important;
                padding: 16px 32px !important; 
                cursor: pointer !important; 
                transition: all 0.2s ease-in-out !important;
                box-shadow: 0 2px 8px rgba(247, 147, 30, 0.25) !important;
                text-transform: none !important;
                letter-spacing: 0.02em !important;
                position: relative !important;
                overflow: hidden !important;
                min-width: 120px !important;
            }
            
            .ultra-professional-button:hover {
                background: linear-gradient(135deg, #e67e00 0%, #d96d00 100%) !important;
                transform: translateY(-2px) !important;
                box-shadow: 0 4px 16px rgba(247, 147, 30, 0.35) !important;
            }
            
            .ultra-professional-button:active {
                transform: translateY(0) !important;
                box-shadow: 0 1px 4px rgba(247, 147, 30, 0.3) !important;
            }
            
            /* Ultra-Professional Label */
            .ultra-professional-label {
                font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', Arial, sans-serif !important;
                font-size: 14px !important;
                color: #495057 !important;
                font-weight: 500 !important;
                margin-bottom: 8px !important;
                display: block !important;
                letter-spacing: 0.01em !important;
            }
            
            /* Ultra-Professional Error Messages with Enhanced Styling */
            .ultra-professional-error {
                color: #dc3545 !important;
                font-size: 13px !important;
                margin-top: 6px !important;
                font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', Arial, sans-serif !important;
                padding: 12px 16px !important;
                background: linear-gradient(135deg, #f8d7da 0%, #f1aeb5 100%) !important;
                border: 1px solid #f5c2c7 !important;
                border-radius: 8px !important;
                font-weight: 500 !important;
                box-shadow: 0 2px 8px rgba(220, 53, 69, 0.15) !important;
                border-left: 4px solid #dc3545 !important;
                animation: slideInError 0.3s ease-out !important;
            }
            
            /* Ultra-Professional Mobile responsive styles with fixed separation */
            @media (max-width: 768px) {
                .mobile-header {
                    min-height: 120px !important;
                    padding: 25px 20px !important;
                    justify-content: flex-start !important;
                    align-items: center !important;
                    box-shadow: 0 4px 16px rgba(0,0,0,0.08) !important;
                    margin-bottom: 15px !important; /* Added margin to separate from orange bar */
                    position: relative !important;
                    z-index: 10 !important;
                }
                
                .mobile-header img {
                    max-height: 85px !important;
                    width: auto !important;
                    max-width: 180px !important;
                    margin-right: 20px !important;
                    margin-left: 0 !important;
                    display: block !important;
                    visibility: visible !important;
                    opacity: 1 !important;
                    filter: drop-shadow(0 3px 6px rgba(0,0,0,0.12)) !important;
                }
                
                .mobile-header-text {
                    font-size: 18px !important;
                    margin: 0 !important;
                    text-align: left !important;
                    font-weight: 600 !important;
                    color: #f7931e !important;
                    line-height: 1.3 !important;
                }
                
                /* Fix mobile orange bar separation with clear spacing */
                .orange-accent-bar {
                    margin-top: 15px !important; /* Clear separation from header */
                    margin-bottom: 25px !important; /* Clear separation from content */
                    height: 8px !important;
                    position: relative !important;
                    z-index: 9 !important;
                }
                
                .main-content {
                    padding: 30px 15px !important;
                    margin-top: 25px !important; /* Increased spacing from orange bar */
                }
                
                .login-container {
                    padding: 30px 20px !important;
                    margin: 0 10px !important;
                    border-radius: 16px !important;
                    box-shadow: 0 12px 32px rgba(0,0,0,0.15) !important;
                }
                
                /* Mobile form adjustments */
                .ultra-professional-input {
                    padding: 16px 20px !important;
                    font-size: 16px !important;
                    border-radius: 8px !important;
                }
                
                .ultra-professional-button {
                    padding: 18px 32px !important;
                    font-size: 18px !important;
                    border-radius: 8px !important;
                    min-width: 140px !important;
                }
            }
            
            @media (max-width: 480px) {
                .mobile-header {
                    min-height: 100px !important;
                    padding: 20px 15px !important;
                    flex-direction: row !important;
                    align-items: center !important;
                    justify-content: flex-start !important;
                    margin-bottom: 20px !important; /* Clear separation on small screens */
                }
                
                .mobile-header img {
                    max-height: 70px !important;
                    max-width: 130px !important;
                    margin-right: 15px !important;
                    margin-left: 0 !important;
                }
                
                .mobile-header-text {
                    font-size: 16px !important;
                    line-height: 1.2 !important;
                    text-align: left !important;
                    flex: 1 !important;
                }
                
                /* Enhanced spacing for very small screens */
                .orange-accent-bar {
                    margin-top: 20px !important;
                    margin-bottom: 30px !important;
                }
                
                .login-container {
                    padding: 25px 15px !important;
                    margin: 0 8px !important;
                    border-radius: 12px !important;
                }
                
                .main-content {
                    padding: 25px 8px !important;
                    margin-top: 30px !important;
                }
            }
        </style>
    <#elseif section = "form">
        <!-- Ultra-Professional IPB Login Page -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <div style="width: 100%; min-height: 100vh; background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 50%, #dee2e6 100%); background-attachment: fixed; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', Arial, sans-serif; margin: 0; padding: 0;">
            
            <!-- Ultra-Professional Header Section -->
            <div class="mobile-header" style="width: 100%; min-height: 100px; background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 100%); display: flex; align-items: center; justify-content: flex-start; padding: 25px; margin: 0; box-shadow: 0 2px 20px rgba(0,0,0,0.08); position: relative; z-index: 10;">
                <img src="${url.resourcesPath}/img/header_left.jpg" alt="IPB Header" id="header-image"
                     style="height: 80px; width: auto; max-width: 280px; margin-right: 25px; display: block !important; visibility: visible !important; opacity: 1 !important; object-fit: contain; image-rendering: auto; filter: drop-shadow(0 2px 8px rgba(0,0,0,0.1));">
                <div class="mobile-header-text" style="color: #f7931e; font-size: 24px; font-weight: 600; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', Arial, sans-serif; flex: 1; letter-spacing: -0.01em;">
                    IPB Identity Provider
                </div>
            </div>
            
            <!-- Ultra-Professional Orange Accent Bar with clear separation on all devices -->
            <div class="orange-accent-bar" style="width: 100%; height: 6px; background: linear-gradient(90deg, #f7931e 0%, #e67e00 50%, #f7931e 100%); margin: 15px 0 25px 0; padding: 0; box-shadow: 0 2px 8px rgba(247, 147, 30, 0.3); position: relative; z-index: 9;"></div>
            
            <!-- Ultra-Professional Main Content Area with enhanced spacing and design -->
            <div class="main-content" style="width: 100%; padding: 50px 20px; display: flex; justify-content: center; align-items: flex-start; min-height: calc(100vh - 180px); margin-top: 25px;">
                <div class="login-container" style="width: 100%; max-width: 420px; background: linear-gradient(135deg, #ffffff 0%, #fafbfc 100%); border: 1px solid #e1e5e9; border-radius: 20px; padding: 40px; box-shadow: 0 10px 40px rgba(0,0,0,0.12), 0 4px 16px rgba(0,0,0,0.08); margin: 0 20px; position: relative; backdrop-filter: blur(10px); overflow: hidden;">
                    
                    <!-- Subtle background pattern -->
                    <div style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: radial-gradient(circle at 20% 80%, rgba(247, 147, 30, 0.03) 0%, transparent 50%), radial-gradient(circle at 80% 20%, rgba(247, 147, 30, 0.03) 0%, transparent 50%); pointer-events: none; z-index: 0;"></div>
                    
                    <!-- Content wrapper with higher z-index -->
                    <div style="position: relative; z-index: 1;">
                    
                    <!-- Ultra-Professional Login Form Header -->
                    <div style="background: linear-gradient(135deg, #f7931e 0%, #e67e00 100%); padding: 28px; margin: -40px -40px 40px -40px; border-radius: 20px 20px 0 0; color: #ffffff; font-weight: 600; font-size: 18px; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', Arial, sans-serif; text-align: center; box-shadow: 0 6px 20px rgba(247, 147, 30, 0.25); letter-spacing: -0.01em; position: relative; overflow: hidden;">
                        <!-- Enhanced gradient overlay -->
                        <div style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: linear-gradient(45deg, rgba(255,255,255,0.15) 0%, transparent 50%, rgba(255,255,255,0.05) 100%); pointer-events: none;"></div>
                        <span style="position: relative; z-index: 1; display: flex; align-items: center; justify-content: center;">
                            <i style="margin-right: 12px; font-size: 20px;">🔐</i> Identity Provider Login
                        </span>
                    </div>
                    
                    <!-- Ultra-Professional Login Form -->
                    <#if realm.password>
                        <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                            <div style="margin-bottom: 28px;">
                                <label class="ultra-professional-label" style="display: block; margin-bottom: 10px; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', Arial, sans-serif; font-size: 14px; color: #495057; font-weight: 500; letter-spacing: 0.01em;">
                                    <i style="margin-right: 8px; color: #f7931e; font-size: 16px;">👤</i> Código de Utilizador
                                </label>
                                <input type="text" id="username" name="username" 
                                       value="${(login.username!'')}" 
                                       autofocus 
                                       autocomplete="off"
                                       aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                                       onkeypress="return handleEnter(this, event)" 
                                       class="ultra-professional-input"
                                       style="font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', Arial, sans-serif; font-size: 16px; color: #212529; border: 2px solid #ced4da; background-color: #ffffff; border-radius: 8px; padding: 14px 16px; transition: all 0.2s ease-in-out; box-shadow: 0 1px 3px rgba(0,0,0,0.05); font-weight: 400; width: 100%; box-sizing: border-box;">
                                
                                <#if messagesPerField.existsError('username','password')>
                                    <div class="ultra-professional-error" style="color: #dc3545; font-size: 13px; margin-top: 6px; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', Arial, sans-serif; padding: 10px 14px; background: linear-gradient(135deg, #f8d7da 0%, #f1aeb5 100%); border: 1px solid #f5c2c7; border-radius: 6px; font-weight: 500; box-shadow: 0 1px 3px rgba(220, 53, 69, 0.1);" aria-live="polite">
                                        <i style="margin-right: 6px;">⚠️</i> ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                                    </div>
                                </#if>
                            </div>
                            
                            <div style="margin-bottom: 28px;">
                                <label class="ultra-professional-label" style="display: block; margin-bottom: 10px; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', Arial, sans-serif; font-size: 14px; color: #495057; font-weight: 500; letter-spacing: 0.01em;">
                                    <i style="margin-right: 8px; color: #f7931e; font-size: 16px;">🔒</i> Senha de Acesso
                                </label>
                                <input type="password" id="password" name="password" 
                                       autocomplete="off"
                                       aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                                       class="ultra-professional-input"
                                       style="font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', Arial, sans-serif; font-size: 16px; color: #212529; border: 2px solid #ced4da; background-color: #ffffff; border-radius: 8px; padding: 14px 16px; transition: all 0.2s ease-in-out; box-shadow: 0 1px 3px rgba(0,0,0,0.05); font-weight: 400; width: 100%; box-sizing: border-box;">
                            </div>
                            
                            <div style="margin-bottom: 28px; text-align: center;">
                                <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                                <input type="submit" value="Entrar" name="login" id="kc-login" 
                                       class="ultra-professional-button"
                                       style="font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', Arial, sans-serif; font-size: 16px; font-weight: 600; color: #ffffff; border: none; background: linear-gradient(135deg, #f7931e 0%, #e67e00 100%); border-radius: 8px; padding: 16px 32px; cursor: pointer; transition: all 0.2s ease-in-out; box-shadow: 0 2px 8px rgba(247, 147, 30, 0.25); letter-spacing: 0.02em; position: relative; overflow: hidden; min-width: 120px;">
                            </div>
                            
                            <#if realm.rememberMe && !usernameEditDisabled??>
                            <div style="margin-bottom: 20px; text-align: center;">
                                <label style="font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', Arial, sans-serif; font-size: 14px; color: #6c757d; display: flex; align-items: center; justify-content: center; cursor: pointer; font-weight: 400;">
                                    <#if login.rememberMe??>
                                        <input id="rememberMe" name="rememberMe" type="checkbox" checked style="margin-right: 10px; accent-color: #f7931e; width: 16px; height: 16px;">
                                    <#else>
                                        <input id="rememberMe" name="rememberMe" type="checkbox" style="margin-right: 10px; accent-color: #f7931e; width: 16px; height: 16px;">
                                    </#if>
                                    <i style="margin-right: 6px; font-size: 14px;">💾</i> Lembrar-me neste dispositivo
                                </label>
                            </div>
                            </#if>
                        </form>
                    </#if>
                    
                    </div> <!-- Close content wrapper -->
                </div>
            </div>
        </div>
        
        <script>
            // Ultra-professional form enhancements and image handling
            document.addEventListener('DOMContentLoaded', function() {
                // Enhanced focus with ultra-professional styling
                var usernameField = document.getElementById('username');
                var passwordField = document.getElementById('password');
                
                if (usernameField) {
                    usernameField.focus();
                    
                    // Ultra-professional focus/blur effects
                    usernameField.addEventListener('focus', function() {
                        this.style.borderColor = '#f7931e';
                        this.style.boxShadow = '0 0 0 3px rgba(247, 147, 30, 0.1), 0 2px 8px rgba(0,0,0,0.1)';
                        this.style.transform = 'translateY(-1px)';
                        this.style.backgroundColor = '#ffffff';
                    });
                    
                    usernameField.addEventListener('blur', function() {
                        this.style.borderColor = '#ced4da';
                        this.style.boxShadow = '0 1px 3px rgba(0,0,0,0.05)';
                        this.style.transform = 'translateY(0)';
                    });
                }
                
                if (passwordField) {
                    passwordField.addEventListener('focus', function() {
                        this.style.borderColor = '#f7931e';
                        this.style.boxShadow = '0 0 0 3px rgba(247, 147, 30, 0.1), 0 2px 8px rgba(0,0,0,0.1)';
                        this.style.transform = 'translateY(-1px)';
                        this.style.backgroundColor = '#ffffff';
                    });
                    
                    passwordField.addEventListener('blur', function() {
                        this.style.borderColor = '#ced4da';
                        this.style.boxShadow = '0 1px 3px rgba(0,0,0,0.05)';
                        this.style.transform = 'translateY(0)';
                    });
                }
                
                // Ultra-professional button hover effects with smooth animations
                var submitBtn = document.getElementById('kc-login');
                if (submitBtn) {
                    submitBtn.addEventListener('mouseenter', function() {
                        this.style.background = 'linear-gradient(135deg, #e67e00 0%, #d96d00 100%)';
                        this.style.transform = 'translateY(-2px)';
                        this.style.boxShadow = '0 4px 16px rgba(247, 147, 30, 0.35)';
                    });
                    
                    submitBtn.addEventListener('mouseleave', function() {
                        this.style.background = 'linear-gradient(135deg, #f7931e 0%, #e67e00 100%)';
                        this.style.transform = 'translateY(0)';
                        this.style.boxShadow = '0 2px 8px rgba(247, 147, 30, 0.25)';
                    });
                    
                    submitBtn.addEventListener('mousedown', function() {
                        this.style.transform = 'translateY(0)';
                        this.style.boxShadow = '0 1px 4px rgba(247, 147, 30, 0.3)';
                    });
                }
                
                // Mobile detection and ultra-professional image handling
                var isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
                var isSmallScreen = window.innerWidth <= 768;
                
                console.log('🎨 Ultra-Professional IPB Theme Loaded');
                console.log('📱 Device detection - Mobile:', isMobile, 'Small screen:', isSmallScreen, 'Width:', window.innerWidth);
                console.log('🖼️ Using optimized JPG format for superior mobile compatibility');
                
                // Ultra-professional image handling with enhanced mobile support
                var headerImg = document.querySelector('img[alt="IPB Header"]');
                if (headerImg) {
                    console.log('✅ Header image found (JPG):', headerImg.src);
                    
                    // Enhanced visibility and professional rendering
                    headerImg.style.display = 'block';
                    headerImg.style.visibility = 'visible';
                    headerImg.style.opacity = '1';
                    headerImg.style.objectFit = 'contain';
                    headerImg.style.imageRendering = 'auto';
                    
                    // Ultra-professional image loading with enhanced error handling
                    headerImg.onload = function() {
                        console.log('🎉 Ultra-professional header image loaded successfully');
                        console.log('📏 Image dimensions:', this.naturalWidth, 'x', this.naturalHeight);
                        console.log('🖥️ Display dimensions:', this.offsetWidth, 'x', this.offsetHeight);
                        
                        // Add professional loading animation
                        this.style.transition = 'all 0.3s cubic-bezier(0.4, 0, 0.2, 1)';
                        this.style.filter = 'drop-shadow(0 2px 8px rgba(0,0,0,0.1))';
                        this.style.opacity = '1';
                    };
                    
                    headerImg.onerror = function() {
                        console.log('❌ JPG image failed to load, implementing ultra-professional fallback...');
                        var originalSrc = this.src;
                        var fallbackSrc = originalSrc.replace('.jpg', '.png');
                        
                        if (fallbackSrc !== originalSrc) {
                            console.log('🔄 Trying PNG fallback...');
                            this.src = fallbackSrc;
                        } else {
                            // Create ultra-professional text fallback
                            var fallback = document.createElement('div');
                            fallback.innerHTML = '<strong style="font-size: 24px; letter-spacing: 2px;">IPB</strong>';
                            fallback.style.cssText = 'width: 80px; height: 80px; background: linear-gradient(135deg, #f7931e 0%, #e67e00 100%); color: white; display: flex; align-items: center; justify-content: center; font-weight: 600; margin-right: 25px; border-radius: 12px; font-family: -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif; box-shadow: 0 4px 16px rgba(247, 147, 30, 0.25); position: relative; overflow: hidden;';
                            
                            // Add subtle animation to fallback
                            var shimmer = document.createElement('div');
                            shimmer.style.cssText = 'position: absolute; top: 0; left: -100%; width: 100%; height: 100%; background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent); animation: shimmer 2s infinite;';
                            fallback.appendChild(shimmer);
                            
                            this.parentNode.insertBefore(fallback, this);
                            this.style.display = 'none';
                        }
                    };
                }
                
                // Ultra-professional form validation with enhanced UX
                var form = document.getElementById('kc-form-login');
                if (form) {
                    form.addEventListener('submit', function(e) {
                        var username = document.getElementById('username').value.trim();
                        var password = document.getElementById('password').value;
                        
                        if (!username || !password) {
                            e.preventDefault();
                            
                            // Ultra-professional error notification
                            var notification = document.createElement('div');
                            notification.innerHTML = '<div style="display: flex; align-items: center;"><i style="margin-right: 12px; font-size: 20px;">⚠️</i><div><strong>Campos obrigatórios</strong><br><span style="font-size: 13px; opacity: 0.9;">Por favor, preencha o código de utilizador e a senha.</span></div></div>';
                            notification.style.cssText = 'position: fixed; top: 30px; left: 50%; transform: translateX(-50%); background: linear-gradient(135deg, #dc3545 0%, #c82333 100%); color: white; padding: 16px 24px; border-radius: 12px; box-shadow: 0 8px 32px rgba(220, 53, 69, 0.3); z-index: 9999; font-family: -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica Neue, Arial, sans-serif; font-size: 14px; max-width: 400px; backdrop-filter: blur(10px); border: 1px solid rgba(255,255,255,0.1);';
                            
                            document.body.appendChild(notification);
                            
                            // Animate notification
                            notification.style.opacity = '0';
                            notification.style.transform = 'translateX(-50%) translateY(-20px)';
                            
                            setTimeout(function() {
                                notification.style.transition = 'all 0.3s cubic-bezier(0.4, 0, 0.2, 1)';
                                notification.style.opacity = '1';
                                notification.style.transform = 'translateX(-50%) translateY(0)';
                            }, 10);
                            
                            setTimeout(function() {
                                notification.style.opacity = '0';
                                notification.style.transform = 'translateX(-50%) translateY(-20px)';
                                setTimeout(function() {
                                    notification.remove();
                                }, 300);
                            }, 4000);
                            
                            return false;
                        }
                        
                        // Ultra-professional loading state
                        var submitBtn = document.getElementById('kc-login');
                        if (submitBtn) {
                            submitBtn.disabled = true;
                            submitBtn.value = 'Processando...';
                            submitBtn.style.background = 'linear-gradient(135deg, #6c757d 0%, #5a6268 100%)';
                            submitBtn.style.cursor = 'not-allowed';
                            submitBtn.style.transform = 'translateY(0)';
                            
                            // Add loading spinner
                            var spinner = document.createElement('div');
                            spinner.style.cssText = 'width: 16px; height: 16px; border: 2px solid rgba(255,255,255,0.3); border-radius: 50%; border-top: 2px solid white; animation: spin 1s linear infinite; margin-right: 8px; display: inline-block;';
                            submitBtn.innerHTML = '';
                            submitBtn.appendChild(spinner);
                            submitBtn.appendChild(document.createTextNode('Processando...'));
                        }
                        
                        return true;
                    });
                }
                
                // Add CSS animations and enhanced styling
                var style = document.createElement('style');
                style.textContent = `
                    @keyframes slideInError {
                        0% { 
                            opacity: 0; 
                            transform: translateY(-10px); 
                        }
                        100% { 
                            opacity: 1; 
                            transform: translateY(0); 
                        }
                    }
                    @keyframes shimmer {
                        0% { left: -100%; }
                        100% { left: 100%; }
                    }
                    @keyframes spin {
                        0% { transform: rotate(0deg); }
                        100% { transform: rotate(360deg); }
                    }
                    @keyframes fadeInUp {
                        0% {
                            opacity: 0;
                            transform: translateY(20px);
                        }
                        100% {
                            opacity: 1;
                            transform: translateY(0);
                        }
                    }
                    .login-container {
                        animation: fadeInUp 0.6s ease-out !important;
                    }
                    .mobile-header {
                        animation: fadeInUp 0.4s ease-out !important;
                    }
                    .orange-accent-bar {
                        animation: fadeInUp 0.5s ease-out 0.1s both !important;
                    }
                `;
                document.head.appendChild(style);
            });
            
            function handleEnter(field, event) {
                var keyCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
                if (keyCode == 13) {
                    var i;
                    for (i = 0; i < field.form.elements.length; i++)
                        if (field == field.form.elements[i])
                            break;
                    i = (i + 1) % field.form.elements.length;
                    field.form.elements[i].focus();
                    return false;
                }
                else
                return true;
            }
        </script>
    </#if>
</@layout.registrationLayout>
