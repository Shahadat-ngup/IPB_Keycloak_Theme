# Changelog

All notable changes to the IPB Custom Keycloak Theme project will be documented in this file.

## [1.0.0] - 2024-12-XX

### Added
- Initial release of IPB Custom Keycloak Theme
- Custom `login.ftl` template with simplified header design
- Responsive CSS for desktop, tablet, and mobile devices
- Single header image implementation (`header_left.png`)
- Left-aligned header layout for all screen sizes
- JavaScript fallback for image loading errors
- Deployment script (`deploy-theme.sh`) for automated installation
- Comprehensive README with installation and troubleshooting guides
- MIT License

### Features
- ✅ Desktop browser compatibility (Chrome, Firefox, Safari, Edge)
- ✅ Mobile responsive layout
- ✅ Form validation and error handling
- ✅ Clean, professional design
- ✅ Left-aligned IPB branding
- ✅ Fallback text when image fails to load

### Known Issues
- ⚠️ Mobile image display: `header_left.png` may not render on some mobile browsers
  - Layout and functionality remain intact
  - Fallback text displays properly
  - Under investigation - may be PNG compatibility issue

### Technical Details
- **Target Keycloak Version**: 26.0.7
- **Theme Structure**: Follows Keycloak theme conventions
- **Responsive Breakpoints**: 768px (tablet), 480px (mobile)
- **Primary Image**: `header_left.png` (only image used in header)
- **Fallback Strategy**: Text display when image loading fails

### Files Modified
- `themes/IPB_custom-theme/login/login.ftl` - Main template (heavily customized)
- `themes/IPB_custom-theme/login/theme.properties` - Theme configuration
- `themes/IPB_custom-theme/login/resources/css/` - Custom stylesheets
- `themes/IPB_custom-theme/login/resources/img/header_left.png` - Primary header image

### Development Notes
- Removed all decorative images except `header_left.png`
- Implemented mobile-first responsive design
- Added comprehensive error handling and fallbacks
- Optimized for production deployment
- Removed debugging code and styling

### Future Considerations
- [ ] Investigate mobile PNG rendering issue
- [ ] Consider JPG conversion for better mobile compatibility
- [ ] Test on additional mobile browsers
- [ ] Implement alternative mobile image strategy if needed
