const express = require('express')

const app = express()

app.get('/', (req, res) => {
    return res.send("Olá Docker")
})

app.listen(3000, () => {
    console.log("o Docker está no ar!!!")
})