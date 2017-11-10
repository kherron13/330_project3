**Software Requirements Specification**

**for**

**Boost**

Version 1.0

Prepared by Noel Castillo, Chris Huang, Kelly Herron, Jorge Ramierz,
Raed Aluofi.

COMP 330 Software Engineering

November 3, 2017

**Table of Contents**

**Table** **of** **Contents**

**Introduction**

1.1 Purpose 

1.2 Document Conventions 

1.3 Intended Audience and Reading Suggestions

1.4 Product Scope 

1.5 References

**Overall** **Description**

2.1 Product Perspective  

2.2 Product Functions  

2.3 User Classes and Characteristics  

2.4 Operating Environment  

2.5 Design and Implementation Constraints  

2.6 User Documentation  

2.7 Assumptions and Dependencies  

**External** **Interface** **Requirements**

3.1 User Interfaces  

3.2 Hardware Interfaces  

3.3 Software Interfaces  

**System** **Features**

4.1 Google Calendar Integration

4.2  Productivity Reminder/ Break Timer

4.3 Notes

4.4 Flashcard Creator

4.5 To-Do list

**Other** **Nonfunctional** **Requirements**

5.1 Performance Requirements  

5.2 Safety/Security Requirements  

5.3 Software Quality Attributes  

**Appendix:** **Analysis** **Models**

A.1 Use Case Diagram 

A.2 UML Class Diagram

**1.Introduction**

**1.1 Purpose**

This document was written to provide an understanding of the
software requirements for the mobile application known as Boost. The information 
is split into sections and will elaborate on how the app will operate, 
the advantages of its functions, and the apps non-functional requirements. Ultimately, 
this document is a resource to help users understand the benefits of the app 
and guide developing teams build upon this project.

**1.2 Document Conventions**

The document will use Times New Roman font for all text. The Section
headings found in this document will be in numerical order composed in
18pt font. Subsection headings will be in 14pt bold font, and they will
be ordered numerically as subsections of the main heading. The bodies of
the subsections will be composed from 12pt font, and will explain in
detail each subsection.

**1.3 Intended Audience and Reading Suggestions**

This document is written to target two groups, a development team and a
client based group.

-   *Development team*: This document is written to help development
    > teams or individuals, who want to build upon this project,
    > understand how the app works. It is a guide that will help
    > explain, step by step, the apps functionality and implementations.

-   *Clients*: This document will explain how the user can use the app
    > and why it will have a positive impact on those who use it. This
    > document splits some of the functionality details to show how each
    > function will specifically benefit those who use the app as
    > a resource.

**1.4 Product Scope**

Boost is a IOS application. The app is designed to primarily help
students throughout their academic year plan and organize their work.
Its primary function is to allow users to access a calendar in which
they can mark down important events that are coming up on their
schedule. The main purpose of this function is to provide the user with
some organization resource that will help remind them of due dates,
tests dates, and other events. The second function will work as a
notification reminder which will alert user to take a break from their
activity and move around. This function will help user increase
productivity as taking breaks can help reduce stress (Dimeo, F., et al.
114). Third function will work as a note taking resource which will
allow user to stay organized with their class notes. Fourth function is
a flash card study tool which will allow user to save money, time and
trees as they won't have to go out and buy flashcards to study for their
next exam. Last function is a to do list which will work as another
organization resource that will help student keep on track of what is
due. Scope and features for software determined by: (1) development
team, (2) application design, feature assessment, and suggestions by
potential users through development-team-created online survey, (3) use
cases developed with potential user input.

1.  Potential User \#1: Brad A. MacDonald
    [*-bmacdonald@luc.edu*](mailto:-bmacdonald@luc.edu)

    1.  Student at Loyola University majoring in History and
        > Secondary Education.

    2.  Would like to see an app that syncs my to do list with
        > my calendar.

    3.  Knows peers that have difficulty with study habits, remembering
        > dates, and time management.

    4.  They would like to see an app that combines all of these assets
        > (calendar, to-do, flashcards, and productivity reminder)
        >  into one.

<!-- -->

1.  Potential User \#2: Juana Y. Fonseca-
    [*jfonsecal@luc.edu*](mailto:jfonsecal@luc.edu)

    1.  Student at Loyola University majoring in Biology Pre-Med.

    2.  Would like to start using her calendar more and trying new
        methods of studying such as digital flashcards.

    3.  Knows that her friends struggle with time management and would
        like to have a tool to help them stay focused and organized.

