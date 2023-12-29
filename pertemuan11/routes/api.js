// routes/api.js

import { Router } from "express";
import studentController from "../controllers/StudentController.js";

const router = Router();

router.get("/", (req, res) => {
    res.send("Hello Express");
});

router.get("/students", studentController.index);
router.post("/students", studentController.store);
router.put("/students/:id", studentController.update);
router.delete("/students/:id", studentController.destroy);

export default router;
