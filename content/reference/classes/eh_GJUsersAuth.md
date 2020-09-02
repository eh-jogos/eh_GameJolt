+++
title = "eh_GJUsersAuth"
description = ""
author = ""
date = "2020-09-01"
+++

<!-- Auto-generated from JSON by GDScript docs maker. Do not edit this document directly. -->

**Extends:** [Node](../Node)

## Description

## Property Descriptions

### is\_logged\_in

```gdscript
var is_logged_in: bool
```

public variables - order: export > normal var > onready

## Method Descriptions

### get\_player\_username

```gdscript
func get_player_username() -> String
```

## Public Methods ------------------------

### get\_player\_user\_token

```gdscript
func get_player_user_token() -> String
```

### has\_player\_credentials

```gdscript
func has_player_credentials() -> bool
```

### self\_login

```gdscript
func self_login(p_username: String, p_user_token: String) -> void
```

### request

```gdscript
func request(p_username: String, p_user_token: String) -> void
```

## Signals

- signal gj_auth_completed(eh_gj_users_auth_data): ## Member Variables and Dependencies -----
signals
- signal gj_auth_failed(error_dictionary): 
