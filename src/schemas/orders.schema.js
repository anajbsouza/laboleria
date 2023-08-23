import joi, { string } from "joi";

const orderSchema = joi.object({
    clientId: joi.number().required(),
    cakeId: joi.number().required(),
    quantity: joi.number().required(),
    //createdAt
    totalPrice: joi.number().required()
});

export default orderSchema;