using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HH20Core.Models;
using HH20Core.Repositories;

namespace HH20Core.Interactors.ShareViewing
{
    public class GetSharedActivitiesInteractor
    {
        private readonly IShareRepository shareRepository;
        private readonly IActivityRepository activityRepository;
        private readonly IDocumentRepository documentRepository;
        private readonly IUserRepository userRepository;

        public GetSharedActivitiesInteractor(
            IShareRepository shareRepository,
            IActivityRepository activityRepository,
            IDocumentRepository documentRepository,
            IUserRepository userRepository)
        {
            this.shareRepository = shareRepository;
            this.activityRepository = activityRepository;
            this.documentRepository = documentRepository;
            this.userRepository = userRepository;
        }

        public async Task<SharedActivities> RetrieveAsync(string shareKey, int activityTypeFilter)
        {
            var share = await shareRepository.GetByShareKeyAsync(shareKey);
            if (share == null || share.ValidFromTime > DateTime.Now || share.ValidUntilTime < DateTime.Now || !share.AllowActivities)
            {
                return null;
            }

            var activitiesPerDay = (await activityRepository.GetByUserIdAsync(share.SharingUserId))
                .Where(a => activityTypeFilter == -1 || (int)a.ActivityType == activityTypeFilter)
                .OrderByDescending(a => a.ActivityTime)
                .GroupBy(a => a.ActivityTime.Date);

            var documents = await documentRepository.GetByUserIdAsync(share.SharingUserId);

            return new SharedActivities
            {
                User = await userRepository.GetByIdAsync(share.SharingUserId),
                ActivityFilter = activityTypeFilter,
                Days = activitiesPerDay.Select(dayGroup => new SharedActivities.SharedActivitiesPerDay
                {
                    Date = dayGroup.Key,
                    Activities = dayGroup.Select(a => new SharedActivities.SharedActivitiesPerDay.SharedActivity
                    {
                        Activity = a,
                        Properties = new Dictionary<string, string>(),
                        Documents = documents
                            .Where(d => d.ActivityId == a.Id)
                            .OrderByDescending(d => d.DocumentTime)
                    })
                })
            };
        }
    }

    public class SharedActivities
    {
        public User User { get; set; }
        public IEnumerable<SharedActivitiesPerDay> Days { get; set; }
        
        public int ActivityFilter { get; set; }
        
        public class SharedActivitiesPerDay
        {
            public DateTime Date { get; set; }
            public IEnumerable<SharedActivity> Activities { get; set; }

            public class SharedActivity
            {
                public Activity Activity { get; set; }
                public Dictionary<string, string> Properties { get; set; }
                public IEnumerable<Document> Documents { get; set; }
            }
        }
    }
}