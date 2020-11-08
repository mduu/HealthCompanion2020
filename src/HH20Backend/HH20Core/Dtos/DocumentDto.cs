using System;
using HH20Core.Models;

namespace HH20Core.Dtos
{
	public class DocumentDto
	{
		public Guid Id { get; set; }
		public DateTimeOffset UploadedAt { get; set; }
		public DateTimeOffset DocumentTime { get; set; }
		public DocumentType DocumentType { get; set; }
		public string Filename { get; set; }
		public string Mimetype { get; set; }
		public string Title { get; set; }
		public string Description { get; set; }
	}
}