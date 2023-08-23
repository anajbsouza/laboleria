import { db } from "../database/database.connection.js";
import { createOrderDB, getCakeById, getClientById } from "../repositories/orders.repository.js";

export async function createOrder(req, res) {
    const { clientId, cakeId, quantity, totalPrice } = req.body;
    try {
        const client = await getClientById(clientId);
        if (!client) return res.sendStatus(404);

        const cake = await getCakeById(cakeId);
        if (!cake) return res.sendStatus(404);

        await createOrderDB(clientId, cakeId, quantity, totalPrice, new Date());
        
        res.sendStatus(201);
    } catch (err) {
        console.log(err)
        res.status(500).send(err.message);
    }
}

export async function getOrders(req, res) {
    try {
        console.log('oi');
    } catch (err) {
        console.log(err)
        res.status(500).send(err.message);
    }
}

export async function getOrdersById() {
    try {
        console.log('oi');
    } catch (err) {
        console.log(err)
        res.status(500).send(err.message);
    }
}