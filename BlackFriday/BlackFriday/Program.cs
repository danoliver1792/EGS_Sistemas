using System;

namespace Black
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Qual o valor do produto: ");
            float valor = float.Parse(Console.ReadLine());

            float desconto = CalcDesconto(valor);
            float valorAtual = CalcValorTotal(valor, desconto);

            Console.WriteLine("Produto custava: {0:N2}", valor / 100);
            Console.WriteLine("Com o desconto: {0:N2}", valorAtual / 100);
            Console.WriteLine("Valor do desconto: {0:N2}", desconto / 100);
        }

        public static float CalcDesconto(float valor)
        {
            float desconto = (float)(valor * 0.6);
            return desconto;
        }

        public static float CalcValorTotal(float valor, float desconto)
        {
            float valorAtual = valor - desconto;
            return valorAtual;
        }
    }
}
