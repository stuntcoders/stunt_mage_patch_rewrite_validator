#!/bin/bash

modified_files=$(git ls-files -m);
num_modified=$(wc -l <<< "$modified_files");
echo "Modified "$num_modified;

RED='\033[0;31m';
GREEN='\033[0;32m';
DEFAULT='\033[0m';
COLOR=$DEFAULT;

while read -r line ; do
	COLOR=$GREEN;
	
	to_check=$(echo $line | sed "s/app\/code\/core/app\/code\/local/");
	if [[ -f $to_check ]];
	then
		COLOR=$RED;	
	fi

	to_check=$(echo $line | sed "s/app\/code\/core/app\/code\/community/");
	if [[ -f $to_check ]];
	then
		COLOR=$RED;
	fi

	echo -e "${COLOR}$line"
done < <(grep core <<< "$modified_files")

while read -r line ; do
	COLOR=$GREEN;

	to_check=$(echo $line | sed 's/^.*template/*/');
	if [[ $(find . -wholename "*$to_check" | wc -l) -gt 1 ]];
	then
		COLOR=$RED;
	fi

	echo -e "${COLOR}$line"
done < <(grep template <<< "$modified_files")

echo -e "${DEFAULT}Additional files: ";
skipped=$(grep -v core <<< "$modified_files");
skipped=$(grep -v template <<< "$skipped");
echo -e "${GREEN}$skipped";