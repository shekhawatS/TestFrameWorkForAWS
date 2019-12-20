using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Text;
using TechTalk.SpecFlow;

namespace UnitTestProjectCoreMesTest
{
    [Binding]
    class BDDTestStepDefinitions
    {
        int c = 0, a = 0, b = 0;

        [Given(@"I have entered (.*) and (.*) into the calculator")]
        public void GivenIHaveEnteredIntoTheCalculator(int a1, int b1)
        {
            a = a1;
            b = b1;

        }

        [When(@"I press add")]
        public void WhenIPressAdd()
        {
            c = a + b;
        }

        [When(@"I press subtract")]
        public void WhenIPressSubtract()
        {
            c = a - b;
        }


        [Then(@"the result should be (.*) on the screen")]
        public void ThenTheResultShouldBeOnTheScreen(int cc)
        {
            Assert.AreEqual(c, cc, "Sorry Not Equal.");
        }
    }
}