<!-- -->

1.  Potential User \#3: Emily Phillips-
    [*ephillips5@luc.edu*](mailto:ephillips5@luc.edu)

    1.  Student at Loyola University majoring in computer science
        and mathematics.

    2.  Would like to see an app that increases productivity and can be
        a tool to maintain academic success.

    3.  Would like to have a to do list, calendar, and flash cards
        combined into one singular hub.

**1.5 References**

Dimeo, F., et al. "Benefits from aerobic exercise in patients with major
depression: a pilot study." *British journal of sports medicine*35.2
(2001): 114-117.

**2. Overall Description**

**2.1 Product Perspective**

The product developed will provide a general/multipurpose productivity app for students that allow the user to simply take notes in different subjects, create study cards for tests, and study efficiently with the app’s productivity watch. This system is not a replacement of any existing systems, it is rather a system that provides students with the tools they need to succeed in one app. The goal is to provide a system where students can get stuff done more efficiently. Rather than having to go through all the trouble of downloading 4 to 6 separate apps, users will save time by downloading only one app. This will also help with organization as users will have all their information and content under one app rather than scattered in different apps.

**2.2 Product Functions**

The main tasks the system will perform are to:

o   Due dates reminder

o   Productivity timer

o   Event Calendar

o   Note Taking Functionality

o   To-do lists

1.   The productivity timer will be used to increase overall
    productivity with interval breaks. Our To-dos can allow you to set
    notifications for the next To-do for some time after finishing the
    previous To-do

<!-- -->

1.  User sets timer which allows for
    breaks between different subjects.

o   Create notecards from the notes.

1.  Like Quizlet, the application will allow the user to build
    flashcards from the notes they created. The user will also be able
    to use their created flashcard sets to study material efficiently.

**2.3 User Classes and Characteristics**

There will be two categories of users in our product:

| **User**         | **Characteristics**                                                                                                        |
|------------------|----------------------------------------------------------------------------------------------------------------------------|
| Student User:   | The app is tailored to help students with time management and boost productivity when working on assignments or studying for exams. |

**2.4 Operating Environment**

OE-1 The system shall be compatible with:
| **Environment**           | **Standards** |
|---------------------------|---------------|
| Mobile Operating System:  | iOS           |

**2.5 Design and Implementation Constraints**

Boost system shall be coded in the Swift programming language.

The Boost system shall be completed by Monday Dec 4th as of the deadline set by Professor Thiruvathukal.

**2.6 User Documentation**

The Boost system shall provide an integrated help system that describes the rules of the system, and illustrates all system functions. The Boost system shall provide this information in the time of downloading the app. This documentation will include in-app tutorials and help documents referenceable through user interface.

**2.7 Assumptions and Dependencies**

The dependencies in the product: First, it will be built as a native iOS application and will require an iOS device. Second, if there is no internet connection it will be difficult to use all the features in the product. For example, the user will not be able to synch all the notes and the calendar events because there is no internet connection.

**3. External Interface Requirements**

**3.1 User Interfaces**

The app’s main navigation will be a tab bar based. The items on the tab
bar will be the calendar, timer, notes, and to-do lists.

The calendar tab will display a calendar, defaulting to the current
month, and allow the user to add an event or due date reminder. When
editing or adding an item to the calendar, the user will be able to set
notifications if desired.

The timer tab will display three sliders for the user: duration,
productive interval, and break interval. A start button will be
displayed and once it is pressed, a sound alerting the start of
productive time will play. Once the productive interval is up, a sound
alerting the start of a break will play and the process will repeat
until the selected duration is completed.

The notes will allow a user to view the list of notes already saved and
include a button for editing and adding additional notes. There will be
two different types of notes: regular and quiz. The regular notes will
allow a user to record information. The quiz notes will support
displaying some information, such as a definition, and hiding other
information, such as a vocabulary word.

The to-do lists will allow a user to check off tasks. The user can add a
list of related tasks and set automatic reminders for the next task a
set amount of time after each item is completed.

(These are still preliminary ideas and may change throughout the
development process)

**3.2 Hardware Interfaces**

The app will be built as a native iOS application and will require an
iOS device.

**3.3 Software Interfaces**

The application will use the iOS SDK to enable system services such as
notifications.

**4. System Features (Functional Requirements)**

Once users download the application, they will be prompted with a login
screen that allows the user to either choose to login with an existing
account or sign-up with any registered email account. After they have
signed in, the user will be taken to the home screen where the user will
be able to navigate throughout the app.

