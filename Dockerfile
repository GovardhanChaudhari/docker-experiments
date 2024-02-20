FROM nginx:stable

# Set working directory
WORKDIR /var/www/nginx

# Copy custom Nginx configuration file
COPY nginx.conf /etc/nginx.conf

# Expose port 80 for incoming requests
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]