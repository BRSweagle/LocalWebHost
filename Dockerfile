# Base Image used
FROM nginx:latest

# Install curl with apt-get (for debugging purpose inside container)
#RUN apt-get update \
#&& apt-get install -y curl \
#&& rm -rf /var/lib/apt/lists/*

# Changement du repertoire courant
#WORKDIR /app

# Add nginx config file


# Add website files
COPY ./public/ /usr/share/nginx/html/
# For debug
#RUN ls -la /usr/share/nginx/html/*

# expose port to outside container
EXPOSE 80

# Share a specific volume
#VOLUME /app/log

# Launch nginx web server
CMD ["nginx", "-g", "daemon off;"]
