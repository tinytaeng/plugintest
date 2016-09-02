util = require 'util'
express = require 'express'
app = express()
bodyParser = require 'body-parser'
fs = require 'fs'
PORT = 80

app.use bodyParser.json()
app.use bodyParser.urlencoded { extended: true }

app.post '/', (req,res) ->
    console.log 'root'
    res.send {success:true}

app.post '/Plugin.Activate', (req,res) ->
    console.log req
    res.send
        Implements: ["authz"]

app.post '/AuthZPlugin.AuthZReq', (req,res) ->
    data = util.inspect req, false, null
    fs.writeFile '/src/AuthZPlugin.AuthZReq', data, ->
        console.log req.data
        res.send
            Allow: false
            Msg: "blah"
            Err: "err"

app.listen PORT, ->
    console.log "server listening on #{PORT}"

process.on 'SIGTERM', () -> process.exit 0
process.on 'SIGINT', () -> process.exit 0
