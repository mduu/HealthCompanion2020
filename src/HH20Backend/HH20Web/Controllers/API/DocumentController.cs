using System;
using System.Threading.Tasks;
using HH20Core.Dtos;
using HH20Core.Interactors.Documents;
using HH20Core.Interactors.Users;
using HH20Core.Models;
using HH20Web.Middleware;
using Microsoft.AspNetCore.Mvc;

namespace HH20Web.Controllers.API
{
	[ApiController]
	[Route("api/documents")]
	public class DocumentController : Controller
	{
		private readonly DocumentsInteractor documentsInteractor;
		private readonly ICurrentUserInformation currentUserInformation;

		public DocumentController(DocumentsInteractor documentsInteractor, ICurrentUserInformation currentUserInformation)
		{
			this.documentsInteractor = documentsInteractor;
			this.currentUserInformation = currentUserInformation;
		}

		[HttpGet]
		public async Task<ActionResult> GetDocuments()
		{
			var result = await documentsInteractor.GetDocumentsAsync(currentUserInformation.UserId);

			return Ok(result);
		}

		[HttpGet("activity/{activityId}")]
		public async Task<ActionResult> GetDocuments(Guid activityId)
		{
			var result = await documentsInteractor.GetDocumentsForUserByActivityIdAsync(activityId);

			return Ok(result);
		}

		[HttpGet("{documentId}")]
		public async Task<ActionResult> GetDocumentById(Guid documentId)
		{
			var result = await documentsInteractor.GetDocumentByIdAsync(currentUserInformation.UserId, documentId);

			if (result == null)
			{
				return NotFound(documentId);
			}

			return File(result.Content, result.MimeType, result.FileName);
		}

		[HttpPost]
		public async Task<ActionResult> CreateDocument([FromBody] CreateDocumentDto document)
		{
			var result = await documentsInteractor.SaveDocumentForUserAsync(currentUserInformation.UserId, document);

			return Ok(result);
		}
	}
}