# Software Requirements Specification

# for

# Boost

Version 1.0

Prepared by Noel Castillo, Chris Huang, Kelly Herron, Jorge Ramierz,
Raed Aluofi.

COMP 330 Software Engineering

November 3, 2017

## Table of Contents

### 1.Introduction

1.1 Purpose 

1.2 Document Conventions 

1.3 Intended Audience and Reading Suggestions

1.4 Product Scope 

1.5 References

### 2.Overall Description

2.1 Product Perspective  

2.2 Product Functions  

2.3 User Classes and Characteristics  

2.4 Operating Environment  

2.5 Design and Implementation Constraints  

2.6 User Documentation  

2.7 Assumptions and Dependencies  

### 3.External Interface Requirements

3.1 User Interfaces  

3.2 Hardware Interfaces  

3.3 Software Interfaces  

### 4.System Features

4.1 Google Calendar Integration

4.2  Productivity Reminder/ Break Timer

4.3 Notes

4.4 Flashcard Creator

4.5 To-Do list

### 5.Other Nonfunctional Requirements

5.1 Performance Requirements  

5.2 Safety/Security Requirements  

5.3 Software Quality Attributes  

### Appendix: Progress as of November 20, 2017

## 1.Introduction

### 1.1 Purpose

This document was written to provide an understanding of the
software requirements for the mobile application known as Boost. The information 
is split into sections and will elaborate on how the app will operate, 
the advantages of its functions, and the apps non-functional requirements.

### 1.2 Document Conventions

