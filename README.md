# Boost
Boost is a general, multipurpose app for iOS devices intended to boost productivity. Its main features include convenient access to the device's calendar, flashcards, notes, a study timer, and a to-do list.

## Install and Run
Clone or download the project and install Xcode 9.1 or later on a compatible Mac. Navigate into the top level Boost folder and open the Boost.xcodeproj file, which automatically loads the entire project into Xcode. The project is immediately ready to run on a simulator. To do so, choose any iOS device from the list of simulators at the top of the screen and press the run button. To run Boost on a physical device, you will need to set a development team and provisioning profile for the project. These instructions can be found at [Apple's developer site](https://developer.apple.com/library/content/documentation/IDEs/Conceptual/AppDistributionGuide/LaunchingYourApponDevices/LaunchingYourApponDevices.html).

## Features

### Flashcards

The Flashcards tab shows the titles of decks of flashcards and their number of cards in a table view. This is analogous to decks of physical flashcards dedicated to different subjects. The initial screen provides an Edit button that allows the user to delete a deck and an add button (represented with a + symbol, which is familiar for iOS users as this symbol is used throughout the OS) that allows the user to add a new deck.

When the user adds a new deck, the app prompts the user to give it a title. Once the user has typed the title and tapped the Enter button, the app automatically segues into a new view. This is an empty table view, since there are initially no cards in the deck. This view can also be accessed by tapping on an existing deck from the table view on the first screen and the table view is populated by the cards in that deck. In this view, there is a toolbar with a standard Edit and Add (+) button that allows flashcards to be deleted or added as well as a Rename Deck button that provides an alert with a text field so that the user can enter a name. There is a Quiz button at the top of the navigation bar that allows the user to view the flashcards individually one side at a time.

When a user adds a new card to a deck or taps on an existing card in the table view to edit its contents, Boost segues into a new view where the user can input text for the front and back of the flashcard. This view provides a text field for the front side and a text view for the back side. A text field is convenient for short input that doesn't extend beyond one line while a text view is capable of displaying large amounts of texts and allows scrolling. Typically, a user will have a key concept or vocabulary word as the front side and longer text, such as a definition, on the back side. When editing an existing flashcard, previously stored text will populate these input areas. The user has the option to cancel or save the flashcard. Both of these options bring the user back to the previous view.

The Quiz feature begins by shuffling the flashcards in the deck and displaying the front of the first card. The shuffle method used is imported from Apple's GameKit, a resource available in the iOS SDK without additional overhead. The deck retains the same ordering of cards throughout the quiz and repeats from the beginning once every card has been displayed. The navigation bar has a Flip button that changes the side of the card that is displayed, just as if a physical flashcard was flipped. Alternatively, the user can tap the area where the text is displayed to get the same behavior. At the bottom is a toolbar with a Remove From Quiz and Next button. The Next button displays the front of the next flashcard in the shuffled deck. The Remove From Quiz button removes the current displayed card from the deck for the duration of the quiz so that it will not be repeated. This is equivalent to setting aside a physical flashcard once the information on it is already known.


### Notes

The Notes section works as expected for any note taking app. Initially, the user is shown an empty table view with a Notes header. As expected, the top section is accompanied by the Edit button and a + Button.

Once the user selects the Add button (+), the user is able to create and save notes according to his needs. Since he will relly on this primarily to take notes for the classes he's enrolled, the User is able to save notes automatically once he's done typing. The keyboard display is automatically shown & hidden once the user is done with creating a new note and returns to the Note List.

The edit button allows the user to delete the items that he will not occupy in the future.


### Productivity Timer

Productivity timer displays two datepicker and a button to start the studying timer.

First datepicker is to set the study time and the other to set the break time.
Once start study button is tapped, a request is sent to the notification center to display a notification after the specified study time.

When this notification, let's call it get_break notification, is triggered it shows a study image, and 3 buttons 
	1. Go for break
	2. Extend study
	3. End session

When "Go for break" button is pressed then it sends a request to the notification center to trigger a notification after the specified break time.
When the notification, let's call it start_study notification , is triggered it shows another break image, and 3 buttons
	1. Go to study
	2. Extend break
	3. End session

When "Extend study" button is pressed then it sends a request to the notification center to trigger a notification after the specified break time. #note : study is extended for the break time only.
When this notification is triggered then it shows the same notification as that of get_break notification which send it's request.

When "Extend break" button is pressed then it sends a request to the notification center to trigger a notification after the specified break time. #note : break is extend for the break time.
When this notification is triggered then it shows the same notification as that of start_study notification which send it's request.

When "End session" button is pressed then it triggers the app to show up on screen. So that the user can start another timer.

If the app is in running state while the notification is triggered it will play a specific alarm.mp3 file.

If the app is in background or in closed state when notification is triggered then the iOS default notification tone is played.

### To-Do List

The To-Do List tab displays an empty table view list with the "To-Do List" title at the top, an edit button placed at the top left corner, and the "+" button at the top right corner. 

The "+" button allows the user to create a new to-do list item. The user will be prompted to input a title for this item and be able to save it to the list. From the current list view the user is able to click on the to-do list item to place a blue check in the row, marking it as completed. The user is able to delete the item by swiping left and then tapping the red delete tab that will appear in the row. 

The edit button allows the user to also delete to-do list items and be able to rearrange the list in which ever order they see fit.

### Calendar

Using Apple’s EventKit framework, users will be able to use the calendar feature to view and create calendars and events. 

Accessing the user’s calendars from the calendar database, the calendar feature will start by displaying any existing calendars on a table view. Clicking on an individual cell will take the user to a new view which allow them to view any events saved for that particular calendar. In the events table view users will be able to see the name of the event as well as the date in which that event will occur.  

Creating a new calendar or events is also very simple and the user can do this by clicking on the top right corner button that reads “Add Calendar”. From there a text box will appear, this will let the user name the calendar and save it in the database. Once the calendar has been successfully created and saved, the user now has the opportunity to create and add a new event to the calendar.

Adding an event is easy, all the user has to do is click on the calendar that they want to add the event to. If the calendar is new then it is likely that the user will be presented with an empty table view when they access the calendar. To add an event, the user will click on the top right corner button that reads “Add Event”. Clicking on that button will take the user to a new view which displays a text box and date pickers. With these tools, the user can name and pick a start and end date for the event, they can click the “Add Button” at the bottom to save and create the event onto the calendar.
