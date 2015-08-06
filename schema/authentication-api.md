## <a name="resource-account"></a>Account

The Account Schema

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **id** | *uuid* | unique identifier of account | `"01234567-89ab-cdef-0123-456789abcdef"` |
| **email** | *string* | unique email of account | `"fred@bedrockisp.com"` |

### Account Create

Create a new account.

```
POST /account
```

#### Required Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **account:email** | *string* | unique email of account | `"fred@bedrockisp.com"` |
| **account:password** | *string* | The password | `"example"` |


#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **account:remember_me** | *boolean* | True/false - generate refresh token (optional) | `true` |


#### Curl Example

```bash
$ curl -n -X POST https://accounts.ourapi.com/account \
  -H "Content-Type: application/json" \
 \
  -d '{
  "account": {
    "email": "fred@bedrockisp.com",
    "password": "example",
    "remember_me": true
  }
}'
```


#### Response Example

```
HTTP/1.1 201 Created
```

```json
{
  "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzUxMiJ9.eyJkYXRhIjp7ImlkIjoiMTE0MzYiLCJ0eXBlIjoiYWNjb3VudHMiLCJhdHRyaWJ1dGVzIjp7ImVtYWlsIjoiZ2xlbm4uZ29vZHJpY2hAZ21haWwuY29tIn19LCJzdWIiOiJhY2NvdW50IiwiZXhwIjoxNDM3MjM0OTM0LCJpc3MiOiJVbmlxdWUgVVNBIiwiaWF0IjoxNDM3MTQ4NTM0LCJqdGkiOiI3ZmJiYTgzOS1kMGRiLTQwODItOTBmZC1kNmMwM2YwN2NmMWMifQ.SuAAhWPz_7VfJ2iyQpPEHjAnj_aZ-0-gI4uptFucWWflQnrYJl3Z17vAjypiQB_6io85Nuw7VK0Kz2_VHc7VHZwAjxMpzSvigzpUS4HHjSsDil8iYocVEFlnJWERooCOCjSB9R150Pje1DKB8fNeePUGbkCDH6QSk2BsBzT07yT-7zrTJ7kRlsJ-3Kw2GDnvSbb_k2ecX_rkeMeaMj3FmF3PDBNlkM"
}
```

### Account Sign In

Sign in (generate token)

```
POST /account/session
```

#### Required Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **account:email** | *string* | unique email of account | `"fred@bedrockisp.com"` |
| **account:password** | *string* | The password | `"example"` |


#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **account:remember_me** | *boolean* | True/false - generate refresh token (optional) | `true` |


#### Curl Example

```bash
$ curl -n -X POST https://accounts.ourapi.com/account/session \
  -H "Content-Type: application/json" \
 \
  -d '{
  "account": {
    "email": "fred@bedrockisp.com",
    "password": "example",
    "remember_me": true
  }
}'
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzUxMiJ9.eyJkYXRhIjp7ImlkIjoiMTE0MzYiLCJ0eXBlIjoiYWNjb3VudHMiLCJhdHRyaWJ1dGVzIjp7ImVtYWlsIjoiZ2xlbm4uZ29vZHJpY2hAZ21haWwuY29tIn19LCJzdWIiOiJhY2NvdW50IiwiZXhwIjoxNDM3MjM0OTM0LCJpc3MiOiJVbmlxdWUgVVNBIiwiaWF0IjoxNDM3MTQ4NTM0LCJqdGkiOiI3ZmJiYTgzOS1kMGRiLTQwODItOTBmZC1kNmMwM2YwN2NmMWMifQ.SuAAhWPz_7VfJ2iyQpPEHjAnj_aZ-0-gI4uptFucWWflQnrYJl3Z17vAjypiQB_6io85Nuw7VK0Kz2_VHc7VHZwAjxMpzSvigzpUS4HHjSsDil8iYocVEFlnJWERooCOCjSB9R150Pje1DKB8fNeePUGbkCDH6QSk2BsBzT07yT-7zrTJ7kRlsJ-3Kw2GDnvSbb_k2ecX_rkeMeaMj3FmF3PDBNlkM"
}
```

