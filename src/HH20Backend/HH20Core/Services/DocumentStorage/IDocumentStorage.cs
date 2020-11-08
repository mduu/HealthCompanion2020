using System;
using System.IO;
using System.Threading;
using System.Threading.Tasks;

namespace HH20Core.Services.DocumentStorage
{
    public interface IDocumentStorage
    {
        Task<string> StoreDocument(Guid userId, Stream documentData, CancellationToken cancellationToken);
        Task RetrieveDocument(Guid userId, string blobIdentifier, Stream destinationStream);
        Task DeleteDocument(Guid userId, string blobIdentifier);
    }
}