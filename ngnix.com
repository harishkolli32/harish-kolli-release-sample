lways serve index.html for any request
  location / {
    # Set path
    root /var/www/;
    try_files $uri /index.html;
  }

# Do not cache sw.js, required for offline-first updates.
  location /sw.js {
      add_header Cache-Control "no-cache";
      proxy_cache_bypass $http_pragma;
      proxy_cache_revalidate on;
      expires off;
      access_log of
