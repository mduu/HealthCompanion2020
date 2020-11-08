using System.Threading.Tasks;
using HH20Core.Dtos;
using HH20Core.Interactors.Comments;
using HH20Web.Middleware;
using Microsoft.AspNetCore.Mvc;

namespace HH20Web.Controllers.API
{
	[ApiController]
	[Route("api/comments")]
	public class CommentsController : Controller
	{
		private readonly CommentsInteractor commentsInteractor;
		private readonly ICurrentUserInformation currentUserInformation;

		public CommentsController(CommentsInteractor commentsInteractor, ICurrentUserInformation currentUserInformation)
		{
			this.commentsInteractor = commentsInteractor;
			this.currentUserInformation = currentUserInformation;
		}

		[HttpPost]
		public async Task<ActionResult> CreateShare([FromBody] CommentDto commentDto)
		{
			var result = await commentsInteractor.CreateCommentForUserAsync(currentUserInformation.UserId, commentDto);

			return Ok(result);
		}
	}
}