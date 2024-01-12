// controllers/StudentController.js

import Student from "../models/Student.js";

class StudentController {
    async index(req, res) {
        try {
            const students = await Student.findAll();
            const data = {
                message: "Get all students",
                data: students,
            };
            res.json(data);
        } catch (error) {
            console.error("Error fetching students from the database:", error);
            res.status(500).json({ message: "Internal Server Error" });
        }
    }

    async store(req, res) {
        try {
            const { nama, nim, email, jurusan } = req.body;
            const newStudent = await Student.create({ nama, nim, email, jurusan });
            const data = {
                message: `Menambahkan data student ${nama}`,
                data: newStudent,
            };
            res.json(data);
        } catch (error) {
            console.error("Error adding student to the database:", error);

            if (error.name === 'SequelizeValidationError') {
                const validationErrors = error.errors.map(err => ({
                    message: err.message,
                    field: err.path,
                }));
                res.status(422).json({ message: "Validation Error", errors: validationErrors });
            } else {
                res.status(500).json({ message: "Internal Server Error" });
            }
        }
    }

    async update(req, res) {
        const { id } = req.params;
        const { nama, nim, email, jurusan } = req.body;

        try {
            const [updatedRowsCount] = await Student.update(
                { nama, nim, email, jurusan },
                { where: { id } }
            );

            if (updatedRowsCount > 0) {
                const updatedStudent = await Student.findByPk(id);
                const data = {
                    message: `Mengupdate data student id ${id} dengan nama ${nama}`,
                    data: updatedStudent,
                };
                res.json(data);
            } else {
                res.status(404).json({ message: "Student not found" });
            }
        } catch (error) {
            console.error("Error updating student in the database:", error);
            res.status(500).json({ message: "Internal Server Error" });
        }
    }

    async destroy(req, res) {
        const { id } = req.params;

        try {
            const deletedRowsCount = await Student.destroy({ where: { id } });

            if (deletedRowsCount > 0) {
                const data = {
                    message: `Menghapus data student id ${id}`,
                    data: { id: parseInt(id) },
                };
                res.json(data);
            } else {
                res.status(404).json({ message: "Student not found" });
            }
        } catch (error) {
            console.error("Error deleting student from the database:", error);
            res.status(500).json({ message: "Internal Server Error" });
        }
    }
}

const studentController = new StudentController();
export default studentController;
