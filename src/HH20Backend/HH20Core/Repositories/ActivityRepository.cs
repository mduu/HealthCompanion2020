using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Dapper;
using HH20Core.Configuration;
using HH20Core.Models;

namespace HH20Core.Repositories
{
	public class ActivityRepository : BaseRepository<Activity>, IActivityRepository
	{
		public ActivityRepository(DatabaseConfiguration databaseConfiguration) : base(databaseConfiguration)
		{
		}

		public async Task<IEnumerable<Activity>> GetByUserIdAsync(Guid userId)
		{
			await using var connection = CreateSqlConnection();
			const string sql = "select * from Activity where UserId=@UserId";
			return await connection.QueryAsync<Activity>(sql, new {UserId = userId});
		}
	}
}