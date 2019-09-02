# flapp

A new Flutter package.



**Flapp is an app building tool for Flutter.**

 This is still a work in progress. Once I believe that the core code is stable I'll publish this, but currently usage requires cloning this repo

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