### Account Get new token

Update the session with a new token

```
PUT /account/session
```

#### Required Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **account:refresh_token** | *string* | The refresh token | `"example"` |


#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **account:remember_me** | *boolean* | True/false - generate refresh token (optional) | `true` |


#### Curl Example

```bash
$ curl -n -X PUT https://accounts.ourapi.com/account/session \
  -H "Content-Type: application/json" \
 \
  -d '{
  "account": {
    "refresh_token": "example",
    "remember_me": true
  }
}'
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzUxMiJ9.eyJkYXRhIjp7ImlkIjoiMTE0MzYiLCJ0eXBlIjoiYWNjb3VudHMiLCJhdHRyaWJ1dGVzIjp7ImVtYWlsIjoiZ2xlbm4uZ29vZHJpY2hAZ21haWwuY29tIn19LCJzdWIiOiJhY2NvdW50IiwiZXhwIjoxNDM3MjM0OTM0LCJpc3MiOiJVbmlxdWUgVVNBIiwiaWF0IjoxNDM3MTQ4NTM0LCJqdGkiOiI3ZmJiYTgzOS1kMGRiLTQwODItOTBmZC1kNmMwM2YwN2NmMWMifQ.SuAAhWPz_7VfJ2iyQpPEHjAnj_aZ-0-gI4uptFucWWflQnrYJl3Z17vAjypiQB_6io85Nuw7VK0Kz2_VHc7VHZwAjxMpzSvigzpUS4HHjSsDil8iYocVEFlnJWERooCOCjSB9R150Pje1DKB8fNeePUGbkCDH6QSk2BsBzT07yT-7zrTJ7kRlsJ-3Kw2GDnvSbb_k2ecX_rkeMeaMj3FmF3PDBNlkM"
}
```

### Account Delete all tokens

Delete the session (logout)

```
DELETE /account/session
```


#### Curl Example

```bash
$ curl -n -X DELETE https://accounts.ourapi.com/account/session \
  -H "Content-Type: application/json" \
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "id": "01234567-89ab-cdef-0123-456789abcdef",
  "email": "fred@bedrockisp.com"
}
```

### Account Info

Info for existing account.

```
GET /account
```


#### Curl Example

```bash
$ curl -n https://accounts.ourapi.com/account \
  -H "Authorization: Bearer: eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzUxMiJ9.eyJkYXRhIjp7ImlkIjoiMTE0MzYiLCJ0eXBlIjoiYWNjb3VudHMiLCJhdHRyaWJ1dGVzIjp7ImVtYWlsIjoiZ2xlbm4uZ29vZHJpY2hAZ21haWwuY29tIn19LCJzdWIiOiJhY2NvdW50IiwiZXhwIjoxNDM3MjM0OTM0LCJpc3MiOiJVbmlxdWUgVVNBIiwiaWF0IjoxNDM3MTQ4NTM0LCJqdGkiOiI3ZmJiYTgzOS1kMGRiLTQwODItOTBmZC1kNmMwM2YwN2NmMWMifQ.SuAAhWPz_7VfJ2iyQpPEHjAnj_aZ-0-gI4uptFucWWflQnrYJl3Z17vAjypiQB_6io85Nuw7VK0Kz2_VHc7VHZwAjxMpzSvigzpUS4HHjSsDil8iYocVEFlnJWERooCOCjSB9R150Pje1DKB8fNeePUGbkCDH6QSk2BsBzT07yT-7zrTJ7kRlsJ-3Kw2GDnvSbb_k2ecX_rkeMeaMj3FmF3PDBNlkM" \
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "data": {
    "id": "01234567-89ab-cdef-0123-456789abcdef",
    "email": "fred@bedrockisp.com"
  }
}
```

### Account Update

Update an existing account.

```
PUT /account
```

#### Required Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **account:email** | *string* | unique email of account | `"fred@bedrockisp.com"` |
| **account:password** | *string* | The password | `"example"` |



