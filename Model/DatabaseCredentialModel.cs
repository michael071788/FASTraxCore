using System.Security;

namespace FASTraxCore
{
    public class DatabaseCredentialModel
    {
        public string ServerHostName { get; set; }

        public string PortNo { get; set; }

        public string DatabaseName { get; set; }

        public string UserID { get; set; }

        public SecureString DatabasePassword { get; set; }
    }
}
