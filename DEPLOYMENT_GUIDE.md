# IPB Keycloak Theme Deployment Guide

## Your Remote Server Setup
```
Server: shahadat@ldap.ccom.ipb.pt
Keycloak Path: /etc/keycloak-26.0.7/
Existing Themes: mytheme, webauthPasswordless
```

## Quick Start

1. **Inspect your current setup** (optional but recommended):
   ```bash
   ./inspect-remote.sh
   ```

2. **Deploy the IPB theme**:
   ```bash
   ./deploy-theme.sh
   ```

3. **SSH to your server and restart Keycloak**:
   ```bash
   ssh shahadat@ldap.ccom.ipb.pt
   cd /etc/keycloak-26.0.7/
   bin/kc.sh start
   ```

4. **Configure the theme in Keycloak Admin**:
   - Access your Keycloak admin console
   - Go to your realm settings
   - Click "Themes" tab
   - Set "Login Theme" to "IPB_custom-theme"
   - Click "Save"

## Theme Structure Created

Your custom theme includes:
- **Exact IPB visual design** matching the original HTML
- **Portuguese language support**
- **Responsive layout**
- **All required images** (placeholders - replace with actual IPB images)
- **Custom styling** that replicates the original appearance

## Files Created

```
themes/IPB_custom-theme/
├── login/
│   ├── login.ftl                    # Main login template (IPB design)
│   ├── login-reset-password.ftl     # Password reset page
│   ├── login-verify-email.ftl       # Email verification page
│   ├── theme.properties             # Theme configuration
│   ├── messages/
│   │   └── messages_en.properties   # Custom messages
│   └── resources/
│       └── img/                     # Image placeholders
│           ├── background.png
│           ├── banner-background.png
│           ├── banner-background2.png
│           ├── header_left.png
│           ├── 2header_left.png
│           ├── 2header_right.png
│           ├── content-bottom-edge-left.png
│           ├── content-bottom-edge-right.png
│           ├── spacer.gif
│           ├── shadow1.gif
│           └── shadow2.png
└── account/
    └── theme.properties             # Account theme config
```

## Important Notes

1. **Image Replacement**: The created images are placeholders. Replace them with actual IPB images for the complete visual match.

2. **Removed Sections**: As requested, the following sections were removed:
   - Chave Móvel Digital / Cartão de Cidadão login
   - Support contact information
   - Security warnings

3. **Form Integration**: The template uses Keycloak's form variables:
   - `${url.loginAction}` for form submission
   - `${login.username}` for username field
   - Keycloak's CSRF protection
   - Standard error handling

4. **Keycloak Variables**: Key variables used:
   - `${realm.displayName}` - Realm name
   - `${msg("...")}` - Localized messages
   - `${url.loginResetCredentialsUrl}` - Password reset link

## Troubleshooting

- **Theme not appearing**: Check file permissions and restart Keycloak
- **Images not loading**: Verify image files are in the correct directory
- **Styling issues**: Check browser console for CSS errors
- **Form not working**: Verify Keycloak form variables are correctly mapped

## Customization

To further customize:
1. Edit `themes/IPB_custom-theme/login/login.ftl` for layout changes
2. Modify inline CSS in the template for styling adjustments
3. Update `messages/messages_en.properties` for text changes
4. Replace placeholder images with actual IPB assets
