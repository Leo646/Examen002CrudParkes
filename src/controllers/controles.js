
const controller={
listar:(req,res)=>{
  req.getConnection((error,conexion)=>{
    conexion.query('select * from equipamiento',(error, datos)=>{
      if(error){
      res.json(error);
    }
    console.log('dato mostrados');
      res.render('index',{
        data:datos
      });
    });
  });

},
insertar:(req, res)=>{
  req.getConnection((error, conectar)=>{
    const datos=req.body;
    conectar.query('Insert into equipamiento set ?',[datos],(error, data)=>{
      if(error) throw error;
      res.redirect('/')
    })
  });

},
borrar:(req,res)=>{
  req.getConnection((error, conexion)=>{
    const id=req.params.id;
    conexion.query('delete from equipamiento where id=?',[id],(error, rows)=>{
      res.redirect('/');
    })
  })

},
editar:(req,res)=>{
  req.getConnection((error, con)=>{
    const id=req.params.id;
    con.query('select * from equipamiento  where id=?',[id],(error, datos)=>{
      console.log(datos);
      res.render('editar',{
        data: datos[0]
      })
    })
  })

},
actualizar:(req,res)=>{
  const id=req.params.id;
  console.log(id);
  const nuevo=req.body;
  console.log(nuevo);
  req.getConnection((error, db)=>{
    db.query('UPDATE equipamiento set ? where id=?', [nuevo, id], (error, rows)=>{
      console.log(rows);
      res.redirect('/')
    })
  })

}

}
module.exports=controller;
