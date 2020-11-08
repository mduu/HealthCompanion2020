using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using HH20Core.Models;

namespace HH20Core.Repositories
{
    public interface IDocumentRepository : IBaseRepository<Document>
    {
        Task<IEnumerable<Document>> GetByUserIdAsync(Guid userId);
        Task<IEnumerable<Document>> GetByActivityIdAsync(Guid activityId);
    }
}