# flapp


Flapp is an app building tool for Flutter.
This is still a work in progress. Once I believe that the core code is stable I'll publish this, but currently usage requires cloning this repo

[slidy](https://github.com/Flutterando/slidy)<br />
[json model](https://github.com/flutterchina/json_model)<br />
[json to dart](https://github.com/javiercbk/json_to_dart)<br/>
[functional_widget](https://github.com/rrousselGit/functional_widget)<br/>
<br />
Additional Resources
<br/>
    Sites:<br/> 
[flutterx](https://flutterx.com/) and [itsallwidgets](https://itsallwidgets.com/) by [hillel Coren](https://twitter.com/hillelcorenbr), [Scott Stoll](https://twitter.com/scottstoll2017),  [Simon Lightfoot](https://twitter.com/devangelslondon), and  [Thomas Burkhart](https://twitter.com/ThomasBurkhartB)<br/>
[flutter-widget-livebook](https://flutter-widget-livebook.blankapp.org/basics/introduction/)<br/>
[fidev](https://fidev.io/)<br/>
[Coding With Flutter](https://codingwithflutter.com/)<br/>
[Flutter Crash Course](http://fluttercrashcourse.com/)<br/>
[Code Magic](https://codemagic.io/start/)<br/>
[Widget Maker](https://norbert515.github.io/widget_maker/website/)<br/>
[2dimensions](https://www.2dimensions.com/)<br/>
[embed-new-flutter](https://dartpad.dev/experimental/embed-new-flutter.html?id=fbd01e9700bd19af3c71dafa0fbb454b&split=50)<br/>
<br/><br/>
**Getting Started**:<br/>
[i-want-to-learn-flutter-how-to-start](https://medium.com/flutter-community/i-want-to-learn-flutter-how-to-start-ffb4145f9b26) by [Pooja Bhaumik](https://twitter.com/pblead26)<br/>
[FlutterBasicWidgets](https://github.com/PoojaB26/FlutterBasicWidgets) by [Pooja Bhaumik](https://twitter.com/pblead26)<br/>
[flutter_starter_kit](https://github.com/KingWu/flutter_starter_kit) by [King Wu](https://in-techlab.com/)<br/>
<br/>
**Aggregated Resources**:
[my-favourite-list-of-flutter-resources](https://medium.com/coding-with-flutter/my-favourite-list-of-flutter-resources-523adc611cbe)<br/>
[AwesomeFlutterPlaylist](https://github.com/PoojaB26/AwesomeFlutterPlaylist) by [Pooja Bhaumik](https://twitter.com/pblead26)<br/>
[awesome-flutter-packages](https://github.com/leisim/awesome-flutter-packages) by [Simon Leier](https://github.com/leisim)<br/>
[awesome-flutter](https://github.com/Solido/awesome-flutter) by [Robert Felker](https://twitter.com/BlueAquilae)<br/>
[Flutter-UI-Kit](https://github.com/iampawan/Flutter-UI-Kit)<br/>
<br/>
**Youtube Accounts**:
<br/>
[Matt Carroll aka Fluttery](https://www.youtube.com/channel/UCtWyVkPpb8An90SNDTNF0Pg)<br/>
[Andrea Bizzotto](https://www.youtube.com/channel/UCrTnsT4OYZ53l0QGKqLeD5Q)<br/>
[RobertBrunhage](https://www.youtube.com/c/RobertBrunhage)<br/>
[Tensor Programming](https://www.youtube.com/channel/UCYqCZOwHbnPwyjawKfE21wg)<br/>
[Dash to Dartlang](https://www.youtube.com/channel/UCUBew2LtPopX2ZQlsal0hqw/videos)<br/>
[Samarth Agarwal](https://www.youtube.com/channel/UCDXWrSUyXN47WOF0Ih5AjIg)<br/>
[Raja Yogan](https://www.youtube.com/channel/UCjBxAm226XZvgrkO-JyjJgQ)<br/>
[Kodeversitas](https://www.youtube.com/channel/UC8NPPg1T8DUQWbB5UFkpxgg)<br/>
[FlutterCrashCourse](https://www.youtube.com/FlutterCrashCourse)<br/>
  
Code Generation powered by dart's [build](https://github.com/dart-lang/build) library


# Purpose 

The goal of this project is to:<br />
    1. Minimize the time required to go from idea to working app<br />
    2. Reduce the complexity of dealing with state and data management<br />
    3. Maximizing the time that can be spent on the fun stuff like building UI and iterating idea.<br />
    4. Help new developers to get started and understand how Flutter works<br />
    5. Provide a platform that allows for people to share and use each others custom widgets(**Long Term Goal**)<br />

This Project Aims To:<br/>
    1. Automate code required to retrieve, add, update and delete data from common sources(local SQLite, Firebase, Popular APIs, Google Services like maps etc)<br />
    2. Provide a simple to understand project structure<br />
    3. Allow interchangability and rapid changes of structural components of app <br />
    4. Minimize issues with 'breaking changes' in flutter codebase or supported plugin and package code by updating templating library and providing instructions on how to update your project code<br />

<br />
This Project Does Not Aim To:<br/>
    1. Create production ready apps.<br />
    2. Optomize app performance<br />
    3. Maximize features and options<br />


# Usage

1. Clone this project <br />
2. Create new flutter project<br />
3. Add package to pubspec.yaml //TODO add code snippet<br />
4. Create a file called jsons in the top level folder<br />
5. Create app.json file in jsons folder<br />
6. Build json using template below<br />
7. update pubspec.yaml with new packages<br />

**Json Template**

Template structure below
look in examples>gre_vocab>jsons>app.json for real example<br/>
Denotations:<br/>
**@____@**- what you are required to fill in..
    ex "@appname@" => "example_app"<br />
**%(____)%** - list of options to chose from ..
    ex.[%('blue', 'red', 'pink', 'black')%] = > ['blue', 'red']<br />
**[, ...]** - option to add more..
    ex params:{ "param1":{"type":"String"}[, ...]}<br />



```
{
    "AppName": ,
    "models": {
        "@modelName@" :{
            "sourceTypes": [%("localdb", "jsonData")%],
            "assetName":"@modelName@",
            "params": {
                params:{ 
                    "param1":{"type":%("String", "List<String>", "bool", "int", "float")%}
                    [, ...]
                } 
            },
            "screens":{
                "%("screen", "list_screen")%":{}
                [, ...]
            },
            "components":{
                "%("screen", "list_screen")%":{}
                [, ...]
            }
        }
}
```

# Overview
The generated code is in a modified Model-View-Controller(MVC) layout. <br/>
It is split into 4 main parts:<br/>

1. **The Data Controller** - This part is in charge of connecting the source of the data(local db, cloud etc) to data models that are used by the app<br />
2. **Data Models** - These contain all of the information about the data<br />
3. **Views** - Everything that is observable by user is either a screen or component in this structure. All views are hierarchical in that they can consist of viewa(widgets) nested inside of them, and for this structure, the screens always and only are the root of the widget tree created by the state controller and presented by the MyHomePage widget in the main page<br />
4. **State Controller** - The 'brain' of the app that controls what screen is shown and what data goes where.<br />


# Current Features
    - Local Database




