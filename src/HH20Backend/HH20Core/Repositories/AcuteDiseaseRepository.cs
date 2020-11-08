using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Dapper;
using HH20Core.Configuration;
using HH20Core.Models;

namespace HH20Core.Repositories
{
    public class AcuteDiseaseRepository : BaseRepository<AcuteDisease>, IAcuteDiseaseRepository
    {
        public AcuteDiseaseRepository(DatabaseConfiguration databaseConfiguration) : base(databaseConfiguration)
        {
        }

        public async Task<IEnumerable<AcuteDisease>> GetByUserIdAsync(Guid userId)
        {
            await using var connection = CreateSqlConnection();
            const string sql = "select * from AcuteDisease where UserId=@UserId";
            return await connection.QueryAsync<AcuteDisease>(sql, new {UserId = userId});
        }
    }
}