using System;

namespace HH20Core.Dtos
{
	public class CommentDto
	{
		public Guid Id { get; set; }
		public Guid ActivityId { get; set; }
		public string Username { get; set; }
		public string Text { get; set; }
		public DateTime Timestamp { get; set; }
	}
}