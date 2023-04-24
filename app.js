var http = require('http');
http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Hello World\n');
}).listen(3000, '34.27.178.42');
console.log('Server running at http://34.27.178.42:3000/');