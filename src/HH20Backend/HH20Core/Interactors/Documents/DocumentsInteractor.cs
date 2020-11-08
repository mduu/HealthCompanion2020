using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;
using HH20Core.Dtos;
using HH20Core.Models;
using HH20Core.Repositories;
using HH20Core.Services.DocumentStorage;

namespace HH20Core.Interactors.Documents
{
	public class DocumentsInteractor
	{
		private readonly IDocumentRepository documentRepository;
		private readonly IDocumentStorage documentStorage;

		public DocumentsInteractor(IDocumentRepository documentRepository, IDocumentStorage documentStorage)
		{
			this.documentRepository = documentRepository;
			this.documentStorage = documentStorage;
		}

		public async Task<IEnumerable<DocumentDto>> GetDocumentsAsync(Guid userId)
		{
			var list = await documentRepository.GetByUserIdAsync(userId);

			if (list == null)
			{
				return new List<DocumentDto>();
			}

			return list.Select(Process);
		}

		public async Task<IEnumerable<DocumentDto>> GetDocumentsForUserByActivityIdAsync(Guid activityId)
		{
			var list = await documentRepository.GetByActivityIdAsync(activityId);

			if (list == null)
			{
				return new List<DocumentDto>();
			}

			return list.Select(Process);
		}

		public async Task<DocumentDownloadDto> GetDocumentByIdAsync(Guid userId, Guid documentId)
		{
			var document = await documentRepository.GetByIdAsync(documentId);
			var stream = new MemoryStream();
			await documentStorage.RetrieveDocument(userId, document.BlobIdentifier, stream);
			stream.Seek(0, 0);

			stream.Seek(0, 0);

			return new DocumentDownloadDto
			{
				Content = stream,
				FileName = document.Filename,
				MimeType = document.Mimetype
			};
		}

		public async Task<Guid> SaveDocumentForUserAsync(Guid userId, CreateDocumentDto documentDto)
		{
			var bytes = Convert.FromBase64String(documentDto.Base64String);
			var stream = new MemoryStream(bytes);
			var blobIdentifier = await documentStorage.StoreDocument(userId, stream, CancellationToken.None);

			Document document = new Document
			{
				Id = Guid.NewGuid(),
				UploadedAt = DateTimeOffset.Now,
				DocumentTime = documentDto.DocumentTime,
				UserId = userId,
				ActivityId = documentDto.ActivityId,
				DocumentType = documentDto.DocumentType,
				Filename = documentDto.Filename,
				Mimetype = documentDto.Mimetype,
				BlobIdentifier = blobIdentifier,
				Title = documentDto.Title,
				Description = documentDto.Description
			};

			await documentRepository.InsertAsync(document);

			return document.Id;
		}

		private DocumentDto Process(Document document)
		{
			return new DocumentDto
			{
				Id = document.Id,
				UploadedAt = document.UploadedAt,
				DocumentTime = document.DocumentTime,
				DocumentType = document.DocumentType,
				Filename = document.Filename,
				Mimetype = document.Mimetype,
				Title = document.Title,
				Description = document.Description
			};
		}
	}
}