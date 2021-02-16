#!/bin/bash

SCRIPTPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cp src/*.go go/src/mator-db/
cp -r src/asn go/src/mator-db/

#export GOPATH=`pwd`/go
export GOPATH="$SCRIPTPATH/go"
cd go/src/mator-db/
go get
go install
cd -
cp go/bin/mator-db ./
