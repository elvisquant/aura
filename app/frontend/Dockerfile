# Use a lightweight Nginx image to serve static files
FROM nginx:1.21-alpine

# Copy the static content of your frontend into the Nginx html directory
COPY ./static /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# The default Nginx command will start the server.
CMD ["nginx", "-g", "daemon off;"]
