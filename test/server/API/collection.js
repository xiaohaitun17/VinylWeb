let db = require('../db/index')

//search
exports.search = (req, res) => {
  var sql = 'select * from album where name like ?'
  db.query(sql, [req.query.search, req.query.search, req.query.search], (err, data) => {
      if(err) {
          return res.send('error:' + err.message)
      }
      res.send(data)
  })
}

//get all albums from the database
exports.all_album = (req, res) => {
  var sql = 'select * from album'
  db.query(sql, (err, data) => {
      if(err) {
          return res.send('error:' + err.message)
      }
      res.send(data)
  })
}

//get all songs
exports.all_vinyl = (req, res) => {
  var sql = 'SELECT a.name as vinyl_name, b.name as album_name,  b.album_id, b.artist, b.recordCompany FROM vinly as a join album as b on a.album_id = b.album_id'
  db.query(sql, (err, data) => {
      if(err) {
          return res.send('error:' + err.message)
      }
      res.send(data)
  })
}

//get tracklist of album
exports.song_list = (req, res) => {
  var sql = 'select * from vinly where album_id = ?'
  db.query(sql, [req.query.id], (err, data) => {
      if(err) {
          return res.send('error:' + err.message)
      }
      res.send(data)
  })
}

//get album info according to album_id
exports.album_info = (req, res) => {
  var sql = 'select * from album where album_id = ?'
  db.query(sql, [req.query.id], (err, data) => {
      if(err) {
          return res.send('error:' + err.message)
      }
      res.send(data)
  })
}

//add collection
exports.add_collect = (req, res) => {
  var sql =
    "insert into collection (user_id, album_id) values (?,? )";
  db.query(
    sql,
    [ req.body.user_id, req.body.album_id],
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

//get user's collection list
exports.get_collect = (req, res) => {
  var sql = 'select * from album where album_id in (select album_id from collection where user_id = ?)'
  db.query(sql, [req.query.user_id], (err, data) => {
      if(err) {
          return res.send('error:' + err.message)
      }
      res.send(data)
  })
}

//delet collection
exports.del_collect = (req, res) => {
  var sql = 'delete from collection where album_id = ? and user_id = ?'
  db.query(sql, [req.body.album_id, req.body.user_id], (err, data) => {
      if(err) {
          return res.send('error:' + err.message)
      }
      if(data.affectedRows > 0) {
        res.send({
          state: 200,
          message: 'success'
        })
      }else{
        res.send({
          state: 202,
          message: 'Delete failed'
        })
      }
      
  })
}

//check if the user has liked the album
exports.judge_like = (req, res) => {
  var sql = 'select * from collection where album_id = ? and user_id = ?'
  db.query(sql, [req.query.album_id, req.query.user_id], (err, data) => {
      if(err) {
          return res.send('error:' + err.message)
      }
      if(data.length > 0) {
        res.send({
          state: 200,
          message: 'Collected',
          result: true
        })
      }else {
        res.send({
          state: 200,
          message: 'Not collected',
          result: false
        })
      }
  })
}

//Album Genre Filter
exports.genre_class = (req, res) => {
  var sql = 'select * from album where genre = ?'
  db.query(sql, [req.query.genre], (err, data) => {
      if(err) {
          return res.send('error:' + err.message)
      }
      res.send(data)
  })
}