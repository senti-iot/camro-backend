#!/usr/bin/env nodejs
process.title = "camro_backend"
const dotenv = require('dotenv').config()
if (dotenv.error) {
	console.warn(dotenv.error)
}
const express = require('express')
const cors = require('cors')
const helmet = require('helmet')
const app = express()

// API endpoint imports

const port = process.env.NODE_PORT || 3036

app.use(helmet())
app.use(express.json())
app.use(express.urlencoded({ extended: true }))

app.use(cors())


//---Start the express server---------------------------------------------------

const startServer = () => {
	app.listen(port, () => {
		console.log('camro backend started on port', port)
	}).on('error', (err) => {
		if (err.errno === 'EADDRINUSE') {
			console.log('camro backend not started, port ' + port + ' is busy')
		} else {
			console.log(err)
		}
	})
}

startServer()
