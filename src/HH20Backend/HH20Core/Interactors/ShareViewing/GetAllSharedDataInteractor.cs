using System;
using System.Linq;
using System.Threading.Tasks;
using HH20Core.Models;
using HH20Core.Repositories;

namespace HH20Core.Interactors.ShareViewing
{
    public class GetAllSharedDataInteractor
    {
        private readonly IShareRepository shareRepository;
        private readonly IUserRepository userRepository;
        private readonly IDocumentRepository documentRepository;
        private readonly IActivityRepository activityRepository;
        private readonly IDiseaseRepository diseaseRepository;
        private readonly IAcuteDiseaseRepository acuteDiseaseRepository;

        public GetAllSharedDataInteractor(
            IShareRepository shareRepository,
            IUserRepository userRepository,
            IDocumentRepository documentRepository,
            IActivityRepository activityRepository,
            IDiseaseRepository diseaseRepository,
            IAcuteDiseaseRepository acuteDiseaseRepository)
        {
            this.shareRepository = shareRepository;
            this.userRepository = userRepository;
            this.documentRepository = documentRepository;
            this.activityRepository = activityRepository;
            this.diseaseRepository = diseaseRepository;
            this.acuteDiseaseRepository = acuteDiseaseRepository;
        }
        
        public async Task<AllSharedData> RetrieveAsync(string shareKey)
        {
            var share = await shareRepository.GetByShareKeyAsync(shareKey);
            if (share == null || share.ValidFromTime > DateTime.Now || share.ValidUntilTime < DateTime.Now)
            {
                return null;
            }

            return new AllSharedData
            {
                Share = share,
                User = await userRepository.GetByIdAsync(share.SharingUserId),
                Activities = share.AllowActivities ? await activityRepository.GetByUserIdAsync(share.SharingUserId) : Enumerable.Empty<Activity>(),
                Documents = share.AllowDocuments ? await documentRepository.GetByUserIdAsync(share.SharingUserId) : Enumerable.Empty<Document>(),
                Diseases = share.AllowDiseases ? await diseaseRepository.GetByUserIdAsync(share.SharingUserId) : Enumerable.Empty<Disease>(),
                AcuteDiseases = share.AllowAcuteDiseases ? await acuteDiseaseRepository.GetByUserIdAsync(share.SharingUserId) : Enumerable.Empty<AcuteDisease>(),
            };
        }

        public async Task<Share> GetShareForShareKeyAsync(string shareKey)
        {
            return await shareRepository.GetByShareKeyAsync(shareKey);
        }
    }
}