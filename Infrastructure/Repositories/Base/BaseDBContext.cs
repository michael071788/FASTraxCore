using Microsoft.EntityFrameworkCore;

namespace FASTraxCore
{
    public class BaseDBContext: DbContext, IBaseDbContext
    {
        public DatabaseCredentialModel DatabaseCredential { get; set; }

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