This document is written using Markdown syntax. All headers are in atx-style, using one hash mark (#) to declare the title of the proposal, two hash marks to indicate the main header of a section, three hash marks represent the subsection of the main header, and four hashes represents bolded words. Each main header illustrates a main idea and the paragraphs in the subsections will help elaborate on that idea.    

### 1.3 Intended Audience and Reading Suggestions

This document is written for two groups, a development team and the users. Development teams will be able to read this document and understand the implementation of the app. Ultimately, it is a guide, which will help them understand the apps main purpose and allow them to build upon it.
This document is written to help users understand what Boost is and how it will run. It is a guide intended to help them comprehend how each function will work and how it will benefit them. This document also serves as a resource which will help users navigate through the app. 

### 1.4 Product Scope

Through primary research, we found that a large portion of students already use apps such as calendars, notes, and to-do list, but they also expressed that it was an inconvenience for them to have to use so many apps. Boost is an iOS application designed to primarily tackle this problem and help students stay organized throughout their academic year all while using one app. The app is essentially a set of tools, such as a calendar, a note pad, flashcards, productivity timer, and a to-do list. With Boost, students can obtain organization without the hassle or worry of having to use multiple apps. 

Through Secondary research, our developing team also found that students who are organized are much more likely to obtain better grades. Boost is designed to be a convenient app for users to easily access and organize all their tasks. Boost is intended to be easily navigated in order to encourage organization and make it fun.

Boost is an app that will help users stay on track of their work. It will not allow users to share their information. If a user would like to send their friends or colleagues a file of their notes or flashcards, they will not be able to do so. Unable to share notes or task may be a small inconvenience as some users may find it helpful to read others class notes. Boost unfortunately will not let users share info because it is only concerned with helping the user of the app stay on track of their tasks. 

1.  Potential User \#1: Brad A. MacDonald
    [*-bmacdonald@luc.edu*](mailto:-bmacdonald@luc.edu)

    1.  Student at Loyola University majoring in History and Secondary Education.

    2.  Would like to see an app that syncs my to do list with my calendar.

    3.  Knows peers that have difficulty with study habits, remembering dates, and time management.

    4.  They would like to see an app that combines all of these assets (calendar, to-do, flashcards, and productivity reminder) into one.

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

### 1.5 References

Cheng, Victoria. “Better Organization, Better Grades.” Boston.com, The Boston Globe, 6 Jan. 2008, archive.boston.com/news/local/articles/2008/01/06/better_organization_better_grades/.

## 2. Overall Description

### 2.1 Product Perspective

The product developed will provide a general/multipurpose productivity app for students that allow the user to simply take notes in different subjects, create study cards for tests, and study efficiently with the app’s productivity watch. This system is not a replacement of any existing systems, it is rather a system that provides students with the tools they need to succeed in one app. The goal is to provide a system where students can get stuff done more efficiently. Rather than having to go through all the trouble of downloading 4 to 6 separate apps, users will save time by downloading only one app. This will also help with organization as users will have all their information and content under one app rather than scattered in different apps.

### 2.2 Product Functions

The main tasks the system will perform are:

o Calendar for due dates and events

o Productivity timer

o Note taking functionality

o To-do lists

o Create flashcards 

### 2.3 User Classes and Characteristics

There will be one category of users in our product:
                                                                                        
o Student User: The app is tailored to help students with time management and boost productivity when working on                               assignments or studying for exams. 

### 2.4 Operating Environment

The system will be compatible with iOS 11.1.1 for now, in the future we hope to extend it to Android 8.0 


### 2.5 Design and Implementation Constraints

The application is constrained by internet connection. The user will be limited on syncing the events and due dates with the mobile calendar. Also, the user will not be able to share the app's flashcards, notes, and events with anyone else unless the device is connected with the internet. (We hope to find a way that will allow users to use all the features in the app while they are limited with internet access) However, the user will be able to write notes, study for exams and quizzes with the flashcards feature, and study productively with the smart productivity timer when they are not connected with the internet.
The Boost system will be coded in the Swift programming language which is another constraint because it will only be available for iOS devices.


### 2.6 User Documentation

The Boost system shall provide an integrated help system that describes the rules of the system, and illustrates all system functions. The Boost system shall provide this information in the time of downloading the app. This documentation will include in-app tutorials and help documents referenceable through user interface.

### 2.7 Assumptions and Dependencies

o One dependency is that the product will be exclusively used on an iOS device since the product will be built as a native iOS application. 

o One assumption is the internet connectivity. The user will not be able to sync all the notes and the calendar events because there is no internet connection.


## 3. External Interface Requirements

### 3.1 User Interfaces

The app’s main navigation will be a tab bar based. The items on the tab
bar will be the calendar, timer, notes, and to-do lists.

#### Calendar
The calendar tab will display a calendar, defaulting to the current
month, and allow the user to add an event or due date reminder. When
editing or adding an item to the calendar, the user will be able to set
notifications if desired.

#### Timer
The timer tab will display three sliders for the user: duration,
productive interval, and break interval. A start button will be
displayed and once it is pressed, a sound alerting the start of
productive time will play. Once the productive interval is up, a sound
alerting the start of a break will play and the process will repeat
until the selected duration is completed.

#### Notes
The notes will allow a user to view the list of notes already saved and
include a button for editing and adding additional notes. There will be
two different types of notes: regular and quiz. The regular notes will
allow a user to record information. The quiz notes will support
displaying some information, such as a definition, and hiding other
information, such as a vocabulary word.

#### To-Do
The to-do lists will allow a user to check off tasks. The user can add a
list of related tasks and set automatic reminders for the next task a
set amount of time after each item is completed.

(These are still preliminary ideas and may change throughout the
development process)

### 3.2 Hardware Interfaces
The app will be built as a native iOS application and will require an
iOS device.

### 3.3 Software Interfaces

The application will use the iOS SDK to enable system services such as
notifications.

## 4. System Features (Functional Requirements)

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

### 4.1 Google Calendar Integration

The user will be able to create events relative to the due dates of
their assignments, tests dates, and other events. They will also be able
to integrate their own events into this calendar. The calendar
functionality will be within its own home screen, which is navigated to
from the standard bottom bar. The calendar view will, by default, be
displayed in monthly view, but can easily be set to display weekly and
daily views as well.

### 4.2  Productivity Reminder/ Break Timer

After a set amount of time, the application will push a notification to
the user that it is time to take a short break. The user is able to set
the interval time for when the app will send the notification and set
the duration of the break. This will be handled in its own respective
screen with values ranging from minutes to hours. This high priority
function is in-place to boost user productivity when working on tasks
for school.

### 4.3 Notes

The note taking functionality will allow users to create, edit, and
organize notes. The user will be able to search for certain notes by
keyword, topics, and mentions. The notes will be organized by class, for
easy accessibility. The notes will be displayed on its own screen, which
will be able to be accessed by the an icon on the bottom bar.

### 4.4 Flashcard Creator

Similar to Quizlet, the application will allow the user to build
flashcards from the notes they created. The user will also be able to
use their created flashcard sets to study material efficiently. The
flashcard functionality will be combined with the notes screen,
essentially, flashcards will be two-sided notes.

### 4.5 To-Do list

This functionality will be similar to that of Basecamp. The user will
have the option to create a list of to-do’s, which in theory is just a
check list. This list will be on its own respective page as well and
send notifications to the user that the due date is approaching. Once
the set due date has passed, the specific to-do will be labeled “late”
and highlighted in red.

## Other Nonfunctional Requirements

### 5.1 Performance Requirements:

Trusting the instincts, we decided to implement a very friendly
interface that will allow to user to reach the feature he wants with 5
or less taps. Focusing on simple yet
effective, our application should have very minimal time delays for
displaying and outputting data. After verifying user authentication, our
application should automatically be synched with the calendar in order
to display the relevant event, tasks and notifications from the account.

Since we are adhering to the native SDK, our power consumption and memory
should be regulated by the phone's OS and should not give any abnormal errors.
Memory should not be a problem for the user, as our app is focused so as not to
use any other resources it does not actually need in its features.

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

### 5.2 Security & Safety Requirements:

The user information that is shared to us will be saved, stored and
protected on the server. It is very important for us to protect the
information that is shared, but it is utterly important the user’s
personal information is safely stored.
The user can select their verification or account retrieval options. As
a default, all the information is considered private unless the user
specifies to generate a sharable link (or something similar).

### 5.3 Software Quality Attributes:

#### Availability: 
The application should be ready to operate at all
times. Even if the internet connection is faulty, the user should still
be able to access and view his data. The user is able to view his notes
even when working online and the notifications should run fine.

#### Adaptability: 
the majority of the features are intuitive, and it is
highly likely our users are familiar with other applications that share
the same features so for the most part our users familiar with the
features. The only thing the user would need to regulate personally would
be the time between break/study sessions.

#### Flexibility: 
allows the user to adjust his study/ break intervals.
Should work online and offline.

#### Testability: 
we will use our fellow classmates as a small, but
testable group of subjects. Testing for the most basic errors such as:
saving an empty note, saving when offline, etc.

#### Usability: 
our app should be intuitive and as such would take little
for the user to get accustomed to. The user should experience no problem
displaying and saving information. A person without previous knowledge should
be able to use/navigate the app and be able to familiarize themselves with the
features fairly quickly.

## Appendix: Progress as of November 20, 2017

### Flashcards
Most of the basic functionality for creating and editing flashcard objects is complete. Persisting data currently only works from the list of flashcard decks. What is remaining is to persist data at every place where the data can be edited, such as when adding, editing, or deleting flashcards from a deck, in order to minimize unexpected data loss between app launches. The ability to quiz a user by displaying one side of a flashcard at a time has yet to be implemented. The flashcards feature is about 80% complete.
