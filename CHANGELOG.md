# Changelog

All notable changes to the IPB Custom Keycloak Theme project will be documented in this file.

## [1.1.0] - 2024-12-09

### Fixed
- 🔧 **Mobile Image Display Issue Resolved**: Switched from PNG to JPG format for header image
- ✅ Header image (`header_left.jpg`) now displays correctly on all mobile browsers
- 📱 Improved mobile performance with smaller file size (6.5KB vs 17.5KB)
- 🚀 Enhanced mobile compatibility across iOS Safari, Android Chrome, Samsung Internet

### Changed
- Updated main header image from `header_left.png` to `header_left.jpg`
- Improved JavaScript fallback to try PNG if JPG fails
- Updated console logging for better debugging of image format testing
- Enhanced image rendering settings for better mobile compatibility

### Documentation
- Updated README.md to reflect mobile issue resolution
- Added mobile compatibility verification status
- Updated project status from "under investigation" to "production ready"

## [1.0.0] - 2024-12-08

## [1.0.0] - 2024-12-08

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

### Known Issues (Resolved in v1.1.0)
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
