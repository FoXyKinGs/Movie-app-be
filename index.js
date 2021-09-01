require('dotenv').config()

const express = require('express')
const cors = require('cors')
const bodyParses = require('body-parser')
const routes = require('./src/routes/routes')

const app = express()

app.use(cors())
app.use(bodyParses.urlencoded({extended: true}))
app.use(bodyParses.json())
app.use(routes)
app.use('/images', express.static('./public/images'))

app.listen(process.env.URL_PORT, () => {
  console.log(`App is running on port ${process.env.URL_PORT}`)
})
