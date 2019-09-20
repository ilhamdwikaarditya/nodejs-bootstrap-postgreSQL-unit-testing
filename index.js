const path = require('path');
const express = require('express');
const hbs = require('hbs');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const pgp = require('pg');
const util = require('util');
const app = express();

//Create Connection
const conn = mysql.createConnection({
  host: 'localhost',
  user: 'admin_ap2epi',
  password: 'ap2epi_2018',
  database: 'crudnodejsmysql',
  port : 3310
});

const connpg = new pgp.Client({
  host: 'localhost',
  user: 'postgres',
  password: 'root',
  database: 'crudnodejs',
  port: 5432
});

//connect to database
conn.connect((err) => {
    if (err) throw console.log(util.inspect(err, false, null, true /* enable colors */))
    console.log('Mysql Connected...');
});

connpg.connect((err) => {
    if (err) throw console.log(util.inspect(err, false, null, true /* enable colors */))
    console.log('postgre Connected...');
});

//set views file
app.set('views', path.join(__dirname, 'views'));
//set view engine
app.set('view engine', 'hbs');
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));
//set folder public as static folder for static file
app.use('/assets', express.static(__dirname + '/public'));

//route for homepage
app.get('/', (req, res) => {
    let sql = "SELECT a.*,b.nama_resep FROM bahan_makanan a join resep_makanan b on a.id_resep = b.id_resep order by id_bahan asc";
    let query = connpg.query(sql, (err, results) => {
        if (err) throw console.log(util.inspect(sql, false, null, true /* enable colors */))
        res.render('bahan_view', {
            results: results.rows
        });	
    });
	
});

//route for insert data
app.post('/save', (req, res) => {
    let sql = "INSERT INTO bahan_makanan (nama_bahan,jumlah,satuan,id_resep) values('" + req.body.nama_bahan + "', '" + req.body.jumlah + "','" + req.body.satuan + "','" + req.body.id_resep + "')";
    let query = connpg.query(sql, (err, results) => {
        if (err) throw console.log(util.inspect(sql, false, null, true /* enable colors */))
        res.redirect('/');
    });
});

//route for update data
app.post('/update', (req, res) => {
    let sql = "UPDATE bahan_makanan SET nama_bahan='" + req.body.nama_bahan + "', jumlah='" + req.body.jumlah + "', satuan='" + req.body.satuan + "'  WHERE id_bahan=" + req.body.id_bahan + "";
    let query = connpg.query(sql, (err, results) => {
		if (err) throw console.log(util.inspect(sql, false, null, true /* enable colors */))
        res.redirect('/');
    });
});

//route for delete data
app.post('/delete', (req, res) => {
    let sql = "DELETE FROM bahan_makanan WHERE id_bahan=" + req.body.id_bahan + "";
    let query = connpg.query(sql, (err, results) => {
        if (err) throw console.log(util.inspect(sql, false, null, true /* enable colors */))
        res.redirect('/');
    });
});


//route for kategori
app.get('/kategori', (req, res) => {
    let sql = "SELECT a.*,b.nama_resep FROM kategori_makanan a join resep_makanan b on a.id_resep = b.id_resep order by id_kategori asc";
    let query = connpg.query(sql, (err, results) => {
        if (err) throw console.log(util.inspect(sql, false, null, true /* enable colors */))
        res.render('kategori_view', {
            results: results.rows
        });	
    });
	
});

//route for insert data kategori
app.post('/savekategori', (req, res) => {
    let sql = "INSERT INTO kategori_makanan (nama_kategori,id_resep) values('" + req.body.nama_kategori + "','" + req.body.id_resep + "')";
    let query = connpg.query(sql, (err, results) => {
        if (err) throw console.log(util.inspect(sql, false, null, true /* enable colors */))
        res.redirect('/kategori');
    });
});

//route for update data kategori
app.post('/updatekategori', (req, res) => {
    let sql = "UPDATE kategori_makanan SET nama_kategori='" + req.body.nama_kategori + "'  WHERE id_kategori=" + req.body.id_kategori + "";
    let query = connpg.query(sql, (err, results) => {
		if (err) throw console.log(util.inspect(sql, false, null, true /* enable colors */))
        res.redirect('/kategori');
    });
});

//route for delete data kategori
app.post('/deletekategori', (req, res) => {
    let sql = "DELETE FROM kategori_makanan WHERE id_kategori=" + req.body.id_kategori + "";
    let query = connpg.query(sql, (err, results) => {
        if (err) throw console.log(util.inspect(sql, false, null, true /* enable colors */))
        res.redirect('/kategori');
    });
});

app.get('/api/kategori',(req, res) => {
  let sql = "SELECT * FROM product";
  let query = conn.query(sql, (err, results) => {
    if(err) throw err;
    res.send(JSON.stringify({"status": 200, "error": null, "response": results}));
  });
});


//server listening
app.listen(8000, () => {
    console.log('Server is running at port 8000');
});
