#!/bin/bash

IDENTITY_DOMAIN="https://idcs-1d01f3396e1f47c0854de59964bdb48f.identity.oraclecloud.com:443"
OAUTH_TOKEN="$(cat /mnt/c/Users/beebo/Downloads/tokens.tok)"

curl -i -X POST \
  "$IDENTITY_DOMAIN/admin/v1/Users" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OAUTH_TOKEN" \
  -d '{
    "schemas": [
      "urn:ietf:params:scim:schemas:core:2.0:User",
      "urn:ietf:params:scim:schemas:oracle:idcs:extension:user:User"
    ],
    "urn:ietf:params:scim:schemas:oracle:idcs:extension:user:User": {
      "serviceUser": true
    },
    "userName": "oci-oidc"
  }'