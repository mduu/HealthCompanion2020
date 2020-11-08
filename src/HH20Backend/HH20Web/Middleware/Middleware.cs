using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;

namespace HH20Web.Middleware
{
	public class Middleware
	{
		private readonly RequestDelegate _next;

		public Middleware(RequestDelegate next, ILoggerFactory logFactory)
		{
			_next = next;
		}

		public async Task Invoke(HttpContext httpContext, ICurrentUserInformation currentUserInformation)
		{
			if (httpContext.Request.Headers.ContainsKey("userid"))
			{
				currentUserInformation.UserId = new Guid(httpContext.Request.Headers["userid"]);
			}

			await _next(httpContext);
		}

	}

	// Extension method used to add the middleware to the HTTP request pipeline.
	public static class MiddlewareExtensions
	{
		public static IApplicationBuilder UseMiddleware(this IApplicationBuilder builder)
		{
			return builder.UseMiddleware<Middleware>();
		}
	}
}