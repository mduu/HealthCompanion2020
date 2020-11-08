using System.Collections.Generic;
using System.Linq;
using HH20Core.Models;

namespace HH20Core.Interactors.ShareViewing
{
    public class AllSharedData
    {
        public Share Share { get; set; }
        public User User { get; set; } = new User();
        public IEnumerable<Activity> Activities { get; set; } = Enumerable.Empty<Activity>();
        public IEnumerable<Document> Documents { get; set; } = Enumerable.Empty<Document>();
        public IEnumerable<Disease> Diseases { get; set; } = Enumerable.Empty<Disease>();
        public IEnumerable<AcuteDisease> AcuteDiseases { get; set; } = Enumerable.Empty<AcuteDisease>();
    }
}