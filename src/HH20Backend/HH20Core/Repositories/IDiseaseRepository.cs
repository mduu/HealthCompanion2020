using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using HH20Core.Models;

namespace HH20Core.Repositories
{
    public interface IDiseaseRepository : IBaseRepository<Disease>
    {
        Task<IEnumerable<Disease>> GetByUserIdAsync(Guid userId);
    }
}