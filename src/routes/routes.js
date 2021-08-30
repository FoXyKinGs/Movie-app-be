const { login, register } = require('../controllers/controllers')
const express = require('express')

const Router = express.Router()

Router
  .post('/v1/login', login)
  .post('/v1/register', register)

module.exports = Router
