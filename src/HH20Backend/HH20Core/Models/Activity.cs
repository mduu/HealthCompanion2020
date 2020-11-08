using Dapper.Contrib.Extensions;

namespace HH20Core.Models
{
	using System;

	[Table("Activity")]
	public class Activity
	{
		[ExplicitKey]
		public Guid Id { get; set; }
		public DateTimeOffset ActivityTime { get; set; }
		public string Title { get; set; }
		public string Description { get; set; }
		public Guid UserId { get; set; }
		public ActivityType ActivityType { get; set; }
		public string Details { get; set; }

		public string GetActivityTypeCaption()
			=> ActivityType switch
			{
				ActivityType.HospitalVisit => "Hospital visit",
				ActivityType.DoctorVisit => "Doctor visit",
				ActivityType.Accident => "Accident",
				ActivityType.Illness => "Illness",
				ActivityType.Meal => "Meal",
				ActivityType.Movement => "Movement",
				ActivityType.Vaccination => "Vaccination",
				ActivityType.Measurement => "Measurement",
				ActivityType.Medication => "Medication",
				_ => "Unknown"
			};

		public string GetDetailsInnerHtmlString()
		{
			var result = Details;
			result = result.Replace("<html>", "");
			result = result.Replace("</html>", "");
			return result;
		}
	}
}