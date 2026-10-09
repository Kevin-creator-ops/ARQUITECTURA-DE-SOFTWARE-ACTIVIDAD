const assert = require('assert');
const { getRootHandler } = require('./server.js');

console.log('Iniciando pruebas unitarias...');

try {
  const req = {};
  let responseData = null;
  let statusCode = null;

  // Mock del objeto response de Express
  const res = {
    status: function (code) {
      statusCode = code;
      return this;
    },
    json: function (data) {
      responseData = data;
      return this;
    }
  };

  getRootHandler(req, res);

  assert.strictEqual(statusCode, 200, 'El código de estado debe ser 200');
  assert.strictEqual(
    responseData.message,
    '¡Hola, Cloud-Native! El microservicio está funcionando correctamente.',
    'El mensaje devuelto no es el esperado'
  );

  console.log('✅ Todas las pruebas pasaron exitosamente.');
  process.exit(0);
} catch (error) {
  console.error('❌ La prueba ha fallado:');
  console.error(error);
  process.exit(1);
}
