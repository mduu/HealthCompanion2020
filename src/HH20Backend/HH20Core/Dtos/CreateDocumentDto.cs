using System;
using HH20Core.Models;

namespace HH20Core.Dtos
{
	public class CreateDocumentDto
	{
		public DateTimeOffset DocumentTime { get; set; }
		public Guid ActivityId { get; set; }
		public DocumentType DocumentType { get; set; }
		public string Filename { get; set; }
		public string Mimetype { get; set; }
		public string BlobIdentifier { get; set; }
		public string Title { get; set; }
		public string Description { get; set; }
		public string Base64String { get; set; }
	}
}