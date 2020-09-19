---  
title: eh_GJGameCredentials  
author: eh-jogos  
date: 2020-09-18T08:00:15-03:00  
summary:   
---  
**Inherits:** _[Resource](https://docs.godotengine.org/en/stable/classes/class_resource.html) > [Reference](https://docs.godotengine.org/en/stable/classes/class_reference.html) > [Object](https://docs.godotengine.org/en/stable/classes/class_object.html)_  
## Description  
 Just a basic struct to hold game credentials information and be able to save it in disk 
 as a Resource.
  
## Properties 
  
| type | property | default value |  
| ---- | -------- | ------------- |  
| [String](https://docs.godotengine.org/en/stable/classes/class_string.html) | [game_id]({{< ref "/reference/resources/credentials/eh_gjgamecredentials#game_id" >}}) |  |  
| [String](https://docs.godotengine.org/en/stable/classes/class_string.html) | [private_key]({{< ref "/reference/resources/credentials/eh_gjgamecredentials#private_key" >}}) |  |  
  
## Properties Descriptions  
  
### game_id 
- _[String](https://docs.godotengine.org/en/stable/classes/class_string.html)_ **game_id**  
  
| | |  
| - |:-:|  
| _Default_ | ` "" ` |  

 Your game id.
  
---------
### private_key 
- _[String](https://docs.godotengine.org/en/stable/classes/class_string.html)_ **private_key**  
  
| | |  
| - |:-:|  
| _Default_ | ` "" ` |  

 Your private key. This addon already comes with .gitignore configured so that this file will never
 be pushed to the repository, but be carefull not to share it.
  
---------
