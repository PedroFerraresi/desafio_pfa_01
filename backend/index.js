const http = require('http');
const mysql = require('mysql');

const pool = mysql.createPool({
  host: 'database',
  user: 'root',
  password: 'root',
  database: 'desafio_01_fc'
});


let reo ='<!DOCTYPE html><html lang="pt"><head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><title>Desafio PFA - 01</title></head><body><h1>Desafio PFA!</h1>{${table}}</body></html>';


function setResHtml(sql, cb){
  pool.getConnection((err, con)=>{
    if(err) throw err;

    con.query(sql, (err, res)=>{
      if(err) throw err;

      let table =''; 

      for(let i=0; i<res.length; i++){
        table +='<tr><td>'+ (i+1) +'</td><td>'+ res[i].name +'</td></tr>';
      }
      table ='<table border="1"><tr><th>Nr.</th><th>Name</th></tr>'+ table +'</table>';

      con.release();

      return cb(table);
    });
  });
}

let sql ='SELECT name FROM modulos';


const server = http.createServer((req, res)=>{
  setResHtml(sql, resql=>{
    reo = reo.replace('{${table}}', resql);
    res.writeHead(200, {'Content-Type':'text/html; charset=utf-8'});
    res.write(reo, 'utf-8');
    res.end();
  });
});

server.listen(3000, ()=>{
  console.log('Server running at //localhost:3000/');
});