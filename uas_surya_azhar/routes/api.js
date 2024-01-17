// routes/api.js

import { Router } from "express";
import patientsController from "../controller/PatientsController.js";
import Auth from "../controller/AuthController.js";
import auth from "../middleware/auth.js";

const router = Router();

// Basic route for testing
router.get("/", (req, res) => {
    res.send("Hello Express");
});

// Routes for handling authentication
router.post("/registrasi", Auth.registrasi);
router.post("/login", Auth.login);

// Routes for handling students
router.get("/patients", auth, patientsController.index);
router.post("/patients", auth, patientsController.store);
router.get("/patients/specific", auth, patientsController.getSpecific);
router.get("/patients/:id", auth, patientsController.getById);
router.put("/patients/:id", auth, patientsController.update);
router.delete("/patients/:id", auth, patientsController.destroy);

export default router;