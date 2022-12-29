const {v4 : uuidv4} = require('uuid');

const { exitCode } = require('process');
const HttpError = require('../models/http-error');

const placeDBRecord = [
    {
        id: "p1",
        desc: "Hi I am London"
    }
];

const getPlaceById = (req,res,next) => {
    const placeId = req.params.pid;
    const place = placeDBRecord.find(ele => 
        {return ele.id == placeId});

    if (!place) {
        throw new HttpError('could not find a place with pid',404);
    }
    res.json({place});
};

const createPlace = (req,res,next) => {
    const { desc } = req.body;
    // const id = req.body.id

    const createdPlace = {
        id: uuidv4(),
        desc
    };
    placeDBRecord.push(createdPlace);

    res.status(201).json({place: createdPlace});
};

// function getPlaceById () {...}
// const getPlaceById = function () {...}

exports.getPlaceById = getPlaceById;
exports.createPlace = createPlace;