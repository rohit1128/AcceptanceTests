using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TechTalk.SpecFlow;

namespace GrosvenorDevQuiz.Specs
{
    public static class ScenarioContextExtensions
    {
        public static string Input(this ScenarioContext context)
        {
            return context.Get<string>("Input");
        }

        public static void Input(this ScenarioContext context, string input)
        {
            context.Set(input, "Input");
        }
        public static string Output(this ScenarioContext context)
        {
            return context.Get<string>("Output");
        }

        public static void Output(this ScenarioContext context, string input)
        {
            context.Set(input, "Output");
        }
    }
}
