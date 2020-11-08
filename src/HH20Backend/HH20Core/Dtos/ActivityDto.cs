using System;
using System.Collections.Generic;
using HH20Core.Models;

namespace HH20Core.Dtos
{
	public class ActivityDto
	{
		public Guid Id { get; set; }
		public DateTimeOffset ActivityTime { get; set; }
		public string Title { get; set; }
		public string Description { get; set; }
		public string Details { get; set; }
		public ActivityType ActivityType { get; set; }
		public IEnumerable<DocumentDto> Documents { get; set; }
		public IEnumerable<CommentDto> Comments { get; set; }
	}
}