const express = require('express')
const app = express()
const port = 3000

app.get('/karthik', (req, res) => {
  res.send('hie this karthik .how r u!')
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})
