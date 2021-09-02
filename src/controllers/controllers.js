const { modelGetUser, 
        modelSetUser, 
        modelGetMovie,
        modelGetDetailMovie,
        modelSetTransactionMembership,
        modelGetOnlyActiveMembership,
        modelGetPurchasedMovie,
        modelSetTransactionMovie} 
= require('../models/models')
const { json } = require('body-parser')
const { response } = require('express')

module.exports = {
  detailMovie: (req, res) => {
    const param = req.params.id
    modelGetDetailMovie(param)
    .then((response) => {
      res.status(200).send(response)
    })
    .catch((err) => {
      res.status(500).send('Internal Server Error')
    })
  },
  login: (req, res) => {
    const body = req.body
    modelGetUser(body.username)
    .then((response) => {
      if(response.length === 1) {
        const data = JSON.parse(JSON.stringify(response))
        if (data[0].password !== body.password) {
          res.status(500).send({message: 'Wrong Password'})
        } else {
          res.status(200).send({
            id: data[0].id,
            username: data[0].username
          })
        }
      } else {
        res.status(500).send({message: 'Username not found'})
      }
    })
  },
  register: (req, res) => {
    const body = req.body
    modelGetUser(body.username)
    .then((response) => {
      if(response.length > 0){
        res.status(200).send({code: 500, message: 'Username Has Been Used'})
      } else {
        const result = {
          username: body.username,
          password: body.password
        }

        modelSetUser(result)
        .then((response) => {
          res.status(200).send({message: 'Registered'})
        })
        .catch((err) => {
          res.status(500).send({message: 'Internal Server Error'})
        })
      }
    })
    .catch((err) => {
      res.status(500).send({message: 'Internal Server Error'})
    })
  },
  movies: (req, res) => {
    modelGetMovie()
    .then((response) => {
      res.status(200).send({message: 'success', data: response})
    })
    .catch((err) => {
      res.status(500).send({message: 'Internal Server Error'})
    })
  },
  transactionMembership: (req, res) => {
    const body = req.body
    const result = {
      id_user: body.id_user,
      id_membership: body.id_membership
    }
    modelSetTransactionMembership(result)
    .then((response) => {
      res.status(200).send({message: 'success'})
    })
    .catch((err) => {
      res.status(500).send('Internal Server Error')
    })
  },
  membership: (req, res) => {
    const query = req.query
    modelGetOnlyActiveMembership(query)
    .then((response) => {
      res.send(response)
    })
    .catch((err) => {
      res.send('Internal Server Error')
    })
  },
  transactionMovie: (req, res) => {
    const body = req.body
    const result = {
      id_user: body.id_user,
      id_movie: body.id_movie
    }
    modelSetTransactionMovie(result)
    .then((response) => {
      res.status(200).send({message: 'success'})
    })
    .catch((err) => {
      res.status(500).send('Internal Server Error')
    })
  },
  purchasedMovie: (req, res) => {
    const query = req.query
    modelGetPurchasedMovie(query)
    .then((response) => {
      res.send(response)
    })
    .catch((err) => {
      res.send('Internal Server Error')
    })
  }
}
