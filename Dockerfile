# Stage 1: Build the application
FROM node:20-alpine AS builder

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies (use --production to install only production dependencies)
RUN npm install --production

# Copy the rest of the application code
COPY . .

# Stage 2: Create a smaller image for production
FROM node:20-alpine

# Set the working directory
WORKDIR /app

# Copy only the necessary files from the builder stage
COPY --from=builder /app .

# Expose the port your app runs on
EXPOSE 4000

# Define the command to run the application
CMD ["npm", "start"]
