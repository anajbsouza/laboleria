import { Router } from "express";
import { createClient, getClientOrderById } from "../controllers/clients.controller.js";
import { validateSchema } from "../middlewares/validateSchema.js";
import clientSchema from "../schemas/clients.schema.js";

const clientRouter = Router();

clientRouter.post("/clients", validateSchema(clientSchema), createClient);
clientRouter.get("/clients/:id/orders", getClientOrderById);

export default clientRouter;