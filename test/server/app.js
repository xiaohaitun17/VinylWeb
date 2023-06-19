let express = require('express')
let app = express()
let cors = require('cors')
let bodyParser = require('body-parser')
let router = require('./router')

app.use(bodyParser.json());  //parsing data in json and urlencoded formats
app.use(bodyParser.urlencoded({extended: false}));
app.use(cors())              //Configuring cross-domains
app.use(router)              //Configuring Routing

app.listen(80, () => {
    console.log('Server started successfully');
})