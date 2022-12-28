const express = require('express');

const router = express.Router();

const placeDBRecord = [
    {
        id: "p1",
        desc: "Hi I am London"
    }
];

router.get('/:pid',(req,res,next) => {
    const placeId = req.params.pid;
    const place = placeDBRecord.find(ele => 
        {return ele.id == placeId});
    res.json({place});
});

module.exports = router;