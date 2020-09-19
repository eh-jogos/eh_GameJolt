---  
title: eh_GJUsersFetchData  
author: eh-jogos  
date: 2020-09-19T19:10:16-03:00  
---  
**Inherits:** _[Resource](https://docs.godotengine.org/en/stable/classes/class_resource.html) > [Reference](https://docs.godotengine.org/en/stable/classes/class_reference.html) > [Object](https://docs.godotengine.org/en/stable/classes/class_object.html)_  
## Description  
 Data Struct that describes the response from `/users/` endpoint
 Further details at [gamejolt's api documentation](https://gamejolt.com/game-api/doc/users/fetch)
  
## Properties 
  
| type | property | default value |  
| ---- | -------- | ------------- |  
| [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html) | [success]({{< ref "/reference/user/responsedata/eh_gjusersfetchdata#success" >}}) | Null |  
| [String](https://docs.godotengine.org/en/stable/classes/class_string.html) | [message]({{< ref "/reference/user/responsedata/eh_gjusersfetchdata#message" >}}) | Null |  
| [int](https://docs.godotengine.org/en/stable/classes/class_int.html) | [id]({{< ref "/reference/user/responsedata/eh_gjusersfetchdata#id" >}}) | Null |  
| [int](https://docs.godotengine.org/en/stable/classes/class_int.html) | [type]({{< ref "/reference/user/responsedata/eh_gjusersfetchdata#type" >}}) | Null |  
| [String](https://docs.godotengine.org/en/stable/classes/class_string.html) | [username]({{< ref "/reference/user/responsedata/eh_gjusersfetchdata#username" >}}) | Null |  
| [String](https://docs.godotengine.org/en/stable/classes/class_string.html) | [avatar_url]({{< ref "/reference/user/responsedata/eh_gjusersfetchdata#avatar_url" >}}) | Null |  
| [String](https://docs.godotengine.org/en/stable/classes/class_string.html) | [signed_up]({{< ref "/reference/user/responsedata/eh_gjusersfetchdata#signed_up" >}}) | Null |  
| [int](https://docs.godotengine.org/en/stable/classes/class_int.html) | [signed_up_timestamp]({{< ref "/reference/user/responsedata/eh_gjusersfetchdata#signed_up_timestamp" >}}) | Null |  
| [String](https://docs.godotengine.org/en/stable/classes/class_string.html) | [last_logged_in]({{< ref "/reference/user/responsedata/eh_gjusersfetchdata#last_logged_in" >}}) | Null |  
| [int](https://docs.godotengine.org/en/stable/classes/class_int.html) | [last_logged_in_timestamp]({{< ref "/reference/user/responsedata/eh_gjusersfetchdata#last_logged_in_timestamp" >}}) | Null |  
| [int](https://docs.godotengine.org/en/stable/classes/class_int.html) | [status]({{< ref "/reference/user/responsedata/eh_gjusersfetchdata#status" >}}) | Null |  
| [String](https://docs.godotengine.org/en/stable/classes/class_string.html) | [developer_name]({{< ref "/reference/user/responsedata/eh_gjusersfetchdata#developer_name" >}}) | Null |  
| [String](https://docs.godotengine.org/en/stable/classes/class_string.html) | [developer_website]({{< ref "/reference/user/responsedata/eh_gjusersfetchdata#developer_website" >}}) | Null |  
| [String](https://docs.godotengine.org/en/stable/classes/class_string.html) | [developer_description]({{< ref "/reference/user/responsedata/eh_gjusersfetchdata#developer_description" >}}) | Null |  
  
## Enumerations  
  
  
enum **Status**: 
  
- **Active = 0**  
- **Banned = 1**  
---------
  
enum **Type**: 
  
- **User = 0**  
- **Developer = 1**  
- **Moderator = 2**  
- **Administrator = 3**  
---------
  
## Properties Descriptions  
  
### success 
- _[bool](https://docs.godotengine.org/en/stable/classes/class_bool.html)_ **success**  
  
 Status of the request.
  
---------
### message 
- _[String](https://docs.godotengine.org/en/stable/classes/class_string.html)_ **message**  
  
 Will contain error message if request fails.
  
---------
### id 
- _[int](https://docs.godotengine.org/en/stable/classes/class_int.html)_ **id**  
  
 The ID of the user. 
  
---------
### type 
- _[int](https://docs.godotengine.org/en/stable/classes/class_int.html)_ **type**  
  
 The type of user. Can be any type defined in the enum Types
  
---------
### username 
- _[String](https://docs.godotengine.org/en/stable/classes/class_string.html)_ **username**  
  
 The type of user.
  
---------
### avatar_url 
- _[String](https://docs.godotengine.org/en/stable/classes/class_string.html)_ **avatar_url**  
  
 The URL of the user's avatar. 
  
---------
### signed_up 
- _[String](https://docs.godotengine.org/en/stable/classes/class_string.html)_ **signed_up**  
  
 How long ago the user signed up. 
  
---------
### signed_up_timestamp 
- _[int](https://docs.godotengine.org/en/stable/classes/class_int.html)_ **signed_up_timestamp**  
  
 The timestamp (in seconds) of when the user signed up. 
  
---------
### last_logged_in 
- _[String](https://docs.godotengine.org/en/stable/classes/class_string.html)_ **last_logged_in**  
  
 How long ago the user was last logged in. Will be \"Online Now\" if the user is currently online. 
  
---------
### last_logged_in_timestamp 
- _[int](https://docs.godotengine.org/en/stable/classes/class_int.html)_ **last_logged_in_timestamp**  
  
 The timestamp (in seconds) of when the user was last logged in. 
  
---------
### status 
- _[int](https://docs.godotengine.org/en/stable/classes/class_int.html)_ **status**  
  
 `Status.Active` if the user is still a member of the site. `Status.Banned` if they've been banned. 
  
---------
### developer_name 
- _[String](https://docs.godotengine.org/en/stable/classes/class_string.html)_ **developer_name**  
  
 The user's display name. 
 (This is available to all users and the `developer_` is there for backwards compatibility)
  
---------
### developer_website 
- _[String](https://docs.godotengine.org/en/stable/classes/class_string.html)_ **developer_website**  
  
 The user's website (or empty string if not specified) 
 (This is available to all users and the `developer_` is there for backwards compatibility)
  
---------
### developer_description 
- _[String](https://docs.godotengine.org/en/stable/classes/class_string.html)_ **developer_description**  
  
 The user's profile markdown description. 
 (This is available to all users and the `developer_` is there for backwards compatibility)
  
---------
