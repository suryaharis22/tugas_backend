// models/Student.js

import { DataTypes } from 'sequelize';
import sequelize from '../config/database.js';

const Student = sequelize.define('students', {
    nama: {
        type: DataTypes.STRING,
        allowNull: false, // If you want the 'nama' field to be required
    },
    nim: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    email: {
        type: DataTypes.STRING,
        allowNull: false,
    },
    jurusan: {
        type: DataTypes.STRING,
        allowNull: false,
    },
});

export default Student;