#### Curl Example

```bash
$ curl -n -X PUT https://accounts.ourapi.com/account \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer: eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzUxMiJ9.eyJkYXRhIjp7ImlkIjoiMTE0MzYiLCJ0eXBlIjoiYWNjb3VudHMiLCJhdHRyaWJ1dGVzIjp7ImVtYWlsIjoiZ2xlbm4uZ29vZHJpY2hAZ21haWwuY29tIn19LCJzdWIiOiJhY2NvdW50IiwiZXhwIjoxNDM3MjM0OTM0LCJpc3MiOiJVbmlxdWUgVVNBIiwiaWF0IjoxNDM3MTQ4NTM0LCJqdGkiOiI3ZmJiYTgzOS1kMGRiLTQwODItOTBmZC1kNmMwM2YwN2NmMWMifQ.SuAAhWPz_7VfJ2iyQpPEHjAnj_aZ-0-gI4uptFucWWflQnrYJl3Z17vAjypiQB_6io85Nuw7VK0Kz2_VHc7VHZwAjxMpzSvigzpUS4HHjSsDil8iYocVEFlnJWERooCOCjSB9R150Pje1DKB8fNeePUGbkCDH6QSk2BsBzT07yT-7zrTJ7kRlsJ-3Kw2GDnvSbb_k2ecX_rkeMeaMj3FmF3PDBNlkM" \
 \
  -d '{
  "account": {
    "email": "fred@bedrockisp.com",
    "password": "example"
  }
}'
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzUxMiJ9.eyJkYXRhIjp7ImlkIjoiMTE0MzYiLCJ0eXBlIjoiYWNjb3VudHMiLCJhdHRyaWJ1dGVzIjp7ImVtYWlsIjoiZ2xlbm4uZ29vZHJpY2hAZ21haWwuY29tIn19LCJzdWIiOiJhY2NvdW50IiwiZXhwIjoxNDM3MjM0OTM0LCJpc3MiOiJVbmlxdWUgVVNBIiwiaWF0IjoxNDM3MTQ4NTM0LCJqdGkiOiI3ZmJiYTgzOS1kMGRiLTQwODItOTBmZC1kNmMwM2YwN2NmMWMifQ.SuAAhWPz_7VfJ2iyQpPEHjAnj_aZ-0-gI4uptFucWWflQnrYJl3Z17vAjypiQB_6io85Nuw7VK0Kz2_VHc7VHZwAjxMpzSvigzpUS4HHjSsDil8iYocVEFlnJWERooCOCjSB9R150Pje1DKB8fNeePUGbkCDH6QSk2BsBzT07yT-7zrTJ7kRlsJ-3Kw2GDnvSbb_k2ecX_rkeMeaMj3FmF3PDBNlkM"
}
```

### Account Reset Password

Update the password

```
PUT /account/password
```

#### Required Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **account:password** | *string* | The new password | `"example"` |
| **account:reset_password_token** | *string* | The reset password token | `"example"` |


#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **account:remember_me** | *boolean* | True/false - generate refresh token (optional) | `true` |


#### Curl Example

```bash
$ curl -n -X PUT https://accounts.ourapi.com/account/password \
  -H "Content-Type: application/json" \
 \
  -d '{
  "account": {
    "password": "example",
    "reset_password_token": "example",
    "remember_me": true
  }
}'
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "id": "01234567-89ab-cdef-0123-456789abcdef",
  "email": "fred@bedrockisp.com"
}
```

### Account Request Password

Request new passowrd

```
POST /account/password
```

#### Required Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **account:email** | *string* | unique email of account | `"fred@bedrockisp.com"` |



#### Curl Example

```bash
$ curl -n -X POST https://accounts.ourapi.com/account/password \
  -H "Content-Type: application/json" \
 \
  -d '{
  "account": {
    "email": "fred@bedrockisp.com"
  }
}'
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "id": "01234567-89ab-cdef-0123-456789abcdef",
  "email": "fred@bedrockisp.com"
}
```


