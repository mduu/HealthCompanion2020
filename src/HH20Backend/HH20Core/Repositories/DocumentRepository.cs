using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Dapper;
using HH20Core.Configuration;
using HH20Core.Models;

namespace HH20Core.Repositories
{
    public class DocumentRepository : BaseRepository<Document>, IDocumentRepository
    {
        public DocumentRepository(DatabaseConfiguration databaseConfiguration) : base(databaseConfiguration)
        {
        }

        public async Task<IEnumerable<Document>> GetByUserIdAsync(Guid userId)
        {
            await using var connection = CreateSqlConnection();
            const string sql = "select * from Document where UserId=@UserId";
            return await connection.QueryAsync<Document>(sql, new {UserId = userId});
        }

        public async Task<IEnumerable<Document>> GetByActivityIdAsync(Guid activityId)
        {
            await using var connection = CreateSqlConnection();
            const string sql = "select * from Document where ActivityId=@ActivityId";
            return await connection.QueryAsync<Document>(sql, new {ActivityId = activityId});
        }


    }
}