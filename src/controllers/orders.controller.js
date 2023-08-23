import { db } from "../database/database.connection.js";
import { createOrderDB, getCakeById, getClientById, getOrdersDB } from "../repositories/orders.repository.js";

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
        const date = req.query.date;
        const orders = await getOrdersDB(date);
        
        if (orders.length === 0) {
            return res.status(404).json([]);
        }

        const formattedOrders = orders.map(order => ({
            client: {
                id: order.clientId,
                name: order.clientName,
                address: order.clientAddress,
                phone: order.clientPhone,
            },
            cake: {
                id: order.cakeId,
                name: order.cakeName,
                price: parseFloat(order.cakePrice),
                description: order.cakeDescription,
                image: order.cakeImage,
            },
            orderId: order.orderId,
            createdAt: order.createdAt,
            quantity: order.quantity,
            totalPrice: parseFloat(order.totalPrice),
        }));

        res.status(200).json(formattedOrders);
    } catch (err) {
        console.log(err);
        res.status(500).send(err.message);
    }
}


export async function getOrdersById(req, res) {
    try {
        console.log('oi');
    } catch (err) {
        console.log(err)
        res.status(500).send(err.message);
    }
}