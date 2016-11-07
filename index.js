// dot env
require('dotenv').config({ silent: true });
const express = require('express');
const bodyParser = require('body-parser');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 3000;

// This will parse our payload from fetch which is sent as a JSON object
app.use(bodyParser.json());

app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'index.html'));
});

// Modular routes

// import router for our API
const apiMoviesRouter = require('./routes/api/movies');

// map our apiRouter to the '/api' route
app.use('/api/movies', apiMoviesRouter);

app.listen(PORT, () => {
  console.log('connected babybabybabyuuuuughhh...!');
});
