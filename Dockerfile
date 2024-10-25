# Use a specific version tag to avoid pulling every time
FROM node:20.0.0-alpine AS base

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies (cached layer)
RUN npm install

# Copy application files
COPY . .

# Build the application
RUN npm run build

# Step 6: Expose the port the app runs on
EXPOSE 4000

# Start the application
CMD ["npm", "start"]




