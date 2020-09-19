---  
title: eh_GJUsersFetchRequest  
author: eh-jogos  
date: 2020-09-18T08:00:15-03:00  
summary:   
---  
**Inherits:** _[eh_GJBaseRequest]({{< ref "/reference/eh_gjbaserequest" >}}) > [HTTPRequest](https://docs.godotengine.org/en/stable/classes/class_httprequest.html) > [Node](https://docs.godotengine.org/en/stable/classes/class_node.html) > [Object](https://docs.godotengine.org/en/stable/classes/class_object.html)_  
## Description  
 This class decribes the [Fetch api endpoint](https://gamejolt.com/game-api/doc/users/fetch)
 It's response is modeled in the custom resource of [eh_GJUsersFetchData]({{< ref "/reference/user/responsedata/eh_gjusersfetchdata" >}})

 It is possible to request data for a single user with [fetch_user]({{< ref "/reference/user/requests/eh_gjusersfetchrequest#fetch_user" >}}) or for multiple users with
 [fetch_users]({{< ref "/reference/user/requests/eh_gjusersfetchrequest#fetch_users" >}}). These methods return the request Error Code, so that you can check
 if for connection errors.

 Each has it's own signal with the response data, so be sure to listen for the corresponding 
 signal.

 If the request fails, the signal [gj_request_failed]({{< ref "/reference/eh_gjbaserequest#gj_request_failed" >}}) will be emitted with an 
 error dict as its parameter.
  
  
## Methods 
  
| return type | method signature |  
| ----------- | ---------------- |  
| [int](https://docs.godotengine.org/en/stable/classes/class_int.html) | **[fetch_user]({{< ref "/reference/user/requests/eh_gjusersfetchrequest#fetch_user" >}})**([String](https://docs.godotengine.org/en/stable/classes/class_string.html) p_username, [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html) is_user_id) |  
| [int](https://docs.godotengine.org/en/stable/classes/class_int.html) | **[fetch_users]({{< ref "/reference/user/requests/eh_gjusersfetchrequest#fetch_users" >}})**([Array](https://docs.godotengine.org/en/stable/classes/class_array.html) p_array_of_ids) |  
  
## Signals  
  
- **gj_users_fetch_data_received**(array_of_eh_gj_users_fetch_data) 
  
 Multi User Request Response. Sends an array of [eh_GJUsersFetchData]({{< ref "/reference/user/responsedata/eh_gjusersfetchdata" >}}) as parameter
  
---------
- **gj_user_fetch_data_received**(eh_gj_users_fetch_data) 
  
 Single User Request Response. Send an [eh_GJUsersFetchData]({{< ref "/reference/user/responsedata/eh_gjusersfetchdata" >}}) Resource as parameter
  
---------
  
## Constants  
  
- **URL_ENDPOINT = /users/** --- Address for this endpoint. 
## Method Descriptions  
  
### fetch_user 
- _[int](https://docs.godotengine.org/en/stable/classes/class_int.html)_ **fetch_user**([String](https://docs.godotengine.org/en/stable/classes/class_string.html) p_username, [bool](https://docs.godotengine.org/en/stable/classes/class_bool.html) is_user_id) 
  
 Request for a single user. Returns request error code. The user data will be sent either by
 the signal [gj_user_fetch_data_received] or [eh_GJBaseRequest.gj_request_failed] will be emitted.
  
---------
### fetch_users 
- _[int](https://docs.godotengine.org/en/stable/classes/class_int.html)_ **fetch_users**([Array](https://docs.godotengine.org/en/stable/classes/class_array.html) p_array_of_ids) 
  
 Request for multiple users. Returns request error code. The user data will be sent either by
 the signal [gj_users_fetch_data_received] or [eh_GJBaseRequest.gj_request_failed] will be emitted.
  
---------
