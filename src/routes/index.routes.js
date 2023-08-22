import { Router } from "express";
import clientRouter from "./clients.routes";
import orderRouter from "./orders.routes";
import cakeRouter from "./orders.routes";

const router = Router();

router.use(cakeRouter);
router.use(clientRouter);
router.use(orderRouter);

export default router;