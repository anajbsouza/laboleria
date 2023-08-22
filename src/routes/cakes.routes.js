import { Router } from "express";
import { createCake } from "../controllers/cakes.controller";

const cakeRouter = Router();

cakeRouter.post("/cakes", createCake);

export default cakeRouter;