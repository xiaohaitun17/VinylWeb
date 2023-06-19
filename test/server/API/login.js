let db = require('../db/index')

//login
exports.login = (req, res) => {
  var sql = 'select * from user where name = ? and password = ?'
  db.query(sql, [req.query.username, req.query.password], (err, data) => {
    if (err) {
      return res.send({
        status: 400,
        message: "Login failed"
      })
    }

    if (data.length > 0) {
      res.send({
        status: 200,
        message: "Login successful",
        data: data
      })
    } else {
      res.send({
        status: 202,
        message: 'User name or password error'
      })
    }
  })
}

//register
exports.register = (req, res) => {
  const sql1 = 'select * from user where name = ?'
  const sql2 = 'insert into user (name, password, email, birthday) value (?, ?, ?, ?)'
  db.query(sql1, [req.body.username], (err, data) => {
    if (err) {
      return res.send({
        status: 400,
        message: "Operation failed"
      })
    }
    if (data.length > 0) {  //check if user name alrady exists
      return res.send({
        status: 202,
        message: 'Username already exists'
      })
    } else {
      db.query(sql2, [req.body.username, req.body.password, req.body.email, req.body.birthday], (err, data) => {
        if (err) {
          return res.send({
            status: 400,
            message: "Registration failed",
            err
          })
        }
        if (data.affectedRows > 0) {
          res.send({
            status: 200,
            message: 'success'
          })
        } else {
          res.send({
            status: 202,
            message: 'error'
          })
        }
      })
    }
  })
}

