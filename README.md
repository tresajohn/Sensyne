# Sensyne

Version Of Xcode used : 11.3.1
Swift : 5

Open Sensyne->Sensyne.xcworkspace

Select the simulator (Eg: Iphone 11)

cmd+B To build the app

cmd+Run to run the app in simulator


Sensyne
--------

Main page lists all the Organisation Name with Code and ID
There is a search bar to search for the OrganisationCode
Depending on the OrganisationCode selected the list gets filtered
If you click any of the hospital row/cell the details (i have mentioned just few important details at present. Can be modified as required or dynamically as per the list) gets displayed in another view controller.
Note:-
->You can click back button in the navigator from second screen to come back to mail screen.
->Click cancel button to cancel the search.


In case there is any issue with the library (SwiftCSV):
Go to terminal
cd <podfile location>
pod install or pod update
