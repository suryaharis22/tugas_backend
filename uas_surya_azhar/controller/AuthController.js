// controllers/AuthController.js

import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import User from "../model/User.js";

class AuthController {
    async registrasi(req, res) {
        try {
            const { username, email, password } = req.body;
            // Simple validation
            const requiredFields = ['username', 'email', 'password'];
            const missingFields = [];

            requiredFields.forEach(field => {
                if (!req.body[field]) {
                    missingFields.push(field);
                }
            });

            if (missingFields.length > 0) {
                return res.status(422).json({
                    message: "Validation Error",
                    errors: `Missing required fields: ${missingFields.join(', ')}`
                });
            }

            const hash = await bcrypt.hash(password, 10);

            const newUser = await User.create({
                username: username,
                email: email,
                password: hash,
            });
            const ressponse = {
                massage: "Registrasi Berhasil",
                data: newUser,
            }
            res.status(201).json(ressponse);

        } catch (error) {
            console.log(error);
            res.status(500).json({ message: "Internal server error" });
        }
    }
    async login(req, res) {
        try {
            const { email, password } = req.body;
            // Simple validation
            const requiredFields = ['email', 'password'];
            const missingFields = [];

            requiredFields.forEach(field => {
                if (!req.body[field]) {
                    missingFields.push(field);
                }
            });

            if (missingFields.length > 0) {
                return res.status(422).json({
                    message: "Validation Error",
                    errors: `Missing required fields: ${missingFields.join(', ')}`
                });
            }

            const user = await User.findOne({
                where: {
                    email: email
                }
            })

            const isPasswordValid = await bcrypt.compare(password, user.password);
            if (!user || !isPasswordValid) {
                const response = {
                    message: "Invalid email or password",
                    data: null
                }
            }
            const pyload = {
                id: user.id,
                username: user.username,
            };
            const secret = process.env.SECRET_TOKEN;
            const token = jwt.sign(pyload, secret, { expiresIn: '1h' });
            const response = {
                message: "Login Berhasil",
                data: {
                    username: user.username,
                    email: user.email,
                    token: token
                }
            };
            return res.status(201).json(response);

        } catch (error) {
            console.log(error);
            res.status(401).json({ message: "Unauthorized" });
        }
    }
}

const Auth = new AuthController();
export default Auth;