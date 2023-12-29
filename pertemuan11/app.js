// app.js

import express from "express";
import router from "./routes/api.js";
import sequelize from "./config/database.js";
import Student from "./models/Student.js";

const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use(router);

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});

// Synchronize Sequelize models with the database
sequelize.sync({ force: true }).then(() => {
    console.log("Database synchronized");
});
