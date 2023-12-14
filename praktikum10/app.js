// app.js
const downloadFile = require('./downloadFile');

const fileName = "Laravel.zip";

downloadFile(fileName)
    .then((message) => {
        console.log(message);
    })
    .catch((error) => {
        console.error(error.message);
    });
