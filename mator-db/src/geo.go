// This file provides a wrapper for MaxMind GeoIP2 and Geolite2 databases
// using oschwald/maxminddb-golang package.
//
// It lookups only for data that is needed for MATor descriptors monthly DB.
//
// This file is part of MATor project.

package main

import (
	"github.com/oschwald/maxminddb-golang"
	"net"
)

const mmdb_geolite2_city_url string = "http://geolite.maxmind.com/download/geoip/database/GeoLite2-City.mmdb.gz"
const mmdb_geolite2_city_md5_url string = "http://geolite.maxmind.com/download/geoip/database/GeoLite2-City.md5"

type GeoRow struct {
	Country struct {
		IsoCode string `maxminddb:"iso_code"`
	} `maxminddb:"country"`
	Location struct {
		Latitude  float64 `maxminddb:"latitude"`
		Longitude float64 `maxminddb:"longitude"`
	} `maxminddb:"location"`
}

type GeoReader struct {
	mmdbReader *maxminddb.Reader
}

func GeoOpen(file string) (*GeoReader, error) {
	reader, err := maxminddb.Open(file)
	return &GeoReader{mmdbReader: reader}, err
}

func (r *GeoReader) Lookup(ipAddress net.IP) (*GeoRow, error) {
	var val GeoRow
	err := r.mmdbReader.Lookup(ipAddress, &val)
	return &val, err
}

func (r *GeoReader) Close() {
	r.mmdbReader.Close()
}
