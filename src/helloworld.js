const express = require('express')
const app = express()
const port = 3000

app.get('/shah', (req, res) => {
  res.send('hie this shah .how r u!')
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})
