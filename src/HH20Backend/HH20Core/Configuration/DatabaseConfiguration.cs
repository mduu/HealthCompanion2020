namespace HH20Core.Configuration
{
	public class DatabaseConfiguration
	{
		public string ConnectionString { get; }

		public DatabaseConfiguration(string connectionString)
		{
			ConnectionString = connectionString;
		}
	}
}