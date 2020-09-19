---  
title: eh_GJUsersFetch  
author: eh-jogos  
date: 2020-09-18T08:00:15-03:00  
summary:   
---  
**Inherits:** _[Node](https://docs.godotengine.org/en/stable/classes/class_node.html) > [Object](https://docs.godotengine.org/en/stable/classes/class_object.html)_  
## Description  
 Node to manage requests to the `users` endpoint. It wil instantiate and remove
 [eh_GJUsersAuthRequest]({{< ref "/reference/user/requests/eh_gjusersauthrequest" >}}) nodes as needed.

 It can make requests for data on a single user or on multiple users at a time.
  
  
## Methods 
  
| return type | method signature |  
| ----------- | ---------------- |  
| [null](https://docs.godotengine.org/en/stable/classes/class_null.html) | **[request_user]({{< ref "/reference/user/eh_gjusersfetch#request_user" >}})**([String](https://docs.godotengine.org/en/stable/classes/class_string.html) p_username, [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html) is_user_id) |  
| [null](https://docs.godotengine.org/en/stable/classes/class_null.html) | **[request_users]({{< ref "/reference/user/eh_gjusersfetch#request_users" >}})**([Array](https://docs.godotengine.org/en/stable/classes/class_array.html) p_user_ids) |  
  
## Signals  
  
- **gj_fetch_user_completed**(eh_gj_users_fetch_data) 
  
 Signal emitted when a single user request is completed successfully. Sends a [eh_GJUsersFetchData]({{< ref "/reference/user/responsedata/eh_gjusersfetchdata" >}})
 as parameter.
  
---------
- **gj_fetch_users_completed**(array_of_eh_gj_users_fetch_data) 
  
 Signal emitted when a multi user request is completed successfully. Sends an array of 
 [eh_GJUsersFetchData]({{< ref "/reference/user/responsedata/eh_gjusersfetchdata" >}}) as parameter.
  
---------
- **gj_fetch_failed**(error_dict) 
  
 Signal emitted when a fetch request fails. The dictionary format can vary according to the type of
 error
  
---------
## Method Descriptions  
  
### request_user 
- _void_ **request_user**([String](https://docs.godotengine.org/en/stable/classes/class_string.html) p_username, [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html) is_user_id) 
  
 Creates a single user request. If you're passing a user_id number instead of username the optional
 parameter must be sent as true.
 Emits [gj_fetch_user_completed] signal if completed successfully or [gj_fetch_failed] if not.
  
---------
### request_users 
- _void_ **request_users**([Array](https://docs.godotengine.org/en/stable/classes/class_array.html) p_user_ids) 
  
 Creates a multi user request. It only accepts user_ids.
 Emits [gj_fetch_users_completed] signal if completed successfully or [gj_fetch_failed] if not.
  
---------
