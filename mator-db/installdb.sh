#!/bin/bash

mkdir -p go/bin
mkdir -p go/pkg
mkdir -p go/src/mator-db

cp src/*.go go/src/mator-db/
cp -r src/asn go/src/mator-db/
#export GOPATH=`pwd`/go
export GOPATH='/usr/bin/go'
cd go/src/mator-db/
go get .
go install
cd -
cp go/bin/mator-db ./