In this home screen, the user will be able to immediately start creating
notes for their classes. Their class notes will be scrollable lists,
where they can view each individual note. There will also be a standard
navigation bar at the bottom of the screen that will have four icons,
that will navigate to their each respective screen: the calendar screen,
to-do screen, notes screen and timer screen. There will also be a button
on the top right for application settings, where the user will be able
to adjust productivity timers and account settings.

**4.1 Google Calendar Integration**

The user will be able to create events relative to the due dates of
their assignments, tests dates, and other events. They will also be able
to integrate their own events into this calendar. The calendar
functionality will be within its own home screen, which is navigated to
from the standard bottom bar. The calendar view will, by default, be
displayed in monthly view, but can easily be set to display weekly and
daily views as well.

**4.2  Productivity Reminder/ Break Timer**

After a set amount of time, the application will push a notification to
the user that it is time to take a short break. The user is able to set
the interval time for when the app will send the notification and set
the duration of the break. This will be handled in its own respective
screen with values ranging from minutes to hours. This high priority
function is in-place to boost user productivity when working on tasks
for school.

**4.3 Notes**

The note taking functionality will allow users to create, edit, and
organize notes. The user will be able to search for certain notes by
keyword, topics, and mentions. The notes will be organized by class, for
easy accessibility. The notes will be displayed on its own screen, which
will be able to be accessed by the an icon on the bottom bar.

**4.4 Flashcard Creator**

Similar to Quizlet, the application will allow the user to build
flashcards from the notes they created. The user will also be able to
use their created flashcard sets to study material efficiently. The
flashcard functionality will be combined with the notes screen,
essentially, flashcards will be two-sided notes.

**4.5 To-Do list**

This functionality will be similar to that of Basecamp. The user will
have the option to create a list of to-do’s, which in theory is just a
check list. This list will be on it’s own respective page as well and
send notifications to the user that the due date is approaching. Once
the set due date has passed, the specific to-do will be labeled “late”
and highlighted in red.

**Other Nonfunctional Requirements**

**5.1 Performance Requirements:**

Trusting the instincts, we decided to implement a very friendly
interface that will allow to user to reach the feature he wants with *5
or less clicks* (verify with teammates). Focusing on simple yet
effective, our application should have very minimal time delays for
displaying and outputting data. After verifying user authentication, our
application should automatically be synched with the calendar in order
to display the relevant event, tasks and notifications from the account.

The interface of the app is fairly easy to navigate, so the user should
not have any problem when viewing, deleting or creating notes. The user
is then able to adjust the duration, productivity interval, and break
interval in order to facilitate working on school tasks. Our notes are
then classified in 2 categories: Regular or Quiz Notes. Quiz Notes
should be able to display a significant part of the notes, while
simultaneously hiding the rest of the information so as persuade the
user to fill the rest of the information from his knowledge in order to
prepare for test time. We decided on using something similar to the
Flashcard Generator on Quizlet.

The to do list should have no problem creating a list of tasks that need
to be checked off before their respective due date. The user should be
able to group related tasks, and to adjust the notifications between
each task. Since we decided on creating an iOS native app, we will then
follow Apple’s guidelines and policies for allowing applications to be
submitted and uploaded on their store. Link:
[*https://developer.apple.com/app-store/review/*](https://developer.apple.com/app-store/review/)

**5.2 Security & Safety Requirements:**

The user information that is shared to us will be saved, stored and
protected on the server. It is very important for us to protect the
information that is shared, but it is utterly important the user’s
personal information, such as financial information, is safely stored.
The user can select their verification or account retrieval options. As
a default, all the information is considered private unless the user
specifies to generate a sharable link (or something similar).

**5.3 Software Quality Attributes:**

**Availability:** The application should be ready to operate at all
times. Even if the internet connection is faulty, the user should still
be able to access and view his data.

**Adaptability:** the majority of the features are intuitive, and it is
highly likely our users are familiar with other applications that share
the same features so for the most part our users familiar with the
features.

**Flexibility:** allows the user to adjust his study/ break intervals.
Should work online and offline.

**Testability:** we will use our fellow classmates as a small, but
testable group of subjects.

**Usability:** our app should be intuitive and as such would take little
for the user to get accustomed to. The user should experience no problem
displaying and saving information.

**Appendix: Analysis Models**

Use Case image saved within the Images folder

**A.1 Use Case Diagram**

UML Diagram image saved within the Images folder
