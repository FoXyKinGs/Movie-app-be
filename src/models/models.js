const conn = require('../config/db')

module.exports = {
  modelGetDetailMovie: (id) => {
    return new Promise((resolve, reject) => {
      conn.query(`SELECT * FROM movies WHERE id = '${id}'`, (err, result) => {
        if(err) {
          reject(new Error())
        } else {
          resolve(result)
        }
      })
    })
  },
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
  modelSetTransactionMembership: (dataUser) => {
    return new Promise((resolve, reject) => {
      conn.query('INSERT INTO transaction_membership SET ? ', dataUser , (err, result) => {
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
  modelGetOnlyActiveMembership: ({username, membership}) => {
    return new Promise((resolve, reject) => {
      conn.query(`SELECT * FROM users u
      JOIN transaction_membership tm ON u.id = tm.id_user
      JOIN membership m ON tm.id_membership = m.id
      WHERE (timestamp(DATE_ADD(tm.date, INTERVAL 30 DAY)) > timestamp(NOW()))
      AND (u.username = '${username}')
      AND (m.membership_name = '${membership}')`, 
      (err, result) => {
        if(err) {
          reject(new Error())
        } else {
          resolve(result)
        }
      })
    })
  },
}
