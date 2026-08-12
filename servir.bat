@echo off
echo Iniciando servidor web local para el juego...
echo.
echo Abriendo navegador en http://localhost:8080...
echo.
rem Intentar con Python primero
python -m http.server 8080 >nul 2>&1 &
rem Esperar un momento
timeout /t 2 >nul
rem Si Python no funciona, intentar con Node.js
node -e "require('http').createServer((req, res) => { res.writeHead(200, {'Content-Type': 'text/html'}); res.end(require('fs').readFileSync('juego_rata.html')); }).listen(8080)" >nul 2>&1 &
rem Abrir navegador
start "" http://localhost:8080/juego_rata.html
echo.
echo Si el navegador no se abre automáticamente, visita:
echo http://localhost:8080/juego_rata.html
pause
