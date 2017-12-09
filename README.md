# 330_project3


## Flashcards

The Flashcards tab shows the titles of decks of flashcards and their number of cards in a table view. This is analogous to decks of physical flashcards dedicated to different subjects. The initial screen provides an Edit button that allows the user to delete a deck and an add button (represented with a + symbol, which is familiar for iOS users as this symbol is used throughout the OS) that allows the user to add a new deck.

When the user adds a new deck, the app prompts the user to give it a title. Once the user has typed the title and tapped the Enter button, the app automatically segues into a new view. This is an empty table view, since there are initially no cards in the deck. This view can also be accessed by tapping on an existing deck from the table view on the first screen and the table view is populated by the cards in that deck. In this view, there is a toolbar with a standard Edit and Add (+) button that allows flashcards to be deleted or added as well as a Rename Deck button that provides an alert with a text field so that the user can enter a name. There is a Quiz button at the top of the navigation bar that allows the user to view the flashcards individually one side at a time.

When a user adds a new card to a deck or taps on an existing card in the table view to edit its contents, Boost segues into a new view where the user can input text for the front and back of the flashcard. This view provides a text field for the front side and a text view for the back side. A text field is convenient for short input that doesn't extend beyond one line while a text view is capable of displaying large amounts of texts and allows scrolling. Typically, a user will have a key concept or vocabulary word as the front side and longer text, such as a definition, on the back side. When editing an existing flashcard, previously stored text will populate these input areas. The user has the option to cancel or save the flashcard. Both of these options bring the user back to the previous view.

The Quiz feature begins by shuffling the flashcards in the deck and displaying the front of the first card. The shuffle method used is imported from Apple's GameKit, a resource available in the iOS SDK without additional overhead. The deck retains the same ordering of cards throughout the quiz and repeats from the beginning once every card has been displayed. The navigation bar has a Flip button that changes the side of the card that is displayed, just as if a physical flashcard was flipped. Alternatively, the user can tap the area where the text is displayed to get the same behavior. At the bottom is a toolbar with a Remove From Quiz and Next button. The Next button displays the front of the next flashcard in the shuffled deck. The Remove From Quiz button removes the current displayed card from the deck for the duration of the quiz so that it will not be repeated. This is equivalent to setting aside a physical flashcard once the information on it is already known.


## To-Do List

The To-Do List tab displays an empty table view list with the "To-Do List" title at the top, an edit button placed at the top left corner, and the "+" button at the top right corner. 

The "+" button allows the user to create a new to-do list item. The user will be prompted to input a title for this item and be able to save it to the list. From the current list view the user is able to click on the to-do list item to place a blue check in the row, marking it as completed. The user is able to delete the item by swiping left and then tapping the red delete tab that will appear in the row. 

The edit button allows the user to also delete to-do list items and be able to rearrange the list in which ever order they see fit.
