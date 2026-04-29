const express = require("express");
const cors = require("cors");
const db = require("./db"); // 👈 importar conexión

const app = express();
app.use(cors());

// endpoint de prueba
app.get("/personas", (req, res) => {
  db.query("SELECT * FROM Persona", (err, result) => {
    if (err) return res.send(err);
    res.json(result);
    });
});

app.listen(3000, () => {
    console.log("Servidor en http://localhost:3000");
});

app.use(express.static("public"));