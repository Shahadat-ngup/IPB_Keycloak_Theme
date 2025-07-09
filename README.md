# IPB Custom Keycloak Theme

A custom Keycloak theme that replicates the IPB (Instituto Politécnico de Bragança) Identity Provider login interface. This theme provides a clean, responsive design with a simplified header layout using only the IPB logo, left-aligned for consistency across all devices.

## 🎨 Features

- **Simplified IPB Branding**: Clean header with only the IPB logo (header_left.png), left-aligned
- **Responsive Design**: Works on desktop, tablet, and mobile devices
- **Legacy-Inspired**: Based on the original IPB Identity Provider design
- **Modern UI**: Clean, professional appearance with proper form validation
- **Mobile Optimized**: Left-aligned layout that scales properly on all screen sizes
- **Cross-Platform**: Compatible with all major browsers and devices

## ⚠️ Known Issues

- **Mobile Image Display**: The header image may not display on some mobile browsers due to PNG compatibility issues. The layout and functionality remain intact, but the image space is allocated without content. This is a browser-specific rendering issue that doesn't affect the login functionality.

## 📁 Project Structure

```
themes/
└── IPB_custom-theme/
    ├── login/
    │   ├── resources/
    │   │   ├── css/
    │   │   │   ├── custom.css
    │   │   │   └── login.css
    │   │   └── img/
    │   │       ├── header_left.png          # Main IPB logo (ONLY used image)
    │   │       └── ... (legacy images - not used)
    │   ├── messages/
    │   │   └── messages_en.properties
    │   ├── login.ftl                        # Main login template
    │   ├── login-reset-password.ftl
    │   ├── login-verify-email.ftl
    │   └── theme.properties
    └── account/
        └── theme.properties
```

## 🎯 Current Design

### Header Layout
- **Single Image**: Only `header_left.png` is used as the header
- **Alignment**: Left-aligned on all devices (desktop, tablet, mobile)
- **Background**: White background with no additional decorative elements
- **Responsive**: Scales appropriately for different screen sizes
- **Fallback**: Shows "IPB Identity Provider" text if image fails to load

### Mobile Behavior
- **Working**: Login form, validation, responsiveness, layout
- **Issue**: Header image may not display on some mobile browsers
- **Workaround**: Fallback text ensures branding is maintained

## 🚀 Installation

### Automated Deployment

Use the provided deployment script:

```bash
./deploy-theme.sh
```

### Manual Installation

1. **Copy theme to Keycloak server:**
   ```bash
   scp -r themes/IPB_custom-theme shahadat@ldap.ccom.ipb.pt:/etc/keycloak-26.0.7/themes/
   ```

2. **Set proper permissions:**
   ```bash
   ssh shahadat@ldap.ccom.ipb.pt 'cd /etc/keycloak-26.0.7/themes && chmod -R 755 IPB_custom-theme'
   ```

3. **Clear Keycloak cache:**
   ```bash
   ssh shahadat@ldap.ccom.ipb.pt 'cd /etc/keycloak-26.0.7 && rm -rf data/tmp/* data/cache/*'
   ```

4. **Restart Keycloak (if needed):**
   ```bash
   ssh shahadat@ldap.ccom.ipb.pt 'cd /etc/keycloak-26.0.7 && sudo bin/kc.sh start --optimized'
   ```

## ⚙️ Configuration

### Keycloak Admin Console

1. Login to Keycloak Admin Console
2. Navigate to your realm settings
3. Click on the **"Themes"** tab
4. Set **Login Theme** to `IPB_custom-theme`
5. **Important**: Leave other themes (Account, Admin, Email) as default
6. Click **"Save"**

### Theme Settings

