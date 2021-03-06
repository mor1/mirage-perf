#!/usr/bin/env bash
#
# Copyright (C) 2015 University of Nottingham <masoud.koleini@nottingham.ac.uk>
#
# Permission to use, copy, modify, and distribute this software for any purpose
# with or without fee is hereby granted, provided that the above copyright
# notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
# REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
# AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
# INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
# LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE.

pushd `dirname $0`
DIR=`pwd`
popd

source $DIR/init.sh

echo -e "${INF} cleaning up"

$XENSERVER "xe vm-shutdown --force uuid=\$(cat ./VM)"
$XENSERVER "xe vm-destroy --force uuid=\$(cat ./VM)"

$XENSERVER 'rm -rf /boot/guest'
