#!/bin/bash

bearer="1ceba8a4-baca-4396-bdc0-82d65f3d9484"
tenant="testing.sweagle.com"
mds="Jenkins"
parser='NoHTTP'

commande () {
    curl -X POST \
         https://$tenant/api/v1/tenant/metadata-parser/validate -H 
         "Authorization: bearer $bearer" -d 
         "mds=$mds&parser=$parser"
}

 
