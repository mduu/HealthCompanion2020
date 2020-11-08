using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using HH20Core.Models;

namespace HH20Core.Repositories
{
    public interface IAcuteDiseaseRepository : IBaseRepository<AcuteDisease>
    {
        Task<IEnumerable<AcuteDisease>> GetByUserIdAsync(Guid userId);
    }
}