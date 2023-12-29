// controllers/StudentController.js

class StudentController {
    students = [];

    index = (req, res) => {
        const data = {
            message: "Get all students",
            data: this.students,
        };
        res.json(data);
    };

    store = (req, res) => {
        const { name } = req.body;
        const newStudent = { id: this.students.length + 1, name };
        this.students.push(newStudent);
        const data = {
            message: `Menambahkan data student ${name}`,
            data: newStudent,
        };
        res.json(data);
    };

    update = (req, res) => {
        const { id } = req.params;
        const { name } = req.body;
        const studentIndex = this.students.findIndex((student) => student.id == id);
        if (studentIndex !== -1) {
            this.students[studentIndex].name = name;
            const data = {
                message: `Mengupdate data student id ${id} dengan nama ${name}`,
                data: this.students[studentIndex],
            };
            res.json(data);
        } else {
            res.status(404).json({ message: "Student not found" });
        }
    };

    destroy = (req, res) => {
        const { id } = req.params;
        const studentIndex = this.students.findIndex((student) => student.id == id);
        if (studentIndex !== -1) {
            const deletedStudent = this.students.splice(studentIndex, 1)[0];
            const data = {
                message: `Menghapus data student id ${id}`,
                data: deletedStudent,
            };
            res.json(data);
        } else {
            res.status(404).json({ message: "Student not found" });
        }
    };
}

const studentController = new StudentController();
export default studentController;
