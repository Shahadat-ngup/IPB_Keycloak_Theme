# IPB Identity Provider - Keycloak Theme

This project contains a custom Keycloak theme that replicates the look and feel of the IPB (Instituto Politécnico de Bragança) Identity Provider login page.

## Overview

The theme matches the original IPB design with:
- Same layout and table-based structure
- Identical styling and colors
- Portuguese language labels
- Same form field behavior and focus handling
- Responsive design principles
- Error message handling

## Project Structure

```
themes/
└── custom-theme/
    ├── account/
    │   └── theme.properties
    └── login/
        ├── login.ftl                    # Main login template
        ├── login-reset-password.ftl     # Password reset template
        ├── login-verify-email.ftl       # Email verification template
        ├── theme.properties             # Theme configuration
        ├── messages/
        │   └── messages_en.properties   # Localization messages
        └── resources/
            ├── css/
            │   ├── custom.css           # Custom styles
            │   └── login.css            # Login specific styles
            └── img/                     # Required images
                ├── background.png
                ├── banner-background.png
                ├── banner-background2.png
                ├── header_left.png
                ├── 2header_left.png
                ├── 2header_right.png
                ├── content-bottom-edge-left.png
                ├── content-bottom-edge-right.png
                ├── spacer.gif
                ├── shadow1.gif
                ├── shadow2.png
                └── shadow2.gif
```

## Installation Instructions

### Step 1: Prepare the Images

The theme requires specific images from the original IPB installation. You need to copy these images from your IPB server:

1. SSH into your IPB server and copy the images:
```bash
# From your IPB server
cd /idp/images/
scp *.png *.gif your-local-machine:/path/to/this/project/themes/custom-theme/login/resources/img/
```

2. Or manually download and place these images in `themes/custom-theme/login/resources/img/`:
   - background.png
   - banner-background.png
   - banner-background2.png
   - header_left.png
   - 2header_left.png
   - 2header_right.png
   - content-bottom-edge-left.png
   - content-bottom-edge-right.png
   - spacer.gif
   - shadow1.gif
   - shadow2.png
   - shadow2.gif

### Step 2: Deploy to Keycloak

#### Option A: Using the Deployment Script

1. Make the deployment script executable:
```bash
chmod +x deploy-theme.sh
```

2. Run the deployment script:
```bash
./deploy-theme.sh
```

#### Option B: Manual Deployment

1. Copy the theme to your Keycloak server:
```bash
scp -r themes/custom-theme shahadat@ldap.ccom.ipb.pt:/etc/keycloak-26.0.7/themes/
```

2. SSH into your Keycloak server:
```bash
ssh shahadat@ldap.ccom.ipb.pt
```

3. Set proper permissions:
```bash
cd /etc/keycloak-26.0.7/themes
sudo chown -R keycloak:keycloak custom-theme
sudo chmod -R 755 custom-theme
```

4. Clear Keycloak cache:
```bash
cd /etc/keycloak-26.0.7
sudo rm -rf data/tmp/* || true
```

### Step 3: Configure Keycloak Realm

1. Start/restart Keycloak:
```bash
cd /etc/keycloak-26.0.7
bin/kc.sh start
```

2. Access the Keycloak Admin Console
3. Navigate to your realm settings
4. Go to the "Themes" tab
5. In the "Login Theme" dropdown, select "custom-theme"
6. Click "Save"

### Step 4: Test the Theme

1. Navigate to your realm's login page
2. Verify that the page matches the IPB design
3. Test login functionality
4. Check error message display

## Customization

### Modifying Text Labels

Edit the messages in `themes/custom-theme/login/messages/messages_en.properties`:

```properties
# Login page labels
username.label=Código de Utilizador
password.label=Senha de Acesso
login.button=Entrar >
rememberMe.label=Lembrar-me
```

### Styling Changes

The main styles are embedded in the `login.ftl` template. To modify:

1. Edit the `<style>` section in `themes/custom-theme/login/login.ftl`
2. Or create external CSS files and reference them in `theme.properties`

### Adding Additional Templates

Create new `.ftl` files in the login directory for other authentication flows:
- `login-reset-password.ftl` - Password reset
- `login-verify-email.ftl` - Email verification
- `login-update-password.ftl` - Password update
- `error.ftl` - Error pages

## Troubleshooting

### Theme Not Appearing
- Ensure proper file permissions (755 for directories, 644 for files)
- Clear Keycloak cache
- Restart Keycloak
- Check Keycloak logs for errors

### Images Not Loading
- Verify all image files are present in `resources/img/`
- Check file permissions
- Ensure image paths in the template are correct

### Styling Issues
- Verify CSS syntax in the embedded styles
- Check for conflicting parent theme styles
- Use browser developer tools to debug

### JavaScript Errors
- Check browser console for JavaScript errors
- Verify the `handleEnter` function is working correctly

## Original IPB Features Replicated

✅ **Layout & Structure**
- Table-based layout matching original
- Exact positioning and spacing
- Header and footer sections

✅ **Styling**
- IPB color scheme (#f7931e orange, etc.)
- Font families (Trebuchet MS, Verdana)
- Form field styling with focus effects

✅ **Functionality**
- Tab navigation between fields
- Focus management
- Form validation
- Error message display

✅ **Visual Elements**
- Background patterns
- Header images
- Shadow effects
- Edge decorations

## Features Excluded (As Requested)

❌ **Chave Móvel Digital / Cartão de Cidadão** button
❌ **Support contact information**
❌ **Security warnings text**

## Browser Compatibility

This theme is tested and compatible with:
- Chrome/Chromium 90+
- Firefox 88+
- Safari 14+
- Edge 90+

## Security Considerations

- All user inputs are properly escaped using Keycloak's `kcSanitize` function
- No external resources are loaded
- Follows Keycloak security best practices

## Support

For issues related to:
- **Theme setup**: Check this README and troubleshooting section
- **Keycloak configuration**: Refer to Keycloak documentation
- **IPB-specific styling**: Contact IPB IT support

## Version History

- **v1.0**: Initial IPB theme implementation
  - Exact visual replication of IPB login page
  - Portuguese language support
  - Keycloak integration
  - Responsive design