The theme is configured with:
- **Portuguese labels**: "Código de Utilizador", "Senha de Acesso", "Entrar >"
- **IPB colors**: Orange (#f7931e) and institutional grays
- **Responsive breakpoints**: 768px (tablet) and 480px (mobile)
- **Form validation**: Real-time error messages
- **Remember me**: Optional checkbox for persistent sessions

## 🎯 Design Specifications

### Header Layout
- **Logo**: IPB institutional logo (header_left.png) - left-aligned
- **Title**: "IPB Identity Provider" in orange (#f7931e)
- **Background**: White with orange bottom border
- **Height**: 100px (desktop), responsive on mobile

### Login Form
- **Background**: White card with subtle shadow
- **Header**: Orange background with "Identity Provider | Login"
- **Fields**: Gray background (#EFEFEF), orange focus (#f7931e)
- **Button**: Gray background (#c0c0c0) with bold text
- **Typography**: Verdana font family

### Mobile Responsiveness
- **≤768px**: Maintains left alignment, adjusts spacing
- **≤480px**: Smaller logo, compact layout
- **All sizes**: Touch-friendly inputs, readable fonts

## 🔧 Development

### Current Implementation

The theme uses a simplified approach:
- **Single header image**: Only `header_left.png` is referenced and displayed
- **Left alignment**: Consistent positioning across all device sizes
- **Responsive CSS**: Media queries handle different screen sizes
- **JavaScript fallback**: Handles image loading errors gracefully
- **Clean design**: No decorative backgrounds or multiple images

### File Structure

- **`login.ftl`**: Main login template (FreeMarker) - heavily customized
- **`theme.properties`**: Theme configuration
- **`messages_en.properties`**: Text labels and messages
- **`resources/img/header_left.png`**: Primary header image (only one used)
- **`resources/css/`**: Custom stylesheets

### Key Template Code

```ftl
<!-- Simplified header with single image -->
<div class="mobile-header">
    <img src="${url.resourcesPath}/img/header_left.png" 
         alt="IPB Header" 
         onerror="this.style.display='none'; this.nextElementSibling.style.display='block';">
    <div class="mobile-header-text" style="display: none;">IPB Identity Provider</div>
</div>
```

```css
/* Mobile-first responsive design */
.mobile-header {
    background: white;
    text-align: left;
    padding: 20px;
    min-height: 120px;
}

@media (max-width: 768px) {
    .mobile-header img {
        max-width: 100%;
        height: auto;
    }
}
```

## � Troubleshooting

### Known Issues

1. **Mobile Image Display Issue**:
   - **Problem**: Header image may not show on some mobile browsers
   - **Symptoms**: Allocated space visible but no image content
   - **Status**: Under investigation - may be PNG compatibility issue
   - **Workaround**: Fallback text displays when image fails
   - **Impact**: Layout and functionality unaffected

2. **Potential Solutions Being Investigated**:
   - Convert PNG to JPG format
   - Re-export PNG with different compression
   - Test with different image sizes
   - Implement alternative mobile image strategy

### Common Issues

1. **Theme not appearing**: 
   - Verify theme name is exactly `IPB_custom-theme`
   - Check file permissions (755)
   - Clear browser cache and Keycloak cache

2. **Images not loading**:
   - Verify `header_left.png` exists in `resources/img/`
   - Check file permissions
   - Test with browser developer tools
   - Check console for loading errors

3. **Mobile layout issues**:
   - Verify responsive CSS is working
   - Test on actual devices, not just browser resize
   - Check viewport meta tag implementation

### Debugging Mobile Issues

Enable browser console logging:
```javascript
// Check image loading
console.log('Image loaded successfully');

// Verify mobile detection
console.log('Device - Mobile:', /Android|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent));

// Check viewport
console.log('Viewport width:', window.innerWidth);
```

Test on multiple devices:
- iOS Safari (iPhone/iPad)
- Android Chrome
- Samsung Internet
- Mobile Firefox

## � Browser Compatibility

- **Desktop**: Chrome, Firefox, Safari, Edge (✅ Fully working)
- **Mobile**: iOS Safari, Android Chrome, Samsung Internet (⚠️ Layout works, image display issue)
- **Responsive**: All screen sizes from 320px to 4K
- **Functionality**: Login, validation, and forms work on all platforms

## �📋 Deployment Checklist

- [x] Theme files copied to server
- [x] Permissions set correctly (755)
- [x] Keycloak cache cleared
- [x] Admin console theme configured
- [x] Desktop browser tested (working)
- [x] Mobile browser tested (layout working, image issue noted)
- [x] Form validation tested (working)
- [x] Left-aligned header implemented
- [ ] Mobile image display issue resolved (in progress)

## 🤝 Contributing

1. Fork this repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly on both desktop and mobile
5. Update this README if needed
6. Submit a pull request

## 📦 GitHub Repository

This project is available on GitHub for collaboration and version control.

### Repository Setup

```bash
# Initialize git repository
git init

# Add all files
git add .

# Initial commit
git commit -m "Initial commit: IPB custom Keycloak theme with simplified header"

# Add remote repository (replace with your GitHub URL)
git remote add origin https://github.com/yourusername/ipb-keycloak-theme.git

# Push to GitHub
git push -u origin main
```

### Development Workflow

1. **Clone repository**: `git clone https://github.com/yourusername/ipb-keycloak-theme.git`
2. **Make changes**: Edit theme files in `themes/IPB_custom-theme/`
3. **Test locally**: Use `./deploy-theme.sh` to test on development server
4. **Commit changes**: `git add . && git commit -m "Description of changes"`
5. **Push updates**: `git push origin main`

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🏫 About IPB

Instituto Politécnico de Bragança (IPB) is a Portuguese public higher education institution focused on technology and applied sciences.

---

**Developed for**: Instituto Politécnico de Bragança  
**Keycloak Version**: 26.0.7  
**Theme Version**: 1.0 (Simplified header design)  
**Last Updated**: December 2024  
**Status**: Production ready (desktop), mobile image issue under investigation
