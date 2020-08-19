using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Net.M.A004.Exercise1
{
    class Program
    {
        static void Main(string[] args)
        {
            int x,y;
            Console.WriteLine("Nhap x = ");
            x = int.Parse(Console.ReadLine());
            y = 2 * x * x * x - 6 * x * x + 2 * x  -1;
            Console.WriteLine(y);
        }
    }
}
