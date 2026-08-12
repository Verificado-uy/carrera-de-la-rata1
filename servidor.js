const http = require('http');
const fs = require('fs');

const port = 8080;
const file = 'juego_rata.html';

http.createServer((req, res) => {
  console.log('Solicitud:', req.url);
  
  // Servir el archivo HTML
  fs.readFile(file, (err, content) => {
    if (err) {
      res.writeHead(500);
      res.end('Error: No se pudo cargar el archivo');
    } else {
      res.writeHead(200, { 'Content-Type': 'text/html; charset=utf-8' });
      res.end(content);
    }
  });
}).listen(port, () => {
  console.log('Servidor corriendo en http://localhost:' + port);
  console.log('Visita: http://localhost:' + port + '/juego_rata.html');
});
