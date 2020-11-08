using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HH20Core.Models;
using HH20Core.Repositories;

namespace HH20Core.Interactors.ShareViewing
{
    public class GetSharedDocumentsInteractor
    {
        private readonly IShareRepository shareRepository;
        private readonly IDocumentRepository documentRepository;
        private readonly IUserRepository userRepository;

        public GetSharedDocumentsInteractor(
            IShareRepository shareRepository,
            IDocumentRepository documentRepository,
            IUserRepository userRepository)
        {
            this.shareRepository = shareRepository;
            this.documentRepository = documentRepository;
            this.userRepository = userRepository;
        }

        public async Task<SharedDocuments> GetDocuments(string sharedKey, int documentTypeFilter)
        {
            var share = await shareRepository.GetByShareKeyAsync(sharedKey);
            var documents = (await documentRepository.GetByUserIdAsync(share.SharingUserId))
                .Where(d => documentTypeFilter == -1 || (int)d.DocumentType == documentTypeFilter)
                .OrderByDescending(d => d.DocumentTime)
                .Select(d => new DocumentEntry
                {
                    Document = d,
                    IsImage = d.Mimetype.StartsWith("image/")
                });

            return new SharedDocuments
            {
                ShareKey = sharedKey,
                DocumentTypeFilter = documentTypeFilter,
                User = await userRepository.GetByIdAsync(share.SharingUserId),
                Documents = documents,
            };
        }
    }

    public class SharedDocuments
    {
        public string ShareKey { get; set; }
        public int DocumentTypeFilter { get; set; }
        public User User { get; set; }
        public IEnumerable<DocumentEntry> Documents { get; set; }
    }

    public class DocumentEntry
    {
        public Document Document { get; set; }
        public bool IsImage { get; set; }
    }
}