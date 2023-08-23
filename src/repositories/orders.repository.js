import { db } from "../database/database.connection.js";

export function createOrderDB(clientId, cakeId, quantity, totalPrice) {
    const createdAt = new Date();
    return db.query(
        `INSERT INTO orders (clientId, cakeId, quantity, totalPrice, createdAt)
        VALUES ($1, $2, $3, $4, $5)`,
        [clientId, cakeId, quantity, totalPrice, createdAt]
    );
}


export async function getClientById(clientId) {
    const result = await db.query(`SELECT id FROM clients WHERE id=$1;`, [clientId]);
    if (result.rows && result.rows.length > 0) {
        return result.rows[0];
    } else {
        return null;
    }
}

export async function getCakeById(cakeId) {
    const result = await db.query(`SELECT id FROM cakes WHERE id=$1;`, [cakeId]);
    if (result.rows && result.rows.length > 0) {
        return result.rows[0];
    } else {
        return null;
    }
}

