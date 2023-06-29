const express = require('express')
const app = express()
const port = 3000

app.get('/rksimha', (req, res) => {
  res.send('im good .how abt uh-1!')
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})
