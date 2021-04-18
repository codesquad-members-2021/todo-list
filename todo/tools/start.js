const concurrently = require('concurrently');
concurrently([
  { command: 'npm:db-start', name: 'json-server', prefixColor: '#16c79a' },
  { command: 'npm:react-start', name: 'react-watch', prefixColor: '#98acf8' }
], {
  killOthers: ['failure', 'success'],
}).then(() => {
  console.log('GoodBye World~!!');
})