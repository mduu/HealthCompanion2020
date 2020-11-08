using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using HH20Core.Models;

namespace HH20Core.Repositories
{
	public interface ICommentsRepository: IBaseRepository<Comment>
	{
		Task<IEnumerable<Comment>> GetByActivityIddAsync(Guid activityId);
	}
}