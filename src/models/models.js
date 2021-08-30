const conn = require('../config/db')

module.exports = {
  modelGetMovie: () => {
    return new Promise((resolve, reject) => {
      conn.query('SELECT * FROM movies', (err, result) => {
        if(err) {
          reject(new Error())
        } else {
          resolve(result)
        }
      })
    })
  },
  modelGetUser: (username) => {
    return new Promise((resolve, reject) => {
      conn.query(`SELECT * FROM users WHERE username = '${username}'`, (err, result) => {
        if(err) {
          reject(new Error())
        } else {
          resolve(result)
        }
      })
    })
  },
  modelSetUser: (dataUser) => {
    return new Promise((resolve, reject) => {
      conn.query('INSERT INTO users SET ? ', dataUser, (err, result) => {
        if(err) {
          reject(new Error())
        } else {
          resolve(result)
        }
      })
    })
  },
}
