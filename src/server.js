const express = require('express');
const app=express();
const path = require('path');
const morgan = require('morgan');
const bodyParser = require('body-parser');
const mysql = require('mysql');
var myConnection = require('express-myconnection');
app.use(myConnection(mysql,{

      'host':'localhost',
      'user':'root',
      'password':'12345',
      'database':'parques'
    },'request')
);//route index, hello world
// var db=mysql.createConnection({
//   'host':'localhost',
//   'user':'root',
//   'password':'12345',
//   'database':'prueba'
// })
// db.connect((error)=>{
//   if(error) throw error;
//   console.log('Coneccion establecida');
// })
app.set('json spaces', 4);
app.use(morgan('dev'));
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());  //"use" nos permite ejercutar middleware

const rutas= require('./routes/rutas');

// app.get('/', (req,res)=>{
//
//   res.render('index');
// });
//
//
// app.post('/Insertar', (req,res)=>{
//   const datos=req.body;
//   var Insertar=db.query('Insert into historias_clinicas set ?',[datos],(error, data)=>{
//     if(error) throw error;
//     console.log(data);
//     res.send(data)
//   });
// });
app.use('/',rutas)

app.listen('2000',()=>{
  console.log('Aplicacion iniciada en el puerto 2000');
})
