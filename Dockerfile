# Use Node.js as the base image
FROM node:18

# Set environment variables to avoid prompts during installation
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

# Set the working directory
WORKDIR /app

# Copy necessary files
COPY package*.json playwright.config.ts ./

# Install system dependencies for Playwright
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    libnss3 \
    libgbm-dev  # For Chromium

# Install Node.js dependencies
RUN npm install

# Install Playwright with dependencies
RUN npx playwright install --with-deps

# Copy test files
COPY . .

# Run Playwright tests and store reports in a persistent folder
CMD ["npx", "playwright", "test", "--reporter=html", "--output=playwright-report"]