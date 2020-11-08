using System;
using System.IO;
using System.Threading;
using System.Threading.Tasks;
using Azure.Storage.Blobs;

namespace HH20Core.Services.DocumentStorage
{
    public class BlobDocumentStorage : IDocumentStorage
    {
        private readonly BlobDocumentStorageOptions options;

        public BlobDocumentStorage(BlobDocumentStorageOptions options)
        {
            this.options = options;
        }

        public async Task<string> StoreDocument(Guid userId, Stream documentData, CancellationToken cancellationToken)
        {
            var blobIdentifier = Guid.NewGuid().ToString("D");
            var blobClient = GetBlobClient(userId, blobIdentifier);
            await blobClient.UploadAsync(documentData, cancellationToken);

            return blobIdentifier;
        }

        public async Task RetrieveDocument(Guid userId, string blobIdentifier, Stream destinationStream)
        {
            var blobClient = GetBlobClient(userId, blobIdentifier);
            if (!await blobClient.ExistsAsync())
            {
                throw new InvalidOperationException($"Blob not found! Name: {blobClient.Name}");
            }
            
            await blobClient.DownloadToAsync(destinationStream);
        }

        public async Task DeleteDocument(Guid userId, string blobIdentifier)
        {
            var blobClient = GetBlobClient(userId, blobIdentifier);
            await blobClient.DeleteIfExistsAsync();
        }

        private BlobClient GetBlobClient(Guid userId, string blobIdentifier) 
            => GetContainer().GetBlobClient($"{userId}/{blobIdentifier}");

        private BlobContainerClient GetContainer() 
            => GetBlobClient().GetBlobContainerClient("user-documents");

        private BlobServiceClient GetBlobClient() 
            => new BlobServiceClient(options.ConnectionString);
    }
}