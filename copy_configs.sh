#!/bin/bash


dir=$(cd "$(dirname "$0")" && pwd)
cp $dir/user/. ~/. -r
