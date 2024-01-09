const bcrypt = require('bcrypt');
let tokens = 'serect_123';

module.exports = async function (req, res, next){
    const cookie = req.headers.cookie
    let arrCookie = cookie?.split('; ');
    let data = arrCookie?.find(el=>el.startsWith('token='));
    let token = data?.slice(data?.indexOf("=")+1);
    let name =  arrCookie?.find(el=>el.startsWith('name='));
    if(!token ){
        res.redirect("dang-nhap");
        return;
    }
    if(name){
        req.flash("name", name.slice(name.indexOf("=")+1))
    }
    next()
}