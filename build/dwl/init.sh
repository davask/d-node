#!/bin/bash

cd ~/;

dwlDir="/dwl";

. ${dwlDir}/envvar.sh
. ${dwlDir}/user.sh
. ${dwlDir}/ssh.sh
echo ">> Os initialized";

echo ">> Base initialized";

. ${dwlDir}/permission.sh
echo ">> Permission assigned";

. ${dwlDir}/ng.sh
echo ">> ng initialized";

if [ "0" = "0" ]; then

    echo "> add rsync sync as a cron task";
    crontab -l | sudo tee /dwl/cron;
    echo '*/5 * * * * sudo rsync -avz --delete --exclude ".npm" --exclude "node_modules" --exclude ".git" "/home/dwl" "/dwl/home/host" >/dev/null 2>&1' | sudo tee --append /dwl/cron;
    crontab /dwl/cron;

fi

. ${dwlDir}/custom.sh

tail -f /dev/null;
