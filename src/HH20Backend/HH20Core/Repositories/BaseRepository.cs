using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Threading.Tasks;
using Dapper.Contrib.Extensions;
using HH20Core.Configuration;

namespace HH20Core.Repositories
{
	public abstract class BaseRepository<TModel> : IBaseRepository<TModel>
		where TModel : class
	{
		private readonly DatabaseConfiguration databaseConfiguration;

		public BaseRepository(DatabaseConfiguration databaseConfiguration)
		{
			this.databaseConfiguration = databaseConfiguration;
		}

		public async Task<TModel> GetByIdAsync(Guid id)
		{
			await using var sqlConnection = CreateSqlConnection();
			return await sqlConnection.GetAsync<TModel>(id);
		}

		public async Task<IEnumerable<TModel>> GetAllAsync()
		{
			await using var sqlConnection = CreateSqlConnection();
			return await sqlConnection.GetAllAsync<TModel>() ?? new List<TModel>();
		}

		public async Task InsertAsync(TModel model)
		{
			await using var sqlConnection = CreateSqlConnection();
			await sqlConnection.InsertAsync(model);
		}

		public async Task UpdateAsync(TModel model)
		{
			await using var sqlConnection = CreateSqlConnection();
			await sqlConnection.UpdateAsync(model);
		}

		public async Task DeleteAsync(TModel model)
		{
			await using var sqlConnection = CreateSqlConnection();
			await sqlConnection.DeleteAsync(model);
		}

		protected SqlConnection CreateSqlConnection()
			=> new SqlConnection(databaseConfiguration.ConnectionString);
	}
}