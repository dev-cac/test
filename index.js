const dotenv = require('dotenv');
dotenv.config();

const {
  BlobServiceClient,
  StorageSharedKeyCredential,
} = require('@azure/storage-blob');

const account = process.env.ACCOUNT;
const accountKey = process.env.ACCOUNT_KEY;
const containerName = process.env.CONTAINER_NAME;
const EXCLUDE_FILES = []

const sharedKeyCredential = new StorageSharedKeyCredential(account, accountKey);
const blobServiceClient = new BlobServiceClient(
  `https://${account}.blob.core.windows.net`,
  sharedKeyCredential,
);

const containerClient = blobServiceClient.getContainerClient(containerName);

async function main() {
  for await (const blob of containerClient.listBlobsFlat()) {
    const NAME = blob.name.split('/').at(-1)
    if (EXCLUDE_FILES.includes(NAME)) { continue }

    const blockBlobClient = containerClient.getBlockBlobClient(blob.name);
    await blockBlobClient.downloadToFile(`./output/${NAME}`);

    console.log(`Descarga completa: ${NAME}`);
  }
}

main();
