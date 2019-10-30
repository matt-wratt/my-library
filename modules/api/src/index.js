const Hapi = require('@hapi/hapi')

const host = 'localhost'
const port = '8086'
const server = Hapi.server({ host, port })

const method = 'get'
const path = '/'

server.route({ method, path, handler })

server
  .start()
  .then(() => console.log(`Server listening on http://${host}:${port}`))

function handler(request, h) {
  return 'Hello World!'
}
