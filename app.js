const express = require('express');
const bodyParser = require('body-parser');

const placesRoutees = require('./routes/places-routes');

const app = express();

app.use('/places',placesRoutees);

app.listen(8088);