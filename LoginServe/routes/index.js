var express = require('express');
var router = express.Router();
var db = require("../config/db");
const token = require('../config/jwt')
const schedule = require('node-schedule');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });  
});

//测试数据库
router.post('/getList', function (req, res, next) {
  db.query('select * from user', function (err, rows) {
    if (err) {
      res.send({
        success: 0,
        message: '数据库报错,' + err
      });
    } else {
      // console.log(rows)
      res.send({
        success: 1,
        data: rows,
        message: '查询test表成功'
      })
    }
  })
});

//账号密码登录判定
router.post('/login', function (req, res, next) {
  var data = {
    "username":req.body.username,
    "password":req.body.userPassword
  }
  var selectSQL = "select * from user where user_name = '"+req.body.username+"' and  user_password = '"+req.body.userPassword+"'";
  db.query(selectSQL, function (err, result) {
    if(err){
      console.log('[login ERROR] - ',err.message);
      return;
     }
     //console.log(result);
     if(result=='')
     {
         console.log("帐号密码错误");

         res.end("登陆失败");//如果登录失败就给客户端返回0，
     }
     else
     {
         console.log("OK",result);
         res.send({
          data: result,
        })
     }
  })
});

//前端发出请求，生成token
router.post('/token',function (req, res, next) {
  var data = Math.round(Math.random()*100000); 
  let authorization =  token.encrypt( {data:data }, 60 * 30)
  console.log('-------- authorization ----', authorization )
  let auth_data = {auth_token:authorization,auth_state:0,user_id:0};
  let SQL = "INSERT INTO auth SET ?"
  
  db.query(SQL,auth_data, function (err, rows) {
    if (err) {
      console.log('[login ERROR] - ',err.message);
      res.send({
        success: 0,
        message: '新增失败'
      });
    } else {
      res.send({
        message: '新增成功',
        data:authorization
      })
    }
  });
});

//查找token对应的状态码
router.post('/info',function (req, res, next) {
  let SQL = "select * from auth where auth_token = ?"
  //console.log(req.body.token)
  auth_data = req.body.token
  //auth_data = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJkYXRhIjozNzc4LCJpYXQiOjE2NDI1MDAxMTIsImV4cCI6MTY0MjUwMTkxMn0.SzZIQpnZPDy8x8ddfxCOsWS9KW4mitLdibYBRO8WEqI'
  db.query(SQL,auth_data, function (err, rows) {
    if (err) {
      console.log('[login ERROR] - ',err.message);
      res.send({
        message: '查询失败'
      });
    } else {
      res.send({
        message: 1,
        data:rows
      })
      console.log("成功的回调",rows)
    }
  });
});

//获取userID对应的信息
router.post('/getUser',function (req, res, next) {
  let SQL = "select * from user where user_id = ?"
  //console.log(req.body.token)
  user = req.body.userId
  db.query(SQL,user, function (err, rows) {
    if (err) {
      console.log('[login ERROR] - ',err.message);
      res.send({
        message: '查找失败'
      });
    } else {
      res.send({
        message: '查找成功',
        data:rows
      })
      console.log(rows)
    }
  });
});

//手机扫码
router.post('/PhoneScan',async function (req, res, next) {
  let SQL = "UPDATE auth SET auth_state = 2 where auth_token  = ?"
  //console.log(req.body.token)
  auth_data = req.body.token
  auth_id = req.body.userid
  await db.query(SQL,auth_data, function (err, rows) {
    if (err) {
      console.log('[login ERROR] - ',err.message);
      res.send({
        message: '查找失败'
      });
    } else {
      console.log("修改状态成功")
    }
  });

  let SQL1 = "UPDATE auth SET user_id = ? where auth_token  = ?"
  await db.query(SQL1,[auth_id,auth_data], function (err, rows) {
    if (err) {
      console.log('[login ERROR] - ',err.message);
    } else {
      data_success = rows
      res.send({
        message: '修改用户id成功',
        data:rows   
      })
      //console.log(rows)
    }
  });
});

//手机登录
router.post('/PhoneLogin', function (req, res, next) {
  let SQL = "UPDATE auth SET auth_state = 1 where auth_token  = ?"
  //console.log(req.body.token)
  auth_data = req.body.token
  db.query(SQL,auth_data, function (err, rows) {
    if (err) {
      console.log('[login ERROR] - ',err.message);
      res.send({
        message: '查找失败'
      });
    } else {
      res.send({
        message: '查找用户成功',
        data:rows
      })
    }
  });
});

//定义规则
let rule = new schedule.RecurrenceRule();
//每天零点执行
rule.hour =0;
rule.minute =0;
rule.second =0;


// 启动任务(需改进流程)
let job = schedule.scheduleJob(rule, () => {
  const time = new Date() 

  console.log(time)
  let SQL = " DELETE FROM auth WHERE auth_id >  0"
  db.query(SQL, function (err, rows) {
    if (err) {
      console.log('[login ERROR] - ',err.message);
    } else {
      console.log('删除成功');
    }
  });
});

module.exports = router;
