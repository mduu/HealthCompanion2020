namespace HH20Web.Middleware
{
	using System;

	public interface ICurrentUserInformation
	{
		Guid UserId { get; set; }
	}
}