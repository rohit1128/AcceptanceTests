using System;
using TechTalk.SpecFlow;
using GrosvenorDevQuiz.BusinessObjects;
using Microsoft.VisualStudio.TestTools.UnitTesting;
namespace GrosvenorDevQuiz.Specs
{
    [Binding]
    public class GrosvenorDevQuizSteps
    {
        [Given(@"the following input")]
        public void GivenTheFollowingInput(Table table)
        {
            var row = table.Rows[0];
            var input = row["Input"];
            ScenarioContext.Current.Input(input);
        }

        [When(@"the server takes the order")]
        public void WhenTheServerTakesTheOrder()
        {
            var server = new Server();
            var input = ScenarioContext.Current.Input();
            var output = server.TakeOrder(input);
            ScenarioContext.Current.Output(output);
        }
        [Then(@"the following should be the output")]
        [Then(@"the output is in the following particular order")]
        [Then(@"the output is in the following")]
        [Then(@"the output should be the following")]
        public void ThenTheOutputShouldBeTheFollowing (Table table)
        {
            var row = table.Rows[0];
            var expectedOutput = row["Output"];
            var actualOutput = ScenarioContext.Current.Output();
            Assert.AreEqual(expectedOutput, actualOutput);
        }

        [Then(@"the order should give an error")]
        [Then(@"the output should contain an error")]
        public void ThenTheOutputShouldContainAnError()
        {
            var output = ScenarioContext.Current.Output();
            var items = output.Replace(" ", "").Split(',');
      
            Assert.IsTrue(Array.IndexOf(items, "error") >-1, "The food output does not contain an error , when it should not" );
        }

        [Then(@"the output should not contain an error")]
        public void ThenTheOutputShouldNotContainAnError()
        {
            var output=ScenarioContext.Current.Output();
            var items = output.Replace(" ", "").Split(',');
            Assert.IsTrue(Array.IndexOf(items, "Error") == -1, "The output contains an error, when it should not");
        }

        [Then(@"the output should not contain any breakfast items")]
        public void ThenTheOutputShouldNotContainAnyBreakfastItems()
        {
            var output = ScenarioContext.Current.Output();
            var items = output.Replace(" ", "").Split(',');
            Assert.IsTrue(Array.IndexOf(items, "eggs") == -1, "The output contains eggs, when it should not");
            Assert.IsTrue(Array.IndexOf(items, "toast") == -1, "The output contains toast, when it should not");
            Assert.IsTrue(Array.IndexOf(items, "coffee") == -1, "The output contains coffee, when it should not");
        }

    }
}
