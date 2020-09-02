+++
title = "eh_GJUsersFetchRequest"
description = "This class decribes the [Fetch api endpoint](https://gamejolt.com/game-api/doc/users/fetch)\nIt's response is modeled in the custom resource of [eh_GJUsersFetchData]\n\nIt is possible to request data for a single user with [fetch_user] or for multiple users with\n[fetch_users]. These methods return the request Error Code, so that you can check\nif for connection errors.\n\nEach has it's own signal with the response data, so be sure to listen for the corresponding\nsignal.\n\nIf the request fails, the signal [eh_GJBaseRequest.gj_request_failed] will be emitted with an error dict\nas its parameter."
author = ""
date = "2020-09-01"
+++

<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

**Extends:** [eh_GJBaseRequest](../eh_GJBaseRequest) < [HTTPRequest](../HTTPRequest)

## Description

This class decribes the [Fetch api endpoint](https://gamejolt.com/game-api/doc/users/fetch)
It's response is modeled in the custom resource of [eh_GJUsersFetchData]

It is possible to request data for a single user with [fetch_user](../#fetch-user) or for multiple users with
[fetch_users](../#fetch-users). These methods return the request Error Code, so that you can check
if for connection errors.

Each has it's own signal with the response data, so be sure to listen for the corresponding
signal.

If the request fails, the signal [eh_GJBaseRequest.gj_request_failed] will be emitted with an error dict
as its parameter.

## Method Descriptions

### fetch\_user

```gdscript
func fetch_user(p_username: String, is_user_id: bool = false) -> int
```

Request for a single user. Returns request error code. The user data will be sent either by
the signal [gj_user_fetch_data_received](../#gj-user-fetch-data-received) will be emitted

### fetch\_users

```gdscript
func fetch_users(p_array_of_ids: Array) -> int
```

Request for multiple users Returns request error code. The user data will be sent either by
the signal [gj_users_fetch_data_received](../#gj-users-fetch-data-received) will be emitted

## Signals

- signal gj_users_fetch_data_received(array_of_eh_gj_users_fetch_data): Multi User Request Response. Sends an array of [eh_GJUsersFetchData] as parameter
- signal gj_user_fetch_data_received(eh_gj_users_fetch_data): Single User Request Response. Send an [eh_GJUsersFetchData] Resource as parameter
