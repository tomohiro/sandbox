const WebSocket = require('ws');

const port = 8080;
const wss = new WebSocket.Server({ port: port});

console.log('Server listen on %s', port);
console.log('Presss `CTRL + C` to quit');
console.log('Waiting access from clients...');

wss.on('connection', ws => {
  console.log('Client Connected');

  ws.on('message', message => {
    console.log('Received: %s', message);

    console.log('Send: %s', message);
    wss.clients.forEach(client => client.send(message));
  });

  ws.on('close', () => console.log('Client was disconnected'));
});
