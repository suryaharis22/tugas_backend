// controllers/AuthController.js

import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import User from "../models/User.js";

class AuthController {
    async registrasi(req, res) {
        try {
            const { username, email, password } = req.body;

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
            return res.json(ressponse);

        } catch (error) {
            console.log(error);
            res.status(500).json({ message: "Internal server error" });
        }
    }
    async login(req, res) {
        try {
            const { email, password } = req.body;
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
            return res.status(200).json(response);
        } catch (error) {
            console.log(error);
            res.status(401).json({ message: "Unauthorized" });
        }
    }
}

const Auth = new AuthController();
export default Auth;