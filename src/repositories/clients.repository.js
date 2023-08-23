import { db } from "../database/database.connection.js";

export function createClientDB(name, address, phone) {
    return db.query(
        `INSERT INTO clients (name, address, phone)
        VALUES ($1, $2, $3)`,
        [name, address, phone]
    )
}
