<!-- Use this file to provide workspace-specific custom instructions to Copilot. For more details, visit https://code.visualstudio.com/docs/copilot/copilot-customization#_use-a-githubcopilotinstructionsmd-file -->

# Keycloak Theme Development Instructions

This workspace is for developing custom Keycloak themes, specifically focusing on login page customization.

## Key Guidelines:
- Follow Keycloak theme structure: themes/{theme-name}/{theme-type}/
- Use FreeMarker templates (.ftl files) for dynamic content
- CSS files should be placed in resources/css/
- Images should be placed in resources/img/
- Always test themes in a development Keycloak instance before deploying
- Remember that theme changes require Keycloak restart or cache clearing
- Use Keycloak's built-in variables and macros for consistency
- Maintain responsive design principles
- Consider accessibility standards (WCAG)

## Theme Types:
- login: Login pages and related authentication flows
- account: User account management pages
- admin: Admin console themes (less common for customization)
- email: Email templates

## Common FreeMarker Variables:
- ${url.loginAction}: Login form action URL
- ${url.registrationUrl}: Registration page URL
- ${realm.displayName}: Realm display name
- ${client.name}: Client application name
- ${message.summary}: Localized messages

When making changes, always consider:
1. Cross-browser compatibility
2. Mobile responsiveness
3. Accessibility features
4. Internationalization support
5. Security implications
