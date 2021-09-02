const { login, register, movies, detailMovie, transactionMembership, membership } = require('../controllers/controllers')
const { authentication } = require('../middleware/auth')
const express = require('express')

const Router = express.Router()

Router
  .get('/v1/movie/:id', detailMovie)
  .get('/v1/checkingMembership', membership)
  .get('/v1/movies', movies)
  .post('/v1/login', login)
  .post('/v1/register', register)
  .post('/v1/membership', authentication, transactionMembership)

module.exports = Router
