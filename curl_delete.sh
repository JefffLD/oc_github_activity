#!/bin/sh

DELETE_REQ='--request DELETE --write "%{http_code} %{url_effective}\\n" --silent'

