using System.Threading.Tasks;
using HH20Core.Models;

namespace HH20Core.Repositories
{
    public interface IShareRepository : IBaseRepository<Share>
    {
        Task<Share> GetByShareKeyAsync(string shareKey);
    }
}