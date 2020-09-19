---  
title: eh_GJUsersAuthData  
author: eh-jogos  
date: 2020-09-18T08:00:15-03:00  
summary:   
---  
**Inherits:** _[Resource](https://docs.godotengine.org/en/stable/classes/class_resource.html) > [Reference](https://docs.godotengine.org/en/stable/classes/class_reference.html) > [Object](https://docs.godotengine.org/en/stable/classes/class_object.html)_  
## Description  
 Data Struct that describes the response from `/users/auth/` endpoint
 Further details at [gamejolt's api documentation](https://gamejolt.com/game-api/doc/users/auth/)
  
## Properties 
  
| type | property | default value |  
| ---- | -------- | ------------- |  
| [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html) | [success]({{< ref "/reference/user/responsedata/eh_gjusersauthdata#success" >}}) | Null |  
| [String](https://docs.godotengine.org/en/stable/classes/class_string.html) | [message]({{< ref "/reference/user/responsedata/eh_gjusersauthdata#message" >}}) | Null |  
  
## Properties Descriptions  
  
### success 
- _[bool](https://docs.godotengine.org/en/stable/classes/class_bool.html)_ **success**  
  
 Status of the request.
  
---------
### message 
- _[String](https://docs.godotengine.org/en/stable/classes/class_string.html)_ **message**  
  
 Will contain error message if request fails.
  
---------
