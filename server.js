const express = require('express');
const app = express();
const port = 3000;

// Exportamos la función manejadora para facilitar el testing
const getRootHandler = (req, res) => {
  res.status(200).json({ message: '¡Hola, Cloud-Native! El microservicio está funcionando correctamente.' });
};

app.get('/', getRootHandler);

// Evitamos que el puerto se abra si requerimos el archivo en un entorno de pruebas
if (require.main === module) {
  app.listen(port, () => {
    console.log(`Servidor ejecutándose en http://localhost:${port}`);
  });
}

module.exports = { app, getRootHandler };
