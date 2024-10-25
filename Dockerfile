# Step 1: Use an official Node.js 20 runtime as the base image
FROM node:20-alpine

# Step 2: Set the working directory in the container
WORKDIR /app

# Step 3: Copy the package.json and package-lock.json files
COPY package*.json ./

# Step 4: Install dependencies
RUN npm install

# Step 5: Copy the rest of the application code
COPY . .

# Step 6: Expose the port the app runs on
EXPOSE 4000

# Step 7: Define the command to run the application
CMD ["npm", "start"]

