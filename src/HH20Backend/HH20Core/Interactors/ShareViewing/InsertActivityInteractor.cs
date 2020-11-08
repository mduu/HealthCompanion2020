using System;
using System.Threading.Tasks;
using HH20Core.Interactors.Users;
using HH20Core.Models;
using HH20Core.Repositories;

namespace HH20Core.Interactors.ShareViewing
{
    public class InsertActivityInteractor
    {
        private readonly IShareRepository shareRepository;
        private readonly ActivityInteractor activityInteractor;

        public InsertActivityInteractor(
            IShareRepository shareRepository,
            ActivityInteractor activityInteractor)
        {
            this.shareRepository = shareRepository;
            this.activityInteractor = activityInteractor;
        }
        
        public async Task InsertActivityAsync(
            string shareKey,
            string title,
            string description,
            DateTime activityTime,
            ActivityType activityType)
        {
            var share = await shareRepository.GetByShareKeyAsync(shareKey);
            if (share == null)
            {
                throw new InvalidOperationException($"No share with share key {shareKey} found!");
            }

            await activityInteractor.InsertAsync(
                share.SharingUserId,
                new Activity
                {
                    Title = title,
                    Description = description,
                    ActivityTime = activityTime,
                    ActivityType = activityType,
                });
        }
    }
}