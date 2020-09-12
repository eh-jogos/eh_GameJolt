---  
title: eh_GJUsersFetchRequest  
author: eh-jogos  
date: 2020-09-12T08:29:27-03:00  
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

 If the request fails, the signal [gj_request_failed]({{< ref "/reference/eh_gjbaserequest#gj_request_failed" >}}) will be emitted with an error dict 
 as its parameter.

## Properties Description  

