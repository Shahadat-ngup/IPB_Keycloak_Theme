#!/bin/bash

# Deployment script for Keycloak theme
# This script helps deploy the theme to your remote Keycloak server

# Configuration
REMOTE_HOST="shahadat@ldap.ccom.ipb.pt"
KEYCLOAK_PATH="/etc/keycloak-26.0.7"
THEME_NAME="IPB_custom-theme"

echo "🚀 Deploying Keycloak theme to remote server..."

# Check if local theme directory exists
if [ ! -d "themes/$THEME_NAME" ]; then
    echo "❌ Error: Theme directory 'themes/$THEME_NAME' not found locally!"
    exit 1
fi

# Show remote themes directory structure
echo "📋 Current remote themes directory:"
ssh $REMOTE_HOST "cd $KEYCLOAK_PATH/themes && ls -la"

# Create backup of existing theme (if it exists)
echo "📦 Creating backup of existing theme..."
ssh $REMOTE_HOST "cd $KEYCLOAK_PATH/themes && if [ -d '$THEME_NAME' ]; then mv '$THEME_NAME' '${THEME_NAME}_backup_$(date +%Y%m%d_%H%M%S)'; echo 'Backup created for existing $THEME_NAME'; else echo 'No existing $THEME_NAME theme found'; fi"

# Copy theme to remote server
echo "📂 Copying theme files..."
scp -r themes/$THEME_NAME $REMOTE_HOST:$KEYCLOAK_PATH/themes/

# Check if copy was successful
if [ $? -eq 0 ]; then
    echo "✅ Theme files copied successfully"
else
    echo "❌ Error copying theme files"
    exit 1
fi

# Set proper permissions (try with sudo if needed)
echo "🔐 Setting permissions..."
ssh $REMOTE_HOST "cd $KEYCLOAK_PATH/themes && sudo chown -R shahadat:shahadat $THEME_NAME 2>/dev/null || chown -R shahadat:shahadat $THEME_NAME 2>/dev/null || echo 'Permission change may require manual adjustment'"
ssh $REMOTE_HOST "cd $KEYCLOAK_PATH/themes && chmod -R 755 $THEME_NAME"

# Clear Keycloak cache and check deployment
echo "🧹 Clearing Keycloak cache..."
ssh $REMOTE_HOST "cd $KEYCLOAK_PATH && rm -rf data/tmp/* data/cache/* 2>/dev/null || echo 'Cache clearing completed (some directories may not exist)'"

# Verify theme deployment
echo "🔍 Verifying theme deployment..."
ssh $REMOTE_HOST "cd $KEYCLOAK_PATH/themes && echo 'Themes directory contents:' && ls -la && echo '' && echo 'Custom theme structure:' && if [ -d '$THEME_NAME' ]; then find $THEME_NAME -type f | head -10; else echo 'Theme not found!'; fi"

echo "✅ Theme deployment completed!"
echo ""
echo "📝 Next steps:"
echo "1. Restart Keycloak: ssh $REMOTE_HOST 'cd $KEYCLOAK_PATH && sudo bin/kc.sh start --optimized' "
echo "   (or just: ssh $REMOTE_HOST 'cd $KEYCLOAK_PATH && bin/kc.sh start')"
echo ""
echo "2. Access Keycloak Admin Console:"
echo "   - Go to your realm settings"
echo "   - Click on 'Themes' tab"
echo "   - Select '$THEME_NAME' for Login Theme"
echo "   - Click 'Save'"
echo ""
echo "3. Test the theme:"
echo "   - Go to your realm's login page"
echo "   - You should see the IPB-style login interface"
echo ""
echo "🌐 Your custom IPB login theme should now be active!"
echo ""
echo "💡 Troubleshooting:"
echo "   - If theme doesn't appear, check file permissions"
echo "   - Ensure Keycloak service has been restarted"
echo "   - Check Keycloak logs for any theme-related errors"
