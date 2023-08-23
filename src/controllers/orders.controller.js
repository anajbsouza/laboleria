import { db } from "../database/database.connection.js";

export async function createOrder() {
    try {
        console.log('oi');
    } catch (err) {
        console.log(err)
        res.status(500).send(err.message);
    }
}

export async function getOrders() {
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