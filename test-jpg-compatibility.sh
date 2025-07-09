#!/bin/bash

# Test script for JPG image compatibility
# This script helps you test the JPG image on both desktop and mobile

echo "🧪 Testing JPG Image Compatibility"
echo "=================================="
echo ""

# Configuration
REMOTE_HOST="shahadat@ldap.ccom.ipb.pt"
KEYCLOAK_PATH="/etc/keycloak-26.0.7"
THEME_NAME="IPB_custom-theme"

# Check if JPG image exists on server
echo "📋 Checking JPG image on server..."
ssh $REMOTE_HOST "cd $KEYCLOAK_PATH/themes/$THEME_NAME/login/resources/img && ls -la header_left.jpg"

if [ $? -eq 0 ]; then
    echo "✅ JPG image found on server"
else
    echo "❌ JPG image not found on server"
    exit 1
fi

echo ""
echo "🖥️  Desktop Testing:"
echo "===================="
echo "1. Open your browser on desktop"
echo "2. Go to your Keycloak login page"
echo "3. Open Developer Tools (F12)"
echo "4. Go to Console tab"
echo "5. Look for these messages:"
echo "   - 'Testing with JPG image instead of PNG for mobile compatibility'"
echo "   - 'Header image found (JPG): [URL]'"
echo "   - 'Image loaded successfully'"
echo ""

echo "📱 Mobile Testing:"
echo "=================="
echo "1. Open your mobile browser"
echo "2. Go to your Keycloak login page"
echo "3. Check if the IPB logo appears in the header"
echo "4. If you can access mobile developer tools:"
echo "   - Look for the same console messages"
echo "   - Check if 'Image loaded successfully' appears"
echo ""

echo "🔍 What to Look For:"
echo "===================="
echo "✅ SUCCESS indicators:"
echo "   - IPB logo visible in header (both desktop and mobile)"
echo "   - Console shows 'Image loaded successfully'"
echo "   - No console errors about image loading"
echo "   - Header layout looks correct"
echo ""
echo "❌ FAILURE indicators:"
echo "   - Empty space where logo should be"
echo "   - Console shows 'Image failed to load'"
echo "   - Console shows 'JPG failed, trying PNG fallback'"
echo ""

echo "📊 Test Results:"
echo "================"
echo "Please test and report back:"
echo ""
echo "Desktop (Chrome/Firefox/Safari/Edge):"
echo "[ ] Logo visible: YES/NO"
echo "[ ] Console errors: YES/NO"
echo ""
echo "Mobile (iOS Safari/Android Chrome):"
echo "[ ] Logo visible: YES/NO"
echo "[ ] Layout correct: YES/NO"
echo ""

echo "🔄 If JPG still doesn't work on mobile:"
echo "========================================"
echo "We can try these additional approaches:"
echo "1. Convert to different JPG compression quality"
echo "2. Try WebP format for modern browsers"
echo "3. Use SVG format (if available)"
echo "4. Implement base64 embedded image"
echo "5. Try different image dimensions"
echo ""

echo "📞 Quick Test Commands:"
echo "======================="
echo "Check image format on server:"
echo "ssh $REMOTE_HOST 'cd $KEYCLOAK_PATH/themes/$THEME_NAME/login/resources/img && file header_left.jpg'"
echo ""
echo "Check image size:"
echo "ssh $REMOTE_HOST 'cd $KEYCLOAK_PATH/themes/$THEME_NAME/login/resources/img && du -h header_left.jpg'"
echo ""
echo "View image properties:"
echo "ssh $REMOTE_HOST 'cd $KEYCLOAK_PATH/themes/$THEME_NAME/login/resources/img && identify header_left.jpg 2>/dev/null || echo \"ImageMagick not available\"'"
echo ""

echo "🎯 Expected Outcome:"
echo "===================="
echo "The JPG format should work better on mobile browsers"
echo "because it's more universally supported and has better"
echo "compression, making it load faster on mobile connections."
echo ""
echo "If the JPG works on mobile, we'll know the issue was"
echo "PNG-specific and can update the documentation accordingly."
