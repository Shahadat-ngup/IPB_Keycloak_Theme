# IPB Custom Keycloak Theme

A custom Keycloak theme that replicates the IPB (Instituto Politécnico de Bragança) Identity Provider login in## 🔍 Troubleshooting

### ✅ Recently Resolved Issues

1. **Mobile Image Display Issue (RESOLVED)**:
   - **Problem**: Header image didn't display on some mobile browsers with PNG format
   - **Solution**: Switched to JPG format (`header_left.jpg`) for better mobile compatibility
   - **Status**: ✅ **RESOLVED** - Image now displays correctly on all mobile devices
   - **Performance**: Improved with smaller file size (6.5KB vs 17.5KB)
   - **Testing**: Verified on iOS Safari, Android Chrome, Samsung Internet, and other mobile browsers

### Common Issues

1. **Theme not appearing**: 
   - Verify theme name is exactly `IPB_custom-theme`
   - Check file permissions (755)
   - Clear browser cache and Keycloak cache

2. **Images not loading**:
   - Verify `header_left.jpg` exists in `resources/img/`
   - Check file permissions
   - Test with browser developer tools
   - Check console for loading errors

3. **Mobile layout issues**:
   - Verify responsive CSS is working
   - Test on actual devices, not just browser resize
   - Check viewport meta tag implementation

### Development Notes

- **Image Format**: Now using JPG for better mobile browser support
- **Fallback Strategy**: PNG version kept as backup, automatic fallback implemented
- **Performance**: Optimized for mobile with smaller file sizes
- **Testing**: Comprehensive testing on multiple mobile browsers completedeme provides a clean, responsive design with a simplified header layout using only the IPB logo, left-aligned for consistency across all devices.

## 🎨 Features

- **Simplified IPB Branding**: Clean header with only the IPB logo (header_left.jpg), left-aligned
- **Responsive Design**: Works on desktop, tablet, and mobile devices
- **Legacy-Inspired**: Based on the original IPB Identity Provider design
- **Modern UI**: Clean, professional appearance with proper form validation
- **Mobile Optimized**: Left-aligned layout that scales properly on all screen sizes
- **Cross-Platform**: Compatible with all major browsers and devices
- **Mobile Image Fix**: Uses JPG format for better mobile browser compatibility

## ✅ Recent Updates

- **Mobile Image Issue Resolved**: Switched from PNG to JPG format (header_left.jpg) to resolve mobile browser compatibility issues. The header image now displays correctly on both desktop and mobile devices.

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
    │   │       ├── header_left.jpg          # Main IPB logo (CURRENTLY USED)
    │   │       ├── header_left.png          # Legacy PNG version
    │   │       └── ... (other legacy images)
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
- **Single Image**: Uses `header_left.jpg` (switched from PNG for mobile compatibility)
- **Alignment**: Left-aligned on all devices (desktop, tablet, mobile)
- **Background**: White background with no additional decorative elements
- **Responsive**: Scales appropriately for different screen sizes
- **Fallback**: Shows "IPB Identity Provider" text if image fails to load

### Mobile Compatibility
- **✅ Resolved**: Header image now displays correctly on mobile devices
- **Format**: JPG format provides better mobile browser compatibility
- **Performance**: Smaller file size (6.5KB vs 17.5KB) for faster mobile loading
- **Testing**: Verified on iOS Safari, Android Chrome, and other mobile browsers

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
- **Single header image**: Now uses `header_left.jpg` (switched from PNG for mobile compatibility)
- **Left alignment**: Consistent positioning across all device sizes
- **Responsive CSS**: Media queries handle different screen sizes
- **JavaScript fallback**: Handles image loading errors gracefully with PNG fallback
- **Clean design**: No decorative backgrounds or multiple images
- **Mobile optimized**: JPG format ensures better mobile browser support



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
**Theme Version**: 1.1 (Mobile compatibility resolved)  
**Last Updated**: December 2024  
**Status**: ✅ Production ready (desktop and mobile fully working)
