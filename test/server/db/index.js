let mysql = require('mysql')

let db = mysql.createPool({
    host: '127.0.0.1',
    port: 8889,
    user: 'root',
    password: 'root',
    database: 'newww'
})

module.exports = db