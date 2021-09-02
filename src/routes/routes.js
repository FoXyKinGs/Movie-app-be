const { login, register, movies, detailMovie, transactionMembership, membership, purchasedMovie, transactionMovie } = require('../controllers/controllers')
const { authentication } = require('../middleware/auth')
const express = require('express')

const Router = express.Router()

Router
  .get('/v1/movie/:id', detailMovie)
  .get('/v1/checkingMembership', membership)
  .get('/v1/movies', movies)
  .get('/v1/purchasedMovie', purchasedMovie)
  .post('/v1/login', login)
  .post('/v1/register', register)
  .post('/v1/membership', authentication, transactionMembership)
  .post('/v1/movie', authentication, transactionMovie)

module.exports = Router
