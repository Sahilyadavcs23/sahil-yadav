html-app/
├── index.html
├── server.js
├── package.json
└── Dockerfile

<!DOCTYPE html>
<html>
<head>
  <title>Hello from Docker</title>
</head>
<body>
  <h1>Hello, World!</h1>
</body>
</html>

const http = require('http');
const fs = require('fs');
const path = require('path');

const port = 3000;

const server = http.createServer((req, res) => {
  const filePath = path.join(__dirname, 'index.html');
  fs.readFile(filePath, (err, data) => {
    if (err) {
      res.writeHead(500);
      res.end('Error loading file');
    } else {
      res.writeHead(200, { 'Content-Type': 'text/html' });
      res.end(data);
    }
  });
});

server.listen(port, () => {
  console.log(Server running at http://localhost:${port});
});

# Use official Node.js image
FROM node:18-alpine

# Create app directory
WORKDIR /app

# Copy files
COPY . .

# Install dependencies (none in this case, but safe to include)
RUN npm install

# Expose port
EXPOSE 3000

# Start the server
CMD ["npm", "start"]