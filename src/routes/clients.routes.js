import { Router } from "express";
import { createClient, getClientOrderById } from "../controllers/clients.controller";

const clientRouter = Router();

clientRouter.post("/create-client", createClient);
clientRouter.get("/get-client", getClientOrderById);

export default clientRouter;