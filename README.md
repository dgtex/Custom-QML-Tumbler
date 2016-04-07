# Custom-QML-Tumbler

# Usage

It's pretty easy to use. Just copy qml in your project and create component with that name.

# Properties

    property var values: [0, 1, 2, 3, 4, 5] // Array of all possible values in tumbler
    property var value: 0 // Current selected value 
    property string suffix: "" // Suffix will be added to the end of each value
    property int itemHeight: 60 // Height of each item in tumbler
    property int textSize: 30 // Font size of text in item
    property string textColor: "#000000" // Color of text in item
    property string indicatorColor: "#FFFF66" // Border color which indicated current selected value
    property int indicatorSize: 5 // Size of indicator


