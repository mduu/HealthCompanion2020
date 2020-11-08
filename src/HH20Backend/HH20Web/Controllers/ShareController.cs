using System;
using System.Threading.Tasks;
using HH20Core.Interactors.Documents;
using HH20Core.Interactors.ShareViewing;
using HH20Core.Models;
using HH20Core.Repositories;
using Microsoft.AspNetCore.Mvc;

namespace HH20Web.Controllers
{
    [Route("")]
    public class ShareController : Controller
    {
        private readonly GetAllSharedDataInteractor getAllSharedDataInteractor;
        private readonly GetSharedActivitiesInteractor sharedActivitiesInteractor;
        private readonly InsertActivityInteractor insertActivityInteractor;
        private readonly DocumentsInteractor documentsInteractor;
        private readonly IShareRepository shareRepository;
        private readonly GetSharedDocumentsInteractor getSharedDocumentsInteractor;

        public ShareController(
            GetAllSharedDataInteractor getAllSharedDataInteractor,
            GetSharedActivitiesInteractor sharedActivitiesInteractor,
            InsertActivityInteractor insertActivityInteractor,
            DocumentsInteractor documentsInteractor,
            IShareRepository shareRepository,
            GetSharedDocumentsInteractor getSharedDocumentsInteractor)
        {
            this.getAllSharedDataInteractor = getAllSharedDataInteractor;
            this.sharedActivitiesInteractor = sharedActivitiesInteractor;
            this.insertActivityInteractor = insertActivityInteractor;
            this.documentsInteractor = documentsInteractor;
            this.shareRepository = shareRepository;
            this.getSharedDocumentsInteractor = getSharedDocumentsInteractor;
        }

        [Route("{sharekey}")]
        public async Task<IActionResult> Index(string shareKey)
        {
            if (string.IsNullOrWhiteSpace(shareKey))
            {
                return BadRequest(new {Error = "Share-Key not present in URL!"});
            }

            ViewBag.ShareKey = shareKey;
            var model = await getAllSharedDataInteractor.RetrieveAsync(shareKey);

            if (model == null)
            {
                return NotFound(new {Error = $"No share with shared-key {shareKey} found!"});
            }
            
            return View(model);
        }

        [Route("{sharekey}/activities")]
        public async Task<IActionResult> Activities(string shareKey, [FromQuery] int activityTypeFilter = -1)
        {
            if (string.IsNullOrWhiteSpace(shareKey))
            {
                return BadRequest(new {Error = "Share-Key not present in URL!"});
            }
            
            ViewBag.ShareKey = shareKey;
            var model = await sharedActivitiesInteractor.RetrieveAsync(shareKey, activityTypeFilter);

            if (model == null)
            {
                return NotFound(new {Error = $"No share with shared-key {shareKey} found!"});
            }
            
            return View(model);
        }

        [Route("{sharekey}/activities")]
        [HttpPost]
        public async Task<IActionResult> PostActivities(string shareKey, string title, string description, DateTime time, ActivityType activityType)
        {
            await insertActivityInteractor.InsertActivityAsync(shareKey, title, description, time, activityType);

            TempData["SuccessMessage"] = $"Activity {time.ToShortDateString()} - '{title}' added successfully.";
            
            return RedirectToAction("Activities", new {shareKey = shareKey});
        }
        

        [Route("{sharekey}/documents")]
        public async Task<IActionResult> Documents(string shareKey, int documentTypeFilter = -1)
        {
            var model = await getSharedDocumentsInteractor.GetDocuments(shareKey, documentTypeFilter);

            ViewBag.ShareKey = shareKey;
            
            return View(model);
        }

        [HttpGet("{sharekey}/download/{documentId}")]
        public async Task<ActionResult> DownloadDocumentById(string shareKey, Guid documentId)
        {
            var share = await shareRepository.GetByShareKeyAsync(shareKey);
            if (share == null)
            {
                return BadRequest($"Share with share key {shareKey} not found!");
            }

            var result = await documentsInteractor.GetDocumentByIdAsync(share.SharingUserId, documentId);
            if (result == null)
            {
                return NotFound(documentId);
            }

            return File(result.Content, result.MimeType, result.FileName);
        }
    }
}