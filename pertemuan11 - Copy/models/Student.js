// models/Student.js

import { DataTypes } from "sequelize";
import sequelize from "../config/database";

const Student = sequelize.define("Student", {
    // Define model attributes
    name: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    age: {
        type: DataTypes.INTEGER,
        allowNull: false,
    },
    // Add more attributes as needed
});

// Synchronize the model with the database
Student.sync();

export default Student;
