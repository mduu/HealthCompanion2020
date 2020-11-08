using System;
using System.Threading.Tasks;
using Dapper;
using HH20Core.Configuration;
using HH20Core.Models;

namespace HH20Core.Repositories
{
    public class UserRepository : BaseRepository<User>, IUserRepository
    {
        public UserRepository(DatabaseConfiguration databaseConfiguration) : base(databaseConfiguration)
        {
        }

        /// <summary>
        /// Overwrite of GetByIdAsync from the BaseRepository because in case of the User table
        /// the default implementation in BaseRepository does not work because it uses the DapperContrb
        /// which does not properly escape the table name "User" so SQL-Server throws a "keyword found"
        /// error.
        /// </summary>
        public new async Task<User> GetByIdAsync(Guid userId)
        {
            await using var sqlConnection = CreateSqlConnection();
            const string sql = "select * from [User] where Id=@UserId";
            return await sqlConnection.QueryFirstOrDefaultAsync<User>(sql, new {UserId = userId});
        }

        public async Task<User> GetByInsuranceNumberAndBirthdayAsync(string insuranceNumber, DateTime birthday)
        {
            await using var sqlConnection = CreateSqlConnection();
            const string sql = "select * from [User] where InsuranceNumber=@InsuranceNumber";
            return await sqlConnection.QueryFirstOrDefaultAsync<User>(sql, new {InsuranceNumber = insuranceNumber});
        }
    }
}