let express = require('express')
let router = express.Router()
let login = require('./API/login')
let collection = require('./API/collection')
let comment = require('./API/comment')

router.get('/login', login.login)
router.post('/register', login.register)

router.get('/all_album', collection.all_album)
router.get('/all_song', collection.all_vinyl)
router.get('/song_list', collection.song_list)
router.get('/album_info', collection.album_info)
router.get('/search', collection.search)
router.get('/genre_class', collection.genre_class)

router.post('/add_collect', collection.add_collect)
router.post('/del_collect', collection.del_collect)
router.get('/get_collect', collection.get_collect)
router.get('/judge_like', collection.judge_like)


router.post('/add_comment', comment.add_comment)
router.get('/get_comment', comment.get_comment)

module.exports = router