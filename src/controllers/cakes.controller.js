import { db } from "../database/database.connection";

export async function createCake() {
    try {
        console.log('oi');
    } catch (err) {
        console.log(err)
        res.status(500).send(err.message);
    }
}