#!/bin/sh

# duplicate upstream tox tests for autopkgtest

set -e

nonroot_linux() {

    cp -a test $AUTOPKGTEST_TMP
    cd $AUTOPKGTEST_TMP
    echo "Testing scapy without root"
    python3 -m scapy.tools.UTscapy -c ./test/configs/linux.utsc

}

test_install_python3() {

    echo "Testing python3 package"
    mkdir -p $AUTOPKGTEST_TMP/fakehome
    export HOME=$AUTOPKGTEST_TMP/fakehome
    for py in $(py3versions -r 2>/dev/null) ; do
        cd "$AUTOPKGTEST_TMP" ;
        echo "Testing with $py:" ;
        $py -c "import scapy; print(scapy)" ;
    done

}

root_linux() {

    cp -a test $AUTOPKGTEST_TMP
    cd $AUTOPKGTEST_TMP
    echo "Testing scapy with root"
    python3 -m scapy.tools.UTscapy -c ./test/configs/linux.utsc

}

###################################
# Main
###################################

for function in "$@"; do
        $function
done
