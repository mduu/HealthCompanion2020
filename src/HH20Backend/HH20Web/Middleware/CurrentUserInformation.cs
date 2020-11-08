using System;

namespace HH20Web.Middleware
{
	public class CurrentUserInformation : ICurrentUserInformation
	{
		public Guid UserId { get; set; }
	}
}