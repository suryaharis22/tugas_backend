// app.js

import express from "express";
import router from "./routes/api.js";
import sequelize from "./config/database.js";

// import middleware
// import auth from "./middleware/auth.js";
import loggerMiddleware from "./middleware/logger.js";

const app = express();

// Middleware setup
app.use(loggerMiddleware); // Add logger middleware
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Mounting the API routes
app.use(router);

// Error handling middleware
app.use((err, req, res, next) => {
    console.error(err.stack);
    res.status(500).json({ message: "Internal Server Error" });
});

const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}`);
});

// Synchronize Sequelize models with the database
const forceSync = process.env.NODE_ENV === 'development';

sequelize.sync({ force: forceSync }).then(() => {
    console.log("Database synchronized");
});
