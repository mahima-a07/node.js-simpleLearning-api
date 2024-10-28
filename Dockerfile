# Step 1: Use an official Ubuntu 20.04 base image
FROM ubuntu:20.04

# Step 2: Update and install Node.js and npm
RUN apt-get update && apt-get install -y nodejs npm

# Step 3: Set the working directory
WORKDIR /app

# Step 4: Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Step 5: Copy the rest of the application code
COPY . .

# Step 6: Expose the port your app runs on
EXPOSE 4000

# Step 7: Define the command to run the application
CMD ["npm", "start"]
