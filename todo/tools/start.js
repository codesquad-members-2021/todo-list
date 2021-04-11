const concurrently = require('concurrently');
concurrently([
  { command: 'npm:react-start', name: 'react-watch', prefixColor: '#98acf8' },
  { command: 'npm:db-start', name: 'json-server', prefixColor: '#16c79a' }
], {
  killOthers: ['failure', 'success'],
}).then(() => {
  console.log('GoodBye World~!!');
})