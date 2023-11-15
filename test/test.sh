#!/bin/bash

# Basic tests written for howto.sh
# As it is a very basic, simple script
# no framework has been used

# source from pwd if run from project root
# else, if run from test source from step down
source howto.sh || source ../howto.sh

pass_count=0
fail_count=0

test_example_config () {
    result=$(example_config)

    if [[ "$result" == *"Example ht.cfg file"* ]]; then
        echo "example config test passed"
        pass_count=$((pass_count+1))
    else
        echo "example config test failed"
        fail_count=$((fail_count+1))
    fi
}


test_add_to_file () {
    howtofilepath="tmp/howto.txt"

    if [[ ! -e "$howtofilepath" ]]; then
        mkdir "tmp"
        touch "$howtofilepath"
    fi

    addition="test addition"

    add_to_file

    result=$(cat "$howtofilepath")

    if [[ "$result" == "$addition" ]]; then
        echo "add to file test passed"
        pass_count=$((pass_count+1))
    else
        echo "add to file test failed"
        fail_count=$((fail_count+1))
    fi

    rm -r tmp
}

test_usage () {
    result=$(usage)

    if [[ "$result" == *"Usage: howto.sh [search, terms]"* ]]; then
        echo "usage test passed"
        pass_count=$((pass_count+1))
    else
        echo "usage test failed"
        fail_count=$((fail_count+1))
    fi
}

test_create_search_query () {
    create_search_query search terms

    if [[ "$full_search_query" == "search.*terms.*|terms.*search.*" ]]; then
        echo "create search query test passed"
        pass_count=$((pass_count+1))
    else
        echo "create search query test failed"
        fail_count=$((fail_count+1))
    fi
}

test_source_config () {
    ht_config="fake-file-path"

    result=$(source_config)

    if [[ "$result" == *"No config file found."* ]]; then
        echo "source config with no config file test passed"
        pass_count=$((pass_count+1))
    else
        echo "source config with no config file test failed"
        fail_count=$((fail_count+1))
    fi
}

test_add_to_file

test_example_config

test_usage

test_create_search_query

test_source_config

echo
echo "$pass_count tests passed"
echo "$fail_count tests failed"

if [[ "$fail_count" -gt 0 ]]; then
    exit 1
else
    exit 0
fi
