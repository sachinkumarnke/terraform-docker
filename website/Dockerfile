# Use nginx as base image
FROM nginx:latest

# Remove default nginx content
RUN rm -rf /usr/share/nginx/html/*

# Copy our static HTML site
COPY . /usr/share/nginx/html

EXPOSE 80
