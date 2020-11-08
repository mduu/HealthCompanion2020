using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HH20Core.Dtos;
using HH20Core.Interactors.Comments;
using HH20Core.Interactors.Documents;
using HH20Core.Models;
using HH20Core.Repositories;

namespace HH20Core.Interactors.Users
{
	public class ActivityInteractor
	{
		private readonly IActivityRepository activityRepository;
		private readonly DocumentsInteractor documentsInteractor;
		private readonly CommentsInteractor commentsInteractor;

		public ActivityInteractor(
			IActivityRepository activityRepository, DocumentsInteractor documentsInteractor, CommentsInteractor commentsInteractor)
		{
			this.activityRepository = activityRepository;
			this.documentsInteractor = documentsInteractor;
			this.commentsInteractor = commentsInteractor;
		}

		public async Task<Activity> GetActivityByIdAsync(Guid id)
		{
			return await activityRepository.GetByIdAsync(id);
		}

		public async Task<IEnumerable<ActivityDto>> GetAllActivitiesAsync(Guid userId)
		{
			var activityList = await activityRepository.GetByUserIdAsync(userId);

			if (activityList == null)
			{
				return new List<ActivityDto>();
			}

			var result = await Task.WhenAll( activityList.Select(ProcessActivity));
			return result.OrderByDescending(a => a.ActivityTime);
		}

		public async Task<ActivityDto> InsertAsync(Guid userId, Activity activity)
		{
			activity.Id = Guid.NewGuid();
			activity.UserId = userId;
			activity.ActivityTime = GetDate(activity.ActivityTime);
			await activityRepository.InsertAsync(activity);

			return await ProcessActivity(activity);
		}

		private async Task<ActivityDto> ProcessActivity(Activity activity)
		{
			var documents =
				await documentsInteractor.GetDocumentsForUserByActivityIdAsync(activity.Id);
			var comments = await commentsInteractor.GetByActivityIdAsync(activity.Id);
			return new ActivityDto
			{
				Id = activity.Id,
				ActivityTime = activity.ActivityTime,
				Title = activity.Title,
				Description = activity.Description,
				Details = activity.Details,
				ActivityType = activity.ActivityType,
				Documents = documents ?? new List<DocumentDto>(),
				Comments = comments ?? new List<CommentDto>()
			};
		}

		private DateTimeOffset GetDate(DateTimeOffset date)
		{
			return new DateTimeOffset(
				date.Year,
				date.Month,
				date.Day,
				date.Hour,
				date.Minute,
				date.Second,
				111,
				new TimeSpan()
			);
		}
	}
}