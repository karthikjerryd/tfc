# Use lightweight Nginx image
FROM nginx:alpine

# Copy website files to nginx directory
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start nginx server
CMD ["nginx", "-g", "daemon off;"]