// config/database.js

import { Sequelize } from "sequelize";
import "dotenv/config";

const {
    DB_DATABASE,
    DB_USERNAME,
    DB_PASSWORD,
    DB_HOST,
} = process.env;

const sequelize = new Sequelize({
    database: DB_DATABASE,
    username: DB_USERNAME,
    password: DB_PASSWORD,
    host: DB_HOST,
    dialect: "mysql",
    logging: console.log,
});

const testDatabaseConnection = async () => {
    try {
        await sequelize.authenticate();
        console.log("Database connected");
    } catch (error) {
        console.error("Cannot connect to the database:", error);
    }
};

testDatabaseConnection();

export default sequelize;
