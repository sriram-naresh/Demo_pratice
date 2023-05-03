# Use the official Node.js 14 base image
FROM node:14

# Create a new directory for the application files
WORKDIR /app

# Copy the application files to the container
COPY . .

# Install any dependencies
RUN npm install

# Expose port 3000 for incoming traffic
EXPOSE 3000

# Start the application
CMD [ "node", "index.js" ]
