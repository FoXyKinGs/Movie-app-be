const { login, register, movies } = require('../controllers/controllers')
const express = require('express')

const Router = express.Router()

Router
  .get('/v1/movies', movies)
  .post('/v1/login', login)
  .post('/v1/register', register)

module.exports = Router
