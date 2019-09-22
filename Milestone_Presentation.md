Data Science Capstone: Final Project on Text Prediction
========================================================
author: Kehinde Usman
date: September 22, 2019
autosize: true

Project Overview
========================================================
type: sub-section
The goal of this project is to create a product using a prediction algorithm that predict the next word of a phrase or multiple words and provide an interface where users can input a phrase or multiple words in a text box inputs and outputs a prediction of the next word.

Explanation
========================================================
type: sub-section
The algorithm used to make the prediction of the next word is the Katz's     back-off model.

Katz back-off is a generative n-gram language model that estimates the     conditional probability of a word given its history in the n-gram. 

It accomplishes this estimation by backing off through progressively shorter history models.

In this project, quadgram is first used to find the next word, if not found, then trigram, then bigram, then the word with the highest frequency is used.

How it works
========================================================
type: sub-section
<img src="img.png"></img>

Links
========================================================
type: sub-section
The application link on github:
<https://github.com/Slemmykennis/Data-Science-Capstone-on-Text-Prediction>.

The application link on Shinyapps:
<https://slemmykennis.shinyapps.io/TextMining/>.
