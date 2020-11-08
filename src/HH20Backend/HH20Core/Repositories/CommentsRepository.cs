using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Dapper;
using HH20Core.Configuration;
using HH20Core.Models;

namespace HH20Core.Repositories
{
	public class CommentsRepository : BaseRepository<Comment>, ICommentsRepository
	{
		public CommentsRepository(DatabaseConfiguration databaseConfiguration) : base(databaseConfiguration)
		{
		}

		public async Task<IEnumerable<Comment>> GetByActivityIddAsync(Guid activityId)
		{
			await using var connection = CreateSqlConnection();
			const string sql = "select * from Comments where ActivityId=@ActivityId";
			return await connection.QueryAsync<Comment>(sql, new {ActivityId = activityId});
		}
	}
}