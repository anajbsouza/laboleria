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


export async function getOrdersDB(date) {
    const dateFilter = date ? `WHERE o."createdAt"::DATE = $1` : "";
    const values = date ? [date] : [];
    
    const result = await db.query(`
        SELECT
            c.id AS "clientId",
            c.name AS "clientName",
            c.address AS "clientAddress",
            c.phone AS "clientPhone",
            k.id AS "cakeId",
            k.name AS "cakeName",
            k.price AS "cakePrice",
            k.description AS "cakeDescription",
            k.image AS "cakeImage",
            o.id AS "orderId",
            o.createdat AS "createdAt",
            o.quantity,
            o.totalprice AS "totalPrice"
        FROM orders o
        JOIN clients c ON o.clientid = c.id
        JOIN cakes k ON o.cakeid = k.id
        ${dateFilter}
    `, values);

    return result.rows;
}
