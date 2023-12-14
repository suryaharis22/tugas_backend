function downloadFile(fileName) {
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            const success = Math.random() < 0.8;
            if (success) {
                resolve(`Download selesai\nHasil Download ${fileName}`);
            } else {
                reject(new Error(`Gagal download file ${fileName}`));
            }
        }, 1000);
    });
}

module.exports = downloadFile;
