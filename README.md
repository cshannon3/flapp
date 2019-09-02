# flapp

A new Flutter package.



**Flapp is an app building tool for Flutter.**

 This is still a work in progress. Once I believe that the core code is stable I'll publish this, but currently usage requires cloning this repo

#Purpose 

The goal of this project is to:
    1. Minimize the time required to go from idea to working app
    2. Reduce the complexity of dealing with state and data management
    3. Maximizing the time that can be spent on the fun stuff like building UI and iterating idea.
    4. Help new developers to get started and understand how Flutter works
    5. Provide a platform that allows for people to share and use each others custom widgets(**Long Term Goal**)

This project aims to:
    1. Automate code required to retrieve, add, update and delete data from common sources(local SQLite, Firebase, Popular APIs, Google Services like maps etc)
    2. Provide a simple to understand project structure
    3. Allow interchangability and rapid changes of structural components of app 
    4. Minimize issues with 'breaking changes' in flutter codebase or supported plugin and package code by updating templating library and providing instructions on how to update your project code


This project does not aim to:
    1. Creating production ready apps.
    2. Optomizing app performance
    3. Maximizing features and options


#Usage

1. Clone this project 
2. Create new flutter project
3. Add package to pubspec.yaml //TODO add code snippet
4. Create a file called jsons in the top level folder
5. Create app.json file in jsons folder
6. Build json using template below
7. update pubspec.yaml with new packages

#Json Template

Template structure below
look in examples>gre_vocab>jsons>app.json for real example
Denotations:
*@____@ = what you are required to fill in
    ex "@appname@" => "example_app"
*%(____)% = list of options to chose from 
    ex.[%('blue', 'red', 'pink', 'black')%] = > ['blue', 'red']
*[, ...] = option to add more
    ex params:{ "param1":{"type":"String"}[, ...]}
*!EX=> "word"! = Example of exactly what to do
    ex "@modelName@" !EX=> "word"! 
*^^__^^ = note on specific usage requirements
    ex "@modelName@" !EX=> "word"! ^^model name should be lower case and use underscores if multiple words long^^

```
{
    "AppName": ,
    "models": {
        "@modelName@" !EX=> "word"! ^^model name should be lower case and use underscores if multiple words long^^
        : {
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
The generated code is in a modified Model-View-Controller(MVC) layout. 
It is split into 4 main parts:

1. The Data Controller - This part is in charge of connecting the source of the data(local db, cloud etc) to data models that are used by the app
2. Data Models - These contain all of the information about the data
3. Views - Everything that is observable by user is either a screen or component in this structure. All views are hierarchical in that they can consist of viewa(widgets) nested inside of them, and for this structure, the screens always and only are the root of the widget tree created by the state controller and presented by the MyHomePage widget in the main page
4. State Controller - The 'brain' of the app that controls what screen is shown and what data goes where.


# Current Features
    - Local Database




