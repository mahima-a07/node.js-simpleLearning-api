# Use Node.js to build the app first
FROM node:20 as build

# Set working directory and copy dependencies
WORKDIR /app
COPY package*.json ./
RUN npm install

# Copy application code and build
COPY . .
RUN npm run build

# Use distroless as the runtime base image
FROM gcr.io/distroless/nodejs20

# Copy built app from the previous stage
COPY --from=build /app /app

# Set working directory and expose port
WORKDIR /app
EXPOSE 4000

# Start the app
CMD ["app/index.js"]





