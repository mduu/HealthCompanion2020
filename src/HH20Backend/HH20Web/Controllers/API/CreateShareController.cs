using System.Threading.Tasks;
using HH20Core.Dtos;
using HH20Core.Interactors.Users.Creation;
using HH20Web.Middleware;
using Microsoft.AspNetCore.Mvc;

namespace HH20Web.Controllers.API
{
	[ApiController]
	[Route("api/share")]
	public class CreateShareController : Controller
	{
		private readonly ShareInteractor shareInteractor;
		private readonly ICurrentUserInformation currentUserInformation;

		public CreateShareController(ShareInteractor shareInteractor, ICurrentUserInformation currentUserInformation)
		{
			this.shareInteractor = shareInteractor;
			this.currentUserInformation = currentUserInformation;
		}

		[HttpPost]
		public async Task<ActionResult> CreateShare([FromBody] ShareDto shareDto)
		{
			var result = await shareInteractor.ShareContentForUserIdAsync(shareDto, currentUserInformation.UserId);

			return Ok(result);
		}
	}
}