var mysql = require("mysql");
var pool = mysql.createPool({
    host:"127.0.0.1",
    user:"root",
    password:"root",
    database:"login"
});

function query(sql,value = false,callback){
    pool.getConnection(function(err,connection){
        connection.query(sql,value,function (err,rows) {
            callback(err,rows);
            // console.log(rows)
            connection.release();
        });
    }); 
}

exports.query = query;