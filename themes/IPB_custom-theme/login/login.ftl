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
            /* Override all Keycloak default styles */
            .login-pf-page {
                background: #787878 !important;
                background-image: url("${url.resourcesPath}/img/background.png") !important;
                background-repeat: repeat-x !important;
                font-family: 'Trebuchet MS',Verdana,sans-serif !important;
                font-size: .8em !important;
                margin: 0 !important;
                padding: 0 !important;
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
                font-family: 'Trebuchet MS',Verdana,sans-serif !important;
                font-size: .8em !important;
                margin: 0 !important;
                background: #787878 !important;
                background-image: url("${url.resourcesPath}/img/background.png") !important;
                background-repeat: repeat-x !important;
            }
            
            .cText { 
                text-decoration: none !important; 
                color: #000 !important; 
                font-family: Verdana, Helvetica, Arial, Sans-Serif !important; 
                font-size: 10px !important; 
            }
            
            .dText { 
                text-decoration: none !important; 
                color: #000 !important; 
                font-family: Verdana, Helvetica, Arial, Sans-Serif !important; 
                font-size: 8px !important; 
            }
            
            a {
                color: #000000 !important; 
                font-family: Verdana, Arial, Helvetica, sans-serif !important; 
                font-size: 10px !important;
            }
            
            a:active, a:visited {
                color: #000000 !important;
            }
            
            a:hover {
                color: #000000 !important; 
                text-decoration: none !important;
            }
            
            .aFormtext { 
                font-family: Verdana !important; 
                font-size: 12pt !important; 
                color: #ffffff !important; 
                border-style: solid !important; 
                background-color: #f7931e !important; 
                border-color: #000000 !important; 
                border-width: 1px !important;
                padding: 6px !important;
            }
            
            .cFormtext { 
                font-family: Verdana !important; 
                font-size: 12pt !important; 
                color: #000000 !important; 
                border-style: solid !important; 
                background-color: #EFEFEF !important; 
                border-color: #000000 !important; 
                border-width: 1px !important;
                padding: 6px !important;
            }
            
            .label-text {
                font-family: Verdana !important;
                font-size: 12pt !important;
                color: #000000 !important;
                font-weight: normal !important;
            }
            
            .linkmenuprincipal {
                font-family: Verdana !important; 
                font-size: 10pt !important; 
                color: #000000 !important; 
                text-decoration: none !important;
            }
            
            /* Mobile responsive styles - Keep left alignment */
            @media (max-width: 768px) {
                .mobile-header {
                    min-height: 120px !important;
                    padding: 15px !important;
                    justify-content: flex-start !important;
                    align-items: center !important;
                }
                
                .mobile-header img {
                    max-height: 100px !important;
                    width: auto !important;
                    max-width: 250px !important;
                    margin-right: 15px !important;
                    margin-left: 0 !important;
                    display: block !important;
                    visibility: visible !important;
                    opacity: 1 !important;
                }
                
                .mobile-header-text {
                    font-size: 18px !important;
                    margin: 0 !important;
                    text-align: left !important;
                }
                
                .main-content {
                    padding: 15px 5px !important;
                }
                
                .login-container {
                    padding: 15px !important;
                    margin: 0 10px !important;
                }
            }
            
            @media (max-width: 480px) {
                .mobile-header {
                    min-height: 120px !important;
                    padding: 15px 10px !important;
                    flex-direction: row !important;
                    align-items: center !important;
                    justify-content: flex-start !important;
                }
                
                .mobile-header img {
                    max-height: 80px !important;
                    max-width: 150px !important;
                    margin-right: 10px !important;
                    margin-left: 0 !important;
                }
                
                .mobile-header-text {
                    font-size: 16px !important;
                    line-height: 1.2 !important;
                    text-align: left !important;
                    flex: 1 !important;
                }
            }
        </style>
    <#elseif section = "form">
        <!-- Main container with proper structure and mobile viewport -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <div style="width: 100%; min-height: 100vh; background: #787878; background-image: url('${url.resourcesPath}/img/background.png'); background-repeat: repeat-x; font-family: 'Trebuchet MS',Verdana,sans-serif; font-size: .8em; margin: 0; padding: 0;">
            
            <!-- Header Section with header_left.jpg - Always Left Aligned -->
            <div class="mobile-header" style="width: 100%; min-height: 100px; background: #ffffff; display: flex; align-items: center; justify-content: flex-start; padding: 15px; margin: 0; border-bottom: 2px solid #f7931e;">
                <img src="${url.resourcesPath}/img/header_left.jpg" alt="IPB Header" id="header-image"
                     style="height: 80px; width: auto; max-width: 300px; margin-right: 15px; display: block !important; visibility: visible !important; opacity: 1 !important; object-fit: contain; image-rendering: auto;">
                <div class="mobile-header-text" style="color: #f7931e; font-size: 22px; font-weight: bold; font-family: 'Trebuchet MS',Verdana,sans-serif; flex: 1;">
                    IPB Identity Provider
                </div>
            </div>
            
            <!-- Orange Bar -->
            <div style="width: 100%; height: 30px; background: #f7931e; margin: 0; padding: 0;"></div>
            
            <!-- Main Content Area - Mobile Responsive -->
            <div class="main-content" style="width: 100%; padding: 20px 10px; display: flex; justify-content: center; align-items: flex-start;">
                <div class="login-container" style="width: 100%; max-width: 700px; background: #ffffff; border: 1px solid #ccc; border-radius: 5px; padding: 15px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); margin: 0 10px;">
                    
                    <!-- Login Form Header -->
                    <div style="background: #f7931e; padding: 15px; margin: -20px -20px 20px -20px; border-radius: 5px 5px 0 0; color: #000; font-weight: bold; font-size: 16px; font-family: Verdana;">
                        Identity Provider | Login
                    </div>
                    
                    <!-- Login Form -->
                    <#if realm.password>
                        <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                            <div style="margin-bottom: 20px;">
                                <label style="display: block; margin-bottom: 8px; font-family: Verdana; font-size: 12pt; color: #000000; font-weight: normal;">
                                    Código de Utilizador
                                </label>
                                <input type="text" id="username" name="username" 
                                       value="${(login.username!'')}" 
                                       autofocus 
                                       autocomplete="off"
                                       aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                                       onkeypress="return handleEnter(this, event)" 
                                       onfocus="this.style.backgroundColor='#f7931e'; this.style.color='#ffffff';" 
                                       onblur="this.style.backgroundColor='#EFEFEF'; this.style.color='#000000';"
                                       style="width: 100%; padding: 8px; font-family: Verdana; font-size: 12pt; color: #000000; border: 1px solid #000000; background-color: #EFEFEF;">
                                
                                <#if messagesPerField.existsError('username','password')>
                                    <div style="color: red; font-size: 11px; margin-top: 5px;" aria-live="polite">
                                        ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                                    </div>
                                </#if>
                            </div>
                            
                            <div style="margin-bottom: 20px;">
                                <label style="display: block; margin-bottom: 8px; font-family: Verdana; font-size: 12pt; color: #000000; font-weight: normal;">
                                    Senha de Acesso
                                </label>
                                <input type="password" id="password" name="password" 
                                       autocomplete="off"
                                       aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                                       onfocus="this.style.backgroundColor='#f7931e'; this.style.color='#ffffff';" 
                                       onblur="this.style.backgroundColor='#EFEFEF'; this.style.color='#000000';"
                                       style="width: 100%; padding: 8px; font-family: Verdana; font-size: 12pt; color: #000000; border: 1px solid #000000; background-color: #EFEFEF;">
                            </div>
                            
                            <div style="margin-bottom: 20px;">
                                <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                                <input type="submit" value="Entrar >" name="login" id="kc-login" 
                                       style="font-family: Verdana; font-size: 14pt; font-weight: bold; color: #000000; border: 1px solid #000000; background-color: #c0c0c0; padding: 12px 25px; cursor: pointer; border-radius: 3px;">
                            </div>
                            
                            <#if realm.rememberMe && !usernameEditDisabled??>
                            <div style="margin-bottom: 10px;">
                                <label style="font-family: Verdana; font-size: 10px; color: #000;">
                                    <#if login.rememberMe??>
                                        <input id="rememberMe" name="rememberMe" type="checkbox" checked> Lembrar-me
                                    <#else>
                                        <input id="rememberMe" name="rememberMe" type="checkbox"> Lembrar-me
                                    </#if>
                                </label>
                            </div>
                            </#if>
                        </form>
                    </#if>
                </div>
            </div>
        </div>
        
        <script>
            // Set focus on username field and handle form interactions
            document.addEventListener('DOMContentLoaded', function() {
                var usernameField = document.getElementById('username');
                if (usernameField) {
                    usernameField.focus();
                }
                
                // Mobile detection and image handling - Enhanced
                var isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
                var isSmallScreen = window.innerWidth <= 768;
                
                console.log('Device detection - Mobile:', isMobile, 'Small screen:', isSmallScreen, 'Width:', window.innerWidth);
                console.log('Testing with JPG image instead of PNG for mobile compatibility');
                
                // Find the header image and ensure it's visible
                var headerImg = document.querySelector('img[alt="IPB Header"]');
                if (headerImg) {
                    console.log('Header image found (JPG):', headerImg.src);
                    console.log('Image complete:', headerImg.complete);
                    console.log('Image naturalWidth:', headerImg.naturalWidth);
                    console.log('Image naturalHeight:', headerImg.naturalHeight);
                    
                    // Force image to be visible on all devices - Enhanced for mobile
                    headerImg.style.display = 'block';
                    headerImg.style.visibility = 'visible';
                    headerImg.style.opacity = '1';
                    headerImg.style.objectFit = 'contain';
                    headerImg.style.imageRendering = 'auto';
                    headerImg.style.webkitImageRendering = 'auto';
                    headerImg.style.msInterpolationMode = 'bicubic';
                    
                    // Mobile-specific image fixes
                    if (isMobile || isSmallScreen) {
                        // Try to force image rendering on mobile
                        headerImg.style.maxWidth = '250px';
                        headerImg.style.height = 'auto';
                        headerImg.style.width = 'auto';
                        headerImg.style.minHeight = '60px';
                        headerImg.style.minWidth = '100px';
                        headerImg.style.objectFit = 'scale-down';
                        
                        // Force hardware acceleration on mobile
                        headerImg.style.transform = 'translateZ(0)';
                        headerImg.style.webkitTransform = 'translateZ(0)';
                        headerImg.style.backfaceVisibility = 'hidden';
                        headerImg.style.webkitBackfaceVisibility = 'hidden';
                        
                        console.log('Applied mobile-specific image fixes');
                    }
                    
                    // Try to reload the image with cache busting if it's not loading
                    if (headerImg.naturalWidth === 0) {
                        console.log('Image not loaded, attempting multiple reload strategies...');
                        var originalSrc = headerImg.src;
                        
                        // Strategy 1: Force reload with cache busting
                        headerImg.src = '';
                        setTimeout(function() {
                            headerImg.src = originalSrc + '?v=' + Date.now();
                        }, 100);
                        
                        // Strategy 2: Try creating a new image element
                        setTimeout(function() {
                            if (headerImg.naturalWidth === 0) {
                                console.log('Trying new image element approach...');
                                var newImg = new Image();
                                newImg.onload = function() {
                                    console.log('New image loaded successfully, replacing...');
                                    headerImg.src = newImg.src;
                                };
                                newImg.onerror = function() {
                                    console.log('New image also failed to load');
                                };
                                newImg.src = originalSrc;
                            }
                        }, 500);
                        
                        // Strategy 3: Since we're now using JPG, try PNG as fallback
                        setTimeout(function() {
                            if (headerImg.naturalWidth === 0) {
                                console.log('JPG failed, trying PNG fallback...');
                                var fallbackSrc = originalSrc.replace('.jpg', '.png');
                                if (fallbackSrc !== originalSrc) {
                                    headerImg.src = fallbackSrc;
                                } else {
                                    console.log('No PNG fallback available');
                                }
                            }
                        }, 1000);
                    }
                    
                    if (isMobile || isSmallScreen) {
                        // Mobile styling - always left aligned
                        headerImg.style.margin = '0 15px 0 0';
                        headerImg.style.height = '80px';
                        headerImg.style.maxHeight = '80px';
                        headerImg.style.width = 'auto';
                        headerImg.style.maxWidth = '250px';
                        console.log('Applied mobile styling to image - left aligned');
                    } else {
                        // Desktop styling - left aligned
                        headerImg.style.height = '80px';
                        headerImg.style.width = 'auto';
                        headerImg.style.margin = '0 15px 0 0';
                        console.log('Applied desktop styling to image');
                    }
                    
                    // Check if image loads
                    headerImg.onload = function() {
                        console.log('Image loaded successfully');
                        console.log('Final image dimensions:', headerImg.naturalWidth, 'x', headerImg.naturalHeight);
                        console.log('Displayed dimensions:', headerImg.offsetWidth, 'x', headerImg.offsetHeight);
                        console.log('Image visible on screen:', headerImg.offsetWidth > 0 && headerImg.offsetHeight > 0);
                    };
                    
                    headerImg.onerror = function() {
                        console.log('Image failed to load, URL:', headerImg.src);
                        // Hide the image element if it fails to load
                        headerImg.style.display = 'none';
                        
                        // Optionally create a text fallback
                        var fallback = document.createElement('div');
                        fallback.innerHTML = 'IPB';
                        fallback.style.cssText = 'width: 80px; height: 80px; background: #f7931e; color: white; display: flex; align-items: center; justify-content: center; font-weight: bold; margin-right: 15px;';
                        headerImg.parentNode.insertBefore(fallback, headerImg);
                    };
                } else {
                    console.log('Header image not found');
                }
                
                // Force header to be mobile-friendly but always left-aligned
                var headerDiv = document.querySelector('.mobile-header');
                if (headerDiv && (isMobile || isSmallScreen)) {
                    // Always keep left alignment on all devices
                    headerDiv.style.flexDirection = 'row';
                    headerDiv.style.textAlign = 'left';
                    headerDiv.style.alignItems = 'center';
                    headerDiv.style.justifyContent = 'flex-start';
                    headerDiv.style.minHeight = '100px';
                    headerDiv.style.padding = '15px';
                    console.log('Applied mobile styling to header container - left aligned');
                }
                
                // Ensure form submission works
                var form = document.getElementById('kc-form-login');
                if (form) {
                    form.addEventListener('submit', function(e) {
                        var username = document.getElementById('username').value;
                        var password = document.getElementById('password').value;
                        
                        if (!username || !password) {
                            e.preventDefault();
                            alert('Por favor, preencha o código de utilizador e a senha.');
                            return false;
                        }
                        
                        // Disable submit button to prevent double submission
                        var submitBtn = document.getElementById('kc-login');
                        if (submitBtn) {
                            submitBtn.disabled = true;
                            submitBtn.value = 'Processando...';
                        }
                        
                        return true;
                    });
                }
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
