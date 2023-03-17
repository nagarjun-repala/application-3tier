# Stage 1 - Build the React app
FROM node:14-alpine as build

WORKDIR /app

# Copy package.json and package-lock.json files to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the container
COPY . .
ARG REACT_APP_BACKEND_BASE_URL
ENV REACT_APP_BACKEND_BASE_URL=${REACT_APP_BACKEND_BASE_URL}


# Build the React app
RUN npm run build

# Stage 2 - Serve the app with Nginx
FROM nginx:1.21-alpine

# Remove the default Nginx configuration file
RUN rm -rf /etc/nginx/conf.d/default.conf

# Copy the Nginx configuration file to the container
COPY nginx.conf /etc/nginx/conf.d

# Copy the React app from the previous stage to the container
COPY --from=build /app/build /usr/share/nginx/html

# Expose port 80 to the outside world
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
