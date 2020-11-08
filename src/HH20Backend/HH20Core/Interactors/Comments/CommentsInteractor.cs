using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HH20Core.Dtos;
using HH20Core.Models;
using HH20Core.Repositories;

namespace HH20Core.Interactors.Comments
{
	public class CommentsInteractor
	{
		private readonly ICommentsRepository commentsRepository;

		public CommentsInteractor(ICommentsRepository commentsRepository)
		{
			this.commentsRepository = commentsRepository;
		}

		public async Task<IEnumerable<CommentDto>> GetByActivityIdAsync(Guid activityId)
		{
			var list = await commentsRepository.GetByActivityIddAsync(activityId);

			return list.Select(Process);
		}

		public async Task<Comment> CreateCommentForUserAsync(Guid userId, CommentDto commentDto)
		{
			var comment = new Comment
			{
				Id = Guid.NewGuid(),
				UserId = userId,
				ActivityId = commentDto.ActivityId,
				Username = commentDto.Username,
				Text = commentDto.Text,
				Timestamp = commentDto.Timestamp
			};
			await commentsRepository.InsertAsync(comment);
			return comment;
		}

		private CommentDto Process(Comment comment)
		{
			return new CommentDto
			{
				Id = comment.Id,
				ActivityId = comment.ActivityId,
				Username = comment.Username,
				Text = comment.Text,
				Timestamp = comment.Timestamp
			};
		}
	}
}