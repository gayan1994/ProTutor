using System.Security.Cryptography;
using System.Text;

namespace ProTutor.Helpers
{
    public class CryptoHelper
    {
        public static byte[] GetHash(string inputString)
        {
            //uses SHA256 algorithm to hash the string

            using (HashAlgorithm algorithm = SHA256.Create())
                return algorithm.ComputeHash(Encoding.UTF8.GetBytes(inputString));
        }

        public static string GetHashString(string inputString)
        {
            StringBuilder sb = new StringBuilder();
            foreach (byte b in GetHash(inputString))
                sb.Append(b.ToString("X2"));

            return sb.ToString();
        }


    }
}