# Introduction to iOS Development
# Magic 8 Ball App Workshop

---
## Step 0: Create a new Xcode project

1. Open [this link](https://developer.apple.com/library/content/referencelibrary/GettingStarted/DevelopiOSAppsSwift/BuildABasicUI.html#//apple_ref/doc/uid/TP40015214-CH5-SW1) and scroll down to "Create a New Project" for detailed instructions and screenshots of the project creation process and information about using Xcode

1. Open Xcode and click "Create a new Xcode project" in the welcome window

1. In the dialog that appears, select "Single View Application"

1. On the next page, fill out the fields with the following information

    Product Name: `Magic8Ball`

    Team: None

    Organization Name: Your name or blank

    Organization Identifier: `com.<yourname>` e.g. `com.mayasaxena`

    Language: Swift

    Devices: Universal

    Use Core Data: Unselected

    Include Unit Tests: Unselected

    Include UI Tests: Unselected

1. Click "Next", and on the page that appears, select a folder to save your project in. Click "Create"

Congrats! You've just created a project in Xcode.

---
## Step 1: Model
1. Go to the left sidebar (navigator area) and navigate to `ViewController.swift`

1. Add an array called `responses` in the `ViewController` class

    Array initialization syntax example:
    ```Swift
    let groceries = ["Milk", "Eggs", "Bread"]
    ```

1. Populate it with the Magic 8 Ball responses given below:

    ```
    "It is certain",
    "It is decidedly so",
    "Without a doubt",
    "Yes definitely",
    "You may rely on it",
    "As I see it, yes",
    "Most likely",
    "Outlook good",
    "Yes",
    "Signs point to yes",
    "Reply hazy try again",
    "Ask again later",
    "Better not tell you now",
    "Cannot predict now",
    "Concentrate and ask again",
    "Don't count on it",
    "My reply is no",
    "My sources say no",
    "Outlook not so good",
    "Very doubtful"
    ```
---

## Step 2: View
1. Go to the left sidebar and navigate to `Main.storyboard`
    - Xcode opens this file in Interface Builder, its visual user interface editor. It allows you to build your UI visually by dragging and dropping in UI elements, rather than programmatically
    - `Main.storyboard` contains the main screen of the app. This app will only have one screen, but you can add multiple screens and connect them together here.
1. In bottom of the right sidebar, you should see a list of UI elements. Drag a label from that list onto the screen

1. Double click on the label and change its text to "Ask the Magic 8 Ball a question"

1. Drag another label onto the screen and center it. Change its text to "...". This will be the label that contains the Magic 8 Ball's answer

1. Right below "Label" in the UI element list is "Button". Drag a button onto the screen and change its text to "Shake". This is the button that will make the Magic 8 Ball give a new answer.

Now let's test out what we've built.

1. Go to the top left corner of Xcode. Click on the scheme (it will say iPhone 8 Plus or a different type of iPhone). Change it to iPhone 7.

    - We'll be running our apps in the Simulator instead of on an actual device. The Simulator, as the name implies, simulates actual devices and can run apps just like a real device would. It's very useful for giving an idea of what the app will look like on different types of devices.

1. Run the app by pressing the Play button in the top left corner of Xcode, or by using the keyboard shortcut `cmd + r`

    - When you hit the Run button, Xcode compiles the code you've written into an executable file that can be run on a device. Since we've selected to run in a Simulator, it will launch the Simulator and open the app there.

1. Take a look at the screen and press the button - nothing happens. That's because we've built our UI but haven't connected it to the controller yet.

---

## Step 3: Controller

If you're having issues following along, take a look [here](https://developer.apple.com/library/content/referencelibrary/GettingStarted/DevelopiOSAppsSwift/ConnectTheUIToCode.html#//apple_ref/doc/uid/TP40015214-CH22-SW1) for instructions on how to connect the UI elements

1. Click the button in the top right corner of Xcode that looks like two intersecting circles. This will open the assistant editor, that allows you to see two windows side by side.

    - If your screen doesn't have enough space, you can deselect all three buttons all the way in the top right corner of Xcode to collapse the sidebars and bottom bar. You can also click the sidebar icon at the bottom of the screen next to the "View As" button to collapse the outline view.

    - You should be able to see `Main.storyboard` and `ViewController.swift` side by side. It doesn't matter which side they are on.

1. In the storyboard window, hold down `ctrl`, click on the "..." label and drag your mouse across to the code editor window. Let go when the line above `viewDidLoad` is highlighted

1. In the dialog that appears, type `responseLabel` in the Name field and hit enter or click Connect
    - This creates an outlet or reference to the label in the code. Now we can modify that label

1. In `viewDidLoad`, under the line that says `super.viewDidLoad()`, add in the line below, then run the app

    ```
    responseLabel.text = "Hello"
    ```
    - The label should now say "Hello" instead of "..."

Now that we have access to the label, let's do the same for the button.

---

For the button, instead of adding in an outlet (identified by `@IBOutlet` in front of the property name), we'll add in an action handler function (identified by `@IBAction` in front of the function signature). We could add in an outlet for the button too, but since we don't need to modify the button itself, it'd be unnecessary.

1. Control-drag from the button to the code editor window. Let go when the line below the closing curly bracket of `didReceiveMemoryWarning` is highlighted

1. In the dialog that pops up, in the Connection dropdown, select Action

1. In the Name field, type `handleButtonPressed`. Leave the other fields the same, and hit enter or click Connect

    - The Event field should be pre-populated with Touch Up Inside. This is what iOS calls the button press event (the _touch_ on the button has lifted _up_ _inside_ the button's bounds)

    - This creates a function in the code that is called when the button is pressed. Now we can add code inside the function to respond to the event.

1. In `handleButtonPressed`, add in the line below, then run the app

    ```
    responseLabel.text = "World"
    ```
1. When the "Shake" button is pressed, the response label text should change from "Hello" to "World"

Now we've completely connected the view and the controller. What's missing is the connection to the model.

---

To connect the model, the first thing we need is the ability to pick a random response from the list. We'll do that by generating a random number in the range of the response list, and get the entry in the response list at that index.

1. In `handleButtonPressed`, above the line where we set the `responseLabel`'s text, add in the line of code given below:

    ```
    let randomIndex = Int(arc4random_uniform(UInt32(responses.count)))
    ```

    This creates a random Int in the range from 0 to the length of the responses array minus 1 (because array indexing starts at 0). We'll use that to get our Magic 8 Ball response.

1. Below the `randomIndex` line, add this line:

    ```
    let randomResponse = responses[randomIndex]
    ```
    This creates a `String` containing the response at the random index we generated

1. Modify the `responseLabel.text` line to set the text equal to `randomResponse` instead of `"World"`

1. Run the app and press the Shake button. The response label text should change from "Hello" to one of the responses. But there are a few issues

    - We don't want the app to say "Hello" before you press a button, we want it to say "...".
        - To fix this, remove the line `responseLabel.text = "Hello"` from `viewDidLoad`. That was for debugging purposes and we don't need it anymore

    - Some of the responses are cut off or truncated. This is because the label in Interface Builder is sized to only fit "...".
        - To fix this, go back to `Main.storyboard` and increase the frame of the label to be almost as wide as the screen.

1. Run the app again after fixing the issues

### Congrats! You've built a functioning iOS app using MVC!

## Next Steps

Now that your base app is built, think about ways you could expand it.

One easy and fun feature to implement is making the response change when the phone is shaken, just like a real Magic 8 Ball. Take a look at the `intermediate` branch in the [example code Github repository](https://github.com/mayasaxena/intro-ios-workshop) for some ideas on how to do that.

You could also add a text field for the user's question, or images, or animations. It's all up to you!
