using System;
using System.Threading.Tasks;
using HH20Core.Interactors.Users;
using HH20Core.Models;
using HH20Web.Middleware;
using Microsoft.AspNetCore.Mvc;

namespace HH20Web.Controllers.API
{
	[ApiController]
	[Route("api/activities")]
	public class ActivityController: Controller
	{
		private readonly ActivityInteractor activityInteractor;
		private readonly ICurrentUserInformation currentUserInformation;

		public ActivityController(ActivityInteractor activityInteractor, ICurrentUserInformation currentUserInformation)
		{
			this.activityInteractor = activityInteractor;
			this.currentUserInformation = currentUserInformation;
		}

		[HttpGet("")]
		public async Task<IActionResult> GetAll()
		{
			var result = await activityInteractor.GetAllActivitiesAsync(currentUserInformation.UserId);
			return Ok(result);
		}

		[HttpGet("{id}")]
		public async Task<IActionResult> GetById(Guid id)
		{
			var result = await activityInteractor.GetActivityByIdAsync(id);

			if (result == null)
			{
				return NotFound();
			}

			return Ok(result);
		}

		[HttpPost]
		public async Task<ActionResult> Create([FromBody] Activity newActivity)
		{
			var result = await activityInteractor.InsertAsync(currentUserInformation.UserId, newActivity);
			return Ok(result);
		}
	}
}