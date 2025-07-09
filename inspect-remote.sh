#!/bin/bash

# Script to inspect remote Keycloak setup and themes
# This helps you understand your current setup before deploying

# Configuration
REMOTE_HOST="shahadat@ldap.ccom.ipb.pt"
KEYCLOAK_PATH="/etc/keycloak-26.0.7"
THEME_NAME="IPB_custom-theme"

echo "🔍 Inspecting remote Keycloak setup..."
echo "===================================="

# Check Keycloak directory structure
echo "📁 Keycloak main directory:"
ssh $REMOTE_HOST "cd $KEYCLOAK_PATH && ls -la"
echo ""

# Check themes directory
echo "🎨 Themes directory structure:"
ssh $REMOTE_HOST "cd $KEYCLOAK_PATH/themes && ls -la"
echo ""

# Check existing themes structure
echo "📋 Existing theme details:"
ssh $REMOTE_HOST "cd $KEYCLOAK_PATH/themes && for theme in */; do echo \"Theme: \$theme\"; find \"\$theme\" -type d 2>/dev/null | head -5; echo ''; done"

# Check if mytheme exists and its structure
echo "🔍 Checking 'mytheme' structure (if exists):"
ssh $REMOTE_HOST "cd $KEYCLOAK_PATH/themes && if [ -d 'mytheme' ]; then echo 'mytheme exists:'; find mytheme -type f | head -10; else echo 'mytheme not found'; fi"
echo ""

# Check Keycloak process
echo "⚙️  Keycloak process status:"
ssh $REMOTE_HOST "ps aux | grep keycloak | grep -v grep || echo 'Keycloak process not found'"
echo ""

# Check Keycloak configuration
echo "📝 Keycloak configuration files:"
ssh $REMOTE_HOST "cd $KEYCLOAK_PATH/conf && ls -la *.conf 2>/dev/null || echo 'No .conf files found'"
echo ""

# Check logs directory
echo "📄 Recent log files:"
ssh $REMOTE_HOST "cd $KEYCLOAK_PATH && find . -name '*.log' -mtime -7 2>/dev/null | head -5 || echo 'No recent log files found'"
echo ""

echo "✅ Remote inspection completed!"
echo ""
echo "💡 Notes:"
echo "   - 'mytheme' appears to be an existing custom theme"
echo "   - 'webauthPasswordless' is likely a built-in or additional theme"
echo "   - 'login.ftl' in themes root might be a standalone template"
echo ""
echo "🚀 You can now run './deploy-theme.sh' to deploy your custom theme"
