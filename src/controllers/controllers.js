const { modelGetUser, modelSetUser } = require('../models/models')
const { json } = require('body-parser')
const { response } = require('express')

module.exports = {
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
        res.status(200).send({message: 'Username not found'})
      }
    })
  },
  register: (req, res) => {
    const body = req.body
    modelGetUser(body.username)
    .then((response) => {
      if(response.length > 0){
        res.status(500).send({message: 'Username Has Been Used'})
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
  }
}
