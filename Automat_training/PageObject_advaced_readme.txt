
In a previous example we stepped through creating a simple Page Object to capture the behavior of a page we were interacting with. While this was a good start, it leaves a lot of room for improvement.

The most obvious problem is that there are common actions we will likely need across multiple Page Objects. And with our current approach we would end up with duplicative code.

And less obviously, we are using Selenium actions directly in the Page Object. While on the face of it this may seem fine it has some long term impacts like... + the inability to drive your tests with a different driver if needbe + test maintenance issues when Selenium actions change + slower test writing due to the lack of a Domain Specific Language (DSL)

With a Base Page Object (a.k.a. a facade layer) we can abstract all common actions into a central location and leverage them in any Page Object we see fit.

An Example
In this example we are going to take the code from our previous tip (Using a Page Object) and upgrade it to use a Base Page Object.

Everything stays the same in the beginning of our example. We include our libraries and wire up our setup, teardown, and run actions.

Next we create our Base Page Object. It's a simple Ruby class that our other Page Objects will inherit from.

At the top of it we set an attr_reader to store the Selenium driver object that gets passed to it through the initialize method. And the rest of the class is filled with a series of common Selenium actions that we pull from the GoogleSearch Page Object.

With the Base class in hand we simply update the GoogleSearch Page Object to inherit from it (with < Base after the class name) and wire it up and clean things up.

Since we have some actions we want to execute when we load the GoogleSearch object, we keep them in the initialize method. But since we are inheriting from the Base class we need to call super before them. This is responsible for passing the driver object into the Base class and making all of its methods run smoothly.

Expected Behavior
Load Google
Search for something
Wait for the first search result to render
Grab the text from it
Assert that the text we want is within it



