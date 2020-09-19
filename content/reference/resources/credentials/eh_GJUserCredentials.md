---  
title: eh_GJUserCredentials  
author: eh-jogos  
date: 2020-09-18T08:00:15-03:00  
summary:   
---  
**Inherits:** _[Resource](https://docs.godotengine.org/en/stable/classes/class_resource.html) > [Reference](https://docs.godotengine.org/en/stable/classes/class_reference.html) > [Object](https://docs.godotengine.org/en/stable/classes/class_object.html)_  
## Description  
 Just a basic struct to hold user credentials information and be able to save it in disk 
 as a Resource
  
## Properties 
  
| type | property | default value |  
| ---- | -------- | ------------- |  
| [String](https://docs.godotengine.org/en/stable/classes/class_string.html) | [username]({{< ref "/reference/resources/credentials/eh_gjusercredentials#username" >}}) |  |  
| [String](https://docs.godotengine.org/en/stable/classes/class_string.html) | [user_game_token]({{< ref "/reference/resources/credentials/eh_gjusercredentials#user_game_token" >}}) |  |  
  
## Properties Descriptions  
  
### username 
- _[String](https://docs.godotengine.org/en/stable/classes/class_string.html)_ **username**  
  
| | |  
| - |:-:|  
| _Default_ | ` "" ` |  

 User's username
  
---------
### user_game_token 
- _[String](https://docs.godotengine.org/en/stable/classes/class_string.html)_ **user_game_token**  
  
| | |  
| - |:-:|  
| _Default_ | ` "" ` |  

 User's game token. This addon already comes with .gitignore configured so that the credentials for
 the player that owns the game won't be pushed to the repository, but be carefull not to share it.
 This isn't a problem for the released game, but might expose your game token if you're testing
 your game in production and you share this file, or push files like this to your repository.
  
---------
