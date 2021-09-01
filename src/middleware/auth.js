const { modelGetUser } = require('../models/models')

module.exports = {
  authentication: (req, res, next) => {
    const headers = req.headers
    if(!headers.auth){
      res.status(200).send(res, "Auth Required")
    } else {
      modelGetUser(headers.auth)
      .then((response) => {
        if(response.length === 1) {
          next()
        } else {
          res.status(500).send({message: 'Auth Does not valid'})
        }
      })
    }
  }
}
