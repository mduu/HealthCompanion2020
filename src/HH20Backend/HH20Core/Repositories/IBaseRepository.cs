using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace HH20Core.Repositories
{
	public interface IBaseRepository<TModel>
		where TModel : class
	{
		Task<TModel> GetByIdAsync(Guid id);
		Task<IEnumerable<TModel>> GetAllAsync();
		Task InsertAsync(TModel model);
		Task UpdateAsync(TModel model);
		Task DeleteAsync(TModel model);
	}
}