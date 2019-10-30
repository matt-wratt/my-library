const Hapi = require('@hapi/hapi')
const Inert = require('@hapi/inert')
const fs = require('fs')
const Path = require('path')

boot()

async function boot() {
  const host = 'localhost'
  const port = '8086'
  const server = Hapi.server({ host, port })

  await server.register(Inert)

  const method = 'get'
  const path = '/{path*}'

  server.route({
    method,
    path,
    handler: {
      file: Path.join(__dirname, '../public/index.html'),
    },
  })

  await server.start()
  console.log(`Server listening on http://${host}:${port}`)
}
