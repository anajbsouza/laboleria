import { Router } from "express";
import clientRouter from "./clients.routes.js";
import orderRouter from "./orders.routes.js";
import cakeRouter from "./cakes.routes.js";

const router = Router();

router.use(cakeRouter);
router.use(clientRouter);
router.use(orderRouter);

export default router;