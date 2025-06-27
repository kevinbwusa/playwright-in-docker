# Use Node.js as the base image

FROM node:18



# Set the working directory

WORKDIR /app



# Copy necessary files

COPY package*.json playwright.config.ts ./

RUN npm install



# Install Playwright with dependencies

RUN npx playwright install --with-deps



# Copy test files

COPY . .



# Run Playwright tests and store reports in a persistent folder

CMD ["npx", "playwright", "test", "--reporter=html", "--output=playwright-report"]