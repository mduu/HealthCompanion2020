using System;
using Dapper.Contrib.Extensions;

namespace HH20Core.Models
{
    [Table("Share")]
    public class Share
    {
        [ExplicitKey]
        public Guid Id { get; set; }
        public string ShareKey { get; set; }
        public Guid SharingUserId { get; set; }
        public DateTime ValidFromTime { get; set; }
        public DateTime ValidUntilTime { get; set; }
        public string Email { get; set; }
        public bool AllowActivities { get; set; }
        public bool AllowDocuments { get; set; }
        public bool AllowDiseases { get; set; }
        public bool AllowAcuteDiseases { get; set; }
        public bool AllowComments { get; set; }
        public bool AllowCommentsWrite { get; set; }
    }
}