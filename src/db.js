const mysql = require("mysql2");

// conexión con la bd
const db = mysql.createConnection({
    host: process.env.MYSQLHOST,
    user: process.env.MYSQLUSER,
    password: process.env.MYSQLPASSWORD,
    database: process.env.MYSQLDATABASE,
    port: process.env.MYSQLPORT
});

// conectar
db.connect(err => {
    if (err) {
        console.error("Error de conexión:", err);
    } else {
        console.log("Conectado a Railway 🚀");
    }
});

module.exports = db;