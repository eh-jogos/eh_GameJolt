---  
title: Requests  
author: eh-jogos  
date: 2020-09-28T09:02:35-03:00  
weight: 2  
---  
The HTTPRequest nodes that will do the requests and parse the results. They are usually managed by their respective Endpoint Node, which will instance them when needed and listen to the results and/or errors and treat that before giving it back to you. 

But if you want to make the requests directly yourself, you can also use these nodes.   
- [eh_GJUsersAuthRequest]({{< ref "/reference/user/requests/eh_gjusersauthrequest" >}})  
- [eh_GJUsersFetchRequest]({{< ref "/reference/user/requests/eh_gjusersfetchrequest" >}})  
