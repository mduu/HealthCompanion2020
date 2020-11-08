using System;
using Dapper.Contrib.Extensions;

namespace HH20Core.Models
{
    [Table("Document")]
    public class Document
    {
        [ExplicitKey]
        public Guid Id { get; set; }
        public DateTimeOffset UploadedAt { get; set; }
        public DateTimeOffset DocumentTime { get; set; }
        public Guid UserId { get; set; }
        public Guid ActivityId { get; set; }
        public DocumentType DocumentType { get; set; }
        public string Filename { get; set; }
        public string Mimetype { get; set; }
        public string BlobIdentifier { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
    }
}