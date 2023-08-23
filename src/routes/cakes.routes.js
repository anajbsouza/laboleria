import { Router } from "express";
import { createCake } from "../controllers/cakes.controller.js";
import { validateSchema } from "../middlewares/validateSchema.js";
import cakeSchema from "../schemas/cakes.schema.js";

const cakeRouter = Router();

cakeRouter.post("/cakes", validateSchema(cakeSchema), createCake);

export default cakeRouter;