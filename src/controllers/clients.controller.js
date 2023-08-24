import { db } from "../database/database.connection.js";
import { createClientDB, getOrderByClientIdDB } from "../repositories/clients.repository.js";

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

export async function getClientOrders(req, res) {
    const clientId = req.params.id;
    try {
        const orders = await getOrderByClientIdDB(clientId);
        if (orders.length === 0) {
            return res.status(404).send('Orders not found for this client');
        }
        res.status(200).send(orders);
    } catch (err) {
        console.log(err);
        res.status(500).send(err.message);
    }
}
