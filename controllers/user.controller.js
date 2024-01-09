const model = require('../models/index.js');
const {object, string} = require("yup");
const Service = require('../services/user.service.js');
const bcrypt = require('bcrypt');
let token = 'serect_123';

const Controller  = {
    index: async (req, res)=>{
        let name = req.flash("name")
        res.render("users/index", {name: name? name: ''});
    },
    login: (req, res)=>{
        let msg = req.flash("msg");
        res.render("users/login", {req, msg: msg? msg: []});
    },
    register: async (req, res)=>{
        let msg = req.flash("msg")
        res.render("users/register", {req, msg: msg? msg: []})
    },
    handleRegister:async (req, res)=>{
        const schema = object({
            email: string().required("Vui lòng nhập email").email("Không đúng định dạng email"),
            password: string().required("Vui lòng nhập password")
        })
        try {
            const user = await schema.validate(req.body, {abortEarly: false});
            if(!await Service.checkLogin(user, 'register')){
                req.flash('msg', 'Email đã đăng ký tài khoản');
                req.flash("dataOld", req.body)
                return res.redirect('/dang-ky');
            }
            if(!await Service.createUser(user)){
                req.flash('msg', 'Đăng ký tài khoản thất bại');
                return res.redirect('/dang-ky');

            }
            req.flash('msg', 'Đăng ký tài khoản thành công');
            return res.redirect('/dang-ky');
        } catch (e) {
            const errors = Object.fromEntries(
                e.inner.map((item)=>[
                    item.path, item.message
                ])
            );
            req.flash('errors', errors);
            req.flash('msg', 'Vui lòng điền đầy đủ thông tin');
            res.redirect('/dang-ky')
        }
    },
    handleLogin: async(req, res)=>{
        const {email, password} = req.body
        const schema = object({
            email: string().required("Vui lòng nhập email").email("Không đúng định dạng email"),
            password: string().required("Vui lòng nhập password")
        })
        try {
            await schema.validate({email, password}, {abortEarly: false});
            let user = await Service.checkLogin(req.body, 'login');
            if(!user){
                req.flash('msg', 'Email hoặc mật khẩu chưa chính xác');
                return res.redirect('/dang-nhap');
            }
            if(!user.status){
                req.flash('msg', 'Đăng nhập bị từ chối !!!');
                req.flash("dataOld", req.body)
                return res.redirect('/dang-nhap');
            }
            const name = email.slice(0, email.indexOf('@'));
            res.cookie('name', name);
            res.cookie('token', bcrypt.hashSync(token, 5))
            res.redirect('/')
        } catch (e) {
            const errors = Object.fromEntries(
                e.inner.map((item)=>[
                    item.path, item.message
                ])
            );
            req.flash('errors', errors);
            req.flash("dataOld", req.body)
            req.flash('msg', 'Vui lòng điền đầy đủ thông tin');
            res.redirect('/dang-nhap')
        }
        
    },
    handleLogout: (req, res)=>{
        res.clearCookie('token');
        res.clearCookie('name');
        res.redirect("dang-nhap")
    }
}
module.exports =  Controller