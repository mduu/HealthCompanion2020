using System;
using System.Threading.Tasks;
using HH20Core.Interactors.Import;
using HH20Web.Middleware;
using Microsoft.AspNetCore.Mvc;

namespace HH20Web.Controllers.API
{
    [ApiController]
    [Route("api/users")]
    public class UserApiController : Controller
    {
        private readonly RequestImportUserInteractor requestImportUserInteractor;
        private readonly ConfirmImportUserInteractor confirmImportUserInteractor;
        private readonly ICurrentUserInformation currentUserInformation;

        public UserApiController(
            RequestImportUserInteractor requestImportUserInteractor,
            ConfirmImportUserInteractor confirmImportUserInteractor,
            ICurrentUserInformation currentUserInformation)
        {
            this.requestImportUserInteractor = requestImportUserInteractor;
            this.confirmImportUserInteractor = confirmImportUserInteractor;
            this.currentUserInformation = currentUserInformation;
        }

        [HttpGet("import")]
        public async Task<IActionResult> Import([FromQuery] string insuranceNumber, [FromQuery] DateTime birthday)
        {
            var interactorResult = await requestImportUserInteractor.ImportAsync(insuranceNumber, birthday);
            if (interactorResult == null)
            {
                return NotFound(insuranceNumber);
            }

            return Ok(interactorResult);
        }
        
        [HttpPost("import")]
        public async Task<IActionResult> Import([FromBody] AllDiseases body)
        {
            await confirmImportUserInteractor.Confirm(currentUserInformation.UserId, body);
            
            return Ok();
        }
    }
}