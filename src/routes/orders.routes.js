import { Router } from "express";
import { createOrder, getOrders, getOrdersById } from "../controllers/orders.controller.js";

const orderRouter = Router();

orderRouter.post("/create-order", createOrder);
orderRouter.get("/get-order", getOrders);
orderRouter.get("/get-order-id", getOrdersById);

export default orderRouter;