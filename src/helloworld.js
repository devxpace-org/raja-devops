const express = require('express')
const app = express()
const port = 3000

app.get('/supriya', (req, res) => {
  res.send('hie this supriya .how r u!')
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})
