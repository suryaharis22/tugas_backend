// app.js

import express from "express";
import router from "./routes/api.js";

const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use(router);

const PORT = 3000;

app.listen(PORT, () => console.log(`Server running on http://localhost:${PORT}`));
