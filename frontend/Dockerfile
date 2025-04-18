FROM node:20

WORKDIR /app

# The entrypoint script will handle project creation if needed
COPY frontend-docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/frontend-docker-entrypoint.sh

COPY vite.config.ts /

EXPOSE 5173

ENTRYPOINT ["frontend-docker-entrypoint.sh"]
CMD ["npm", "run", "dev"]