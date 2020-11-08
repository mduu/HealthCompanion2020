using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using HH20Core.Models;

namespace HH20Core.Repositories
{
	public interface IActivityRepository : IBaseRepository<Activity>
	{
		Task<IEnumerable<Activity>> GetByUserIdAsync(Guid userId);
	}
}