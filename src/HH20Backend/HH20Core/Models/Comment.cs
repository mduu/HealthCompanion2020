using System;
using Dapper.Contrib.Extensions;

namespace HH20Core.Models
{
	[Table("Comments")]
	public class Comment
	{
		[ExplicitKey]
		public Guid Id { get; set; }
		public Guid UserId { get; set; }
		public Guid ActivityId { get; set; }
		public string Username { get; set; }
		public string Text { get; set; }
		public DateTime Timestamp { get; set; }
	}
}