import joi from "joi";

const clientSchema = joi.object({
    name: joi.string().required(),
    address: joi.string().required(),
    phone: joi.string().trim().length(11).pattern(/^\d+$/).required(),
});

export default clientSchema;