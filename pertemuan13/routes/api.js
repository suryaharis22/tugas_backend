// routes/api.js

import { Router } from "express";
import studentController from "../controllers/StudentController.js";

const router = Router();

// Basic route for testing
router.get("/", (req, res) => {
    res.send("Hello Express");
});

// Routes for handling students
router.get("/students", studentController.index);
router.post("/students", studentController.store);
router.get("/students/specific", studentController.getSpecific);
router.get("/students/:id", studentController.getById);
router.put("/students/:id", studentController.update);
router.delete("/students/:id", studentController.destroy);

export default router;
