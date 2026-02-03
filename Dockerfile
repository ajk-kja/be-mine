FROM nginx:alpine

# Remove default nginx config
RUN rm -f /etc/nginx/conf.d/default.conf

# Copy custom nginx config
COPY nginx.conf /etc/nginx/nginx.conf

# Copy distribution files
COPY dist /usr/share/nginx/html

# Set permissions for non-root user (consistent with cd_player)
RUN chmod -R 755 /usr/share/nginx/html && \
    chown -R nginx:nginx /usr/share/nginx/html && \
    chown -R nginx:nginx /var/cache/nginx && \
    chown -R nginx:nginx /var/log/nginx && \
    touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid && \
    # Ensure config is read-only for nginx user
    chmod 644 /etc/nginx/nginx.conf

# Run as non-root nginx user
USER nginx

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
