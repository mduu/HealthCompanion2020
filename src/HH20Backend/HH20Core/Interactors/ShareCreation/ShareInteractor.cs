using System;
using System.Linq;
using System.Threading.Tasks;
using HH20Core.Dtos;
using HH20Core.Models;
using HH20Core.Repositories;

namespace HH20Core.Interactors.Users.Creation
{
	public class ShareInteractor
	{
		private static Random ShareKeyRandom = new Random();
		private static readonly int ShareKeyLength = 10;
		private static readonly string ShareKeyPrefix = "https://hh20app.azurewebsites.net/";


		private readonly IShareRepository shareRepository;

		public ShareInteractor(IShareRepository shareRepository)
		{
			this.shareRepository = shareRepository;
		}

		public async Task<ShareDto> ShareContentForUserIdAsync(ShareDto shareDto, Guid userId)
		{
			var shareKey = CreateShareKey();
			shareDto.ShareUrl = ShareKeyPrefix + shareKey;
			var shareModel = new Share
			{
				Id = Guid.NewGuid(),
				ShareKey = shareKey,
				SharingUserId = userId,
				ValidFromTime = shareDto.ValidFromTime,
				ValidUntilTime = shareDto.ValidUntilTime,
				Email = shareDto.Email,
				AllowActivities = shareDto.AllowActivities,
				AllowDocuments = shareDto.AllowDocuments,
				AllowDiseases = shareDto.AllowDiseases,
				AllowAcuteDiseases = shareDto.AllowAcuteDiseases,
				AllowComments = shareDto.AllowComments,
				AllowCommentsWrite = shareDto.AllowCommentsWrite
			};

			await shareRepository.InsertAsync(shareModel);

			return shareDto;
		}

		private static string CreateShareKey()
		{
			const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

			return new string(Enumerable.Repeat(chars, ShareKeyLength)
				.Select(s => s[ShareKeyRandom.Next(s.Length)])
				.ToArray());
		}
	}
}