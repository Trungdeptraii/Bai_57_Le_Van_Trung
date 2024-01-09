const model = require('../models/index.js');
const customer = model.Customer;
const { Op } = require("sequelize");
const bcrypt = require('bcrypt');

const Service = {
    checkLogin: async ({email, password}, type='login')=>{
        let filter = {
            where: {
                email: {
                    [Op.eq]: email
                }
            }
        };
        try {
            let user =  await customer.findAll(filter);
            if(type == 'login'){
                if(!user.length){
                    return false;
                }
                const checkpass = await bcrypt.compare(password, user[0].password);
                return checkpass ? user[0] : false;
            }else if(type == 'register'){
                if(!user.length){
                    return true
                }else{
                    return false;
                }
            }
        } catch (error) {
            return false
        }
    },
    createUser: async ({email, password})=>{
        password = await bcrypt.hashSync(password, 10);
        if(!await model.Customer.create({email, password})){
            return false
        }
        return true
        
    }
}

module.exports = Service