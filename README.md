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
3. Click on the **"Themes"** tab from **"Realm settings"**
4. Set **Login Theme** to `IPB_custom-theme`
5. **Important**: Leave other themes (Account, Admin, Email) as default
6. Click **"Save"**

### Theme Settings

The theme is configured with:
- **Portuguese labels**: "Código de Utilizador", "Senha de Acesso", "Entrar >"
- **IPB colors**: Orange (#f7931e) and institutional grays
- **Responsive breakpoints**: 768px (tablet) and 480px (mobile)
- **Form validation**: Real-time error messages

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



## 🤝 Contributing

1. Fork this repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly on both desktop and mobile
5. Update this README if needed
6. Submit a pull request

## 📦 GitHub Repository

This project is available on GitHub for collaboration and version control.

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
**Last Updated**: December 2025  
**Status**: Production ready (desktop), mobile image issue under investigation
