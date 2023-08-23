import { db } from "../database/database.connection.js";
import { createClientDB } from "../repositories/clients.repository.js";

export async function createClient(req, res) {
    const { name, address, phone } = req.body;
    try {
        await createClientDB(name, address, phone);
        res.sendStatus(201);
    } catch (err) {
        console.log(err)
        res.status(500).send(err.message);
    }
}

export async function getClientOrderById(req, res) {
    try {
        console.log('oi');
    } catch (err) {
        console.log(err)
        res.status(500).send(err.message);
    }
}