const express = require('express');
const server = express();
const port=3000;
const cors=require('cors');
const { response } = require('express');

const cors_option={origin:"https://localhost:4200",optionSuccessStatus:200};
server.use(express.json());
server.use(express.urlencoded({extended:true}));
server.use(cors(cors_option));
const USERS = [
    {id:1,userName:"Cletus"},
    {id:2,userName:"shweta"},
    {id:3,userName:"sachin"}
]
server.get('/',(res,resp)=>{
    resp.send("express working");
})

server.get('/users',(req,resp)=>{
    resp.setHeader("Content-Type","application/json");
    resp.send(USERS);
})
server.listen(port,()=>{
    console.log("http://localhost:3000");
})