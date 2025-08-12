#!/bin/bash

# Azure CLI deployment script for FinalStudyGPT Bot

# Variables
RESOURCE_GROUP="finalstudygpt-rg"
APP_NAME="finalstudygpt-bot"
LOCATION="East US"
TELEGRAM_BOT_TOKEN="7895605447:AAFxbZ7x0IP66_EbvPZWWSQrgkFsn2MhRlo"

echo "🚀 Starting Azure deployment..."

# Login to Azure
echo "📝 Please login to Azure..."
az login

# Create resource group
echo "📦 Creating resource group..."
az group create --name $RESOURCE_GROUP --location "$LOCATION"

# Create App Service plan (Free tier)
echo "🔧 Creating App Service plan..."
az appservice plan create \
    --name "${APP_NAME}-plan" \
    --resource-group $RESOURCE_GROUP \
    --sku F1 \
    --is-linux

# Create Web App
echo "🌐 Creating Web App..."
az webapp create \
    --resource-group $RESOURCE_GROUP \
    --plan "${APP_NAME}-plan" \
    --name $APP_NAME \
    --runtime "PYTHON|3.11"

# Set environment variables
echo "⚙️ Setting environment variables..."
az webapp config appsettings set \
    --resource-group $RESOURCE_GROUP \
    --name $APP_NAME \
    --settings TELEGRAM_BOT_TOKEN="$TELEGRAM_BOT_TOKEN"

# Configure startup command
echo "🔧 Setting startup command..."
az webapp config set \
    --resource-group $RESOURCE_GROUP \
    --name $APP_NAME \
    --startup-file "python main.py"

# Deploy from GitHub
echo "📥 Setting up GitHub deployment..."
az webapp deployment source config \
    --resource-group $RESOURCE_GROUP \
    --name $APP_NAME \
    --repo-url "https://github.com/Stranger-bot1/finalstudygpt" \
    --branch main \
    --manual-integration

echo "✅ Deployment completed!"
echo "🌐 Your bot will be available at: https://${APP_NAME}.azurewebsites.net"
echo "📝 Check logs at: https://portal.azure.com"
