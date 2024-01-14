// routes/api.js

import { Router } from "express";
import studentController from "../controllers/StudentController.js";
import Auth from "../controllers/AuthController.js";
import auth from "../middleware/auth.js"; // Make sure to import the auth middleware

const router = Router();

// Basic route for testing
router.get("/", (req, res) => {
    res.send("Hello Express");
});

// Routes for handling authentication
router.post("/registrasi", Auth.registrasi);
router.post("/login", Auth.login);

// Routes for handling students 
router.get("/students", auth, studentController.index);
router.post("/students", auth, studentController.store);
router.get("/students/specific", auth, studentController.getSpecific);
router.get("/students?nama=:nama", auth, studentController.getByName);
router.get("/students?jurusan=:jurusan", auth, studentController.getByJurusan);
router.get("/students/:id", auth, studentController.getById);
router.put("/students/:id", auth, auth, studentController.update);
router.delete("/students/:id", auth, studentController.destroy);

export default router;
