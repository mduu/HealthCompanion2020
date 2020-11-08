using System.Threading.Tasks;
using Dapper;
using HH20Core.Configuration;
using HH20Core.Models;

namespace HH20Core.Repositories
{
    public class ShareRepository : BaseRepository<Share>, IShareRepository
    {
        public ShareRepository(DatabaseConfiguration databaseConfiguration) : base(databaseConfiguration)
        {
        }

        public async Task<Share> GetByShareKeyAsync(string shareKey)
        {
            await using var connection = CreateSqlConnection();
            const string sql = "select * from Share where ShareKey=@ShareKey";
            return await connection.QueryFirstOrDefaultAsync<Share>(sql, new {ShareKey = shareKey});
        }
    }
}