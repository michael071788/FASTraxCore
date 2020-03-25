using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;


namespace FASTraxCore
{
    public interface IBaseDbContext : IDisposable
    {

        public DatabaseCredentialModel DatabaseCredential { get; set; }

        //ChangeTracker ChangeTracker { get; }
        //DbSet<T> Set<T>() where T : class;
        //EntityEntry<T> Entry<T>(T entity) where T : class;
 
    }
}
