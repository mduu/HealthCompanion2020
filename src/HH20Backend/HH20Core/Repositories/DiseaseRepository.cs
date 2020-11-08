using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Dapper;
using HH20Core.Configuration;
using HH20Core.Models;

namespace HH20Core.Repositories
{
    public class DiseaseRepository : BaseRepository<Disease>, IDiseaseRepository
    {
        public DiseaseRepository(DatabaseConfiguration databaseConfiguration) : base(databaseConfiguration)
        {
        }

        public async Task<IEnumerable<Disease>> GetByUserIdAsync(Guid userId)
        {
            await using var connection = CreateSqlConnection();
            const string sql = "select * from Disease where UserId=@UserId";
            return await connection.QueryAsync<Disease>(sql, new {UserId = userId});
        }
    }
}