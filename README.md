# MyHealthToday_Task

Implemented using flutter.


## Problem Statement - 

Design a web page with a front end technology of your choice (React, Angular, HTML5 etc,) that can present `n` number of Cat Facts. Where n is a input given by the user.


## Page Design - 

https://www.figma.com/file/65c4n2CFPuV59YkuVISjAn/Untitled?node-id=0%3A1   


## Page Specification - 

Cat Image - https://bestofmycat.com/wp-content/uploads/2019/08/cat-facts-800x445.png


## Input Text Box - 

The default text is ‘Enter Number of Facts you want’. When the user enters any number, the default text disappears and shows user input. 


## ‘Get Facts’ Button -

When the button is clicked, the page should make an API call to https://cat-fact.herokuapp.com/facts . 
You can find the full API specification here :https://alexwohlbruck.github.io/cat-facts/docs/endpoints/facts.html 

## Fact Cards - 

Based on the number in the input text box, show the facts returned by the API inside a card. Each row can have a maximum of 2 cards.
