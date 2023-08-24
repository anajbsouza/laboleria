import { db } from "../database/database.connection.js";
import { createCakeDB, getCakeByName } from "../repositories/cakes.repository.js";

export async function createCake(req, res) {
    const { name, price, image, description } = req.body;
    try {
        const cakeName = await getCakeByName(name);
        if (cakeName) return res.status(409).send({ message: "Bolo já existe!" });

        await createCakeDB(name, price, image, description);
        res.sendStatus(201);

    } catch (err) {
        console.log(err)
        res.status(500).send(err.message);
    }
}
