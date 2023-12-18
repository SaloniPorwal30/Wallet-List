# Use an official Node.js image as the base image
FROM node:18

# Set the working directory inside the container
WORKDIR /app

# Copy the Node.js script into the container at /app
COPY package.json .
COPY package-lock.json .
COPY EventListner.js .

# Install npm packages
RUN npm install

# Expose any necessary ports
# EXPOSE 8080

# Specify the command to run on container start
CMD ["node", "EventListner.js"]
