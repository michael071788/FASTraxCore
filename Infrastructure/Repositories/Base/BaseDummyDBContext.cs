using Microsoft.EntityFrameworkCore;

namespace FASTraxCore
{
    // This base dummy db context is intended for checking /testing connection settings only
    public class BaseDummyDBContext : DbContext, IBaseDbContext
    {
        public DatabaseCredentialModel  DatabaseCredential { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseMySQL(@"server=" + DatabaseCredential.ServerHostName +
                                    ";port=" + DatabaseCredential.PortNo +
                                    ";database=" + DatabaseCredential.DatabaseName +
                                    ";uid=" + DatabaseCredential.UserID +
                                    ";password=" + DatabaseCredential.DatabasePassword.Unsecure() + 
                                    ";Charset=utf8;"); 

            base.OnConfiguring(optionsBuilder);
        }
    }
}
