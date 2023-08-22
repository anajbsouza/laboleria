import joi, { string } from "joi";

const clientSchema = ({
    name: joi.string().required(),
    address: string().required(),
    phone: joi.string().trim().length(11).pattern(/^\d+$/).required(),
});

export default clientSchema;