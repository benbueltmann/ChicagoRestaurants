# ChicagoRestaurants (Should I Eat Here)
an app to list/filter Chicago restaurants by name

## Build and Runtime Requirements
+ Xcode 10.0 or later
+ iOS 12.0 or later
+ OS X v10.13 or later

## Getting Started

To launch the app in the iOS Simulator, simply open the "Should I Eat Here.xcodeproj" file with Xcode, choose the desired simulation device, and then select Product > Run or press Command-R to run the project. 

To launch the app on a compatible iOS device, connect the device, go through the process to allow your computer to connect to it if you have not done so previously, and then select the device where you would have chosen a simulated device as described previously. 

## About ChicagoRestaurants (Should I Eat Here)

Should I Eat Here is a project for iOS that allows the user to filter a list of restaurants in Chicago by searching, view a specific restaurant on a map, find out more information about the establishment, and see the details of their numerous health code violations.

Due to the fact that the criteria for inclusion in this API seems to correlate to these health code violations, I have chosen to display it more prominently than I would have if this were an app seeking to promote these businesses. 

The repository name of "ChicagoRestaurants" was chosen before I examined the data set in more depth, so after seeing some of the health concerns, I jokingly named the project "Should I Eat Here" and gave the main ViewController a heading of "Questionable Restaurants". 

Please forgive this mild attempt at humor. While I could have changed the repository name or the project name to match since I recognize it's better to keep those consistent, I decided to leave those intact due to Xcode's tendency to fail to handle such project name refactoring gracefully.

I hope you enjoy using this app, and that you'll think twice in the future about eating at any restaurants in the city of Chicago.

## Application Architecture

Should I Eat Here also follows the Model-View-Controller (MVC) design pattern and uses modern app development practices including Storyboards and Auto Layout. 

Each ViewController has a corresponding ViewController subclass. With the exception of MapViewController, they all inherit from TableViewController. The ViolationsTableViewController and the RestaurantsTableViewController both use dynamic cells, while the RestaurantDetailsViewController uses static cells.

The NetworkManager class handles creating the URLSession and providing the list of Restaurant objects on the main thread. Since the Restaurant object is Decodable, we're able to use the JSONDecoder to parse the JSON with considerably less overhead than JSONSerialization since the keys of the dataSet align nicely with Decodable properties.

The Restaurant model object class identifies the portions of the JSON data that the app will use, and converts the string values it decodes to a number of computed properties to simplify their use throughout the app. The health code violations are split into an array to calculate how many there are and so they can be displayed in separate tableViewCells.

For the purpose of this example, the data set was limited to the first thousand entries to focus on filtering that data with the search text. Some restaurants may appear twice but these duplicate entries reflect the data provided by the API. I've chosen not to hide duplicates since they refer to different inspections and violations. 

## Unit Tests

Should I Eat Here has one test which determines if a hard-coded portion of the raw JSON will decode smoothly into a Restaurant object. This test is in the Should I Eat HereTests group. To run the unit tests, hold the Run button down and select the "Test" option, or press Command+u to run the tests.

