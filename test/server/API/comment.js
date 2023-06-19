let db = require("../db/index");

//add comments
exports.add_comment = (req, res) => {
  var sql =
    "insert into comment (content, user_name, time, album_id) values (?, ?, ? ,? )";
  db.query(
    sql,
    [req.body.content, req.body.user_name, req.body.time, req.body.album_id],
    (err, data) => {
      if (err) {
        return res.send("error:" + err.message);
      }
      if (data.affectedRows > 0) {
        res.send({
          status: 200,
          message: "success",
        });
      } else {
        res.send({
          status: 202,
          message: "error",
        });
      }
    }
  );
};

//get comments
exports.get_comment = (req, res) => {
    var sql = 'select * from comment where album_id = ?'
    db.query(sql, [req.query.id], (err, data) => {
        if(err) {
            return res.send('error:' + err.message)
        }
        res.send(data)
    })
  }
