import { Router } from "express";
import { createClient, getClientOrderById } from "../controllers/clients.controller.js";
import { validateSchema } from "../middlewares/validateSchema.js";
import clientSchema from "../schemas/clients.schema.js";

const clientRouter = Router();

clientRouter.post("/client", validateSchema(clientSchema), createClient);
clientRouter.get("/get-client", getClientOrderById);

export default clientRouter;