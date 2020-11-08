using System;
using System.Threading.Tasks;
using HH20Core.Models;

namespace HH20Core.Repositories
{
    public interface IUserRepository : IBaseRepository<User>
    {
        Task<User> GetByInsuranceNumberAndBirthdayAsync(string insuranceNumber, DateTime birthday);
    }
}