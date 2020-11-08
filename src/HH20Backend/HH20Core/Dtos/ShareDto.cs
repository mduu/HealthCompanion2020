using System;

namespace HH20Core.Dtos
{
	public class ShareDto
	{
		public DateTime ValidFromTime { get; set; }
		public DateTime ValidUntilTime { get; set; }
		public string Email { get; set; }
		public string ShareUrl { get; set; }
		public bool AllowActivities { get; set; }
		public bool AllowDocuments { get; set; }
		public bool AllowDiseases { get; set; }
		public bool AllowAcuteDiseases { get; set; }
		public bool AllowComments { get; set; }
		public bool AllowCommentsWrite { get; set; }
	}
}