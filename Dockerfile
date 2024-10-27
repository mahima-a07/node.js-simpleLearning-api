# Step 1: Use an official Ubuntu base image
FROM ubuntu:latest

# Step 2: Install Node.js and npm
RUN apt-get update && apt-get install -y curl \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# Step 3: Set the working directory
WORKDIR /app

# Step 4: Copy package.json and package-lock.json files
COPY package*.json ./

# Step 5: Install dependencies
RUN npm install

# Step 6: Copy the rest of the application code
COPY . .

# Step 7: Expose the port your app runs on
EXPOSE 4000

# Step 8: Define the command to run the application
CMD ["npm", "start"]
