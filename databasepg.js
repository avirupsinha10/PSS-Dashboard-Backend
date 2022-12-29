const {Client} = require('pg');

const client = new Client ({
    host: 'localhost',
    user: 'postgres',
    port: 5432,
    password: 'root',
    database: 'pssdb'
});

client.connect();

client.query(`Select * from users`,(err,res) => {
    if(!err) {
        console.log(res.rows[0]);
    } else {
        console.log(err.message);
    }
    client.end;
})

module.exports = client;