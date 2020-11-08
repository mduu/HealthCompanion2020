using System.IO;

namespace HH20Core.Dtos
{
	public class DocumentDownloadDto
	{
		public Stream Content { get; set; }
		public string MimeType { get; set; }
		public string FileName { get; set; }
	}
}