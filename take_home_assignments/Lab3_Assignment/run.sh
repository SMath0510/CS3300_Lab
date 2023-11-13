#!/bin/bash
javac Main.java
if [[ $# == 0 ]]
then
    echo "use -h flag for help"
    exit
fi

if [[ $# == 1 && $1 == "-h" ]]
then
    echo "USAGE: make sure input, ouput folder and script are in Main folder"
    echo ""
    echo "./run.sh <files> [OPTIONAL]"
    echo ""
    echo "files:"
    echo "all                   : run all files"
    echo "<file_name>           : run a single file"
    echo ""
    echo "OPTIONAL:"
    echo "debug                 : run in debug mode, from line number 1"
    echo "debug <line_number>   : run in debug mode from a specific line"
    echo ""
    echo "debug mode:"
    echo "1) It will execute file(s) in sequential order and stops as soon as one gives wrong output."
    echo "2) It will print the correct output for that file and also output of your code."
    echo "3) It will print the smallest line number where your code is giving wrong output."
    echo "4) You can give a line_number as an argument to start debugging from that line."
    echo ""
    echo "run script with --debug-help flag for more info"
    exit
fi
if [[ $# == 1 && $1 == "--debug-help" ]]
then
    echo "1) Run file with line number 1 first to get to know which function gives wrong output in main."
    echo ""
    echo "2) Then run file with line number of that function to get to know which line in that function gives wrong output."
    echo ""
    echo "3) It will not work if there are jumps in the function tho :("
    exit
fi

green='\033[0;37m'
red='\033[0;32m'
clear='\033[0m'

cd input/
fname=$(ls *.java)
cd ../

cd input/priv
fname2=$(ls *.java)
cd ../../

echo "--------------------------------------------------------"
if [[ $1 == "all" ]]
then
    for f in $fname
    do
        echo "Processing $f"
        name=$(basename $f .java)
        java Main < input/$f > output/IR/mine/$name.microIR 2>/dev/null
        java input/$f > output/exec/correct/$name 2>/dev/null
        java -jar pgi.jar < output/IR/mine/$name.microIR 1>output/exec/mine/$name 2>/dev/null
        if [[ $(cat output/exec/correct/$name) != $(cat output/exec/mine/$name) ]]
        then
            echo -e "----->" "${red}sed${clear} "
            echo "--------------------------------------------------------"
        else
            echo -e "----->" "${green}Noice${clear}"
            echo "--------------------------------------------------------"
        fi
    done
    for f in $fname2
    do
        echo "Processing $f"
        name=$(basename $f .java)
        java Main < input/priv/$f > output/IR/mine/priv/$name.microIR 
        java input/priv/$f > output/exec/correct/priv/$name 
        java -jar pgi.jar < output/IR/mine/priv/$name.microIR > output/exec/mine/priv/$name 
        if [[ $(cat output/exec/correct/priv/$name) != $(cat output/exec/mine/priv/$name) ]]
        then
            echo -e "----->" "${red}sed${clear} "
            echo "--------------------------------------------------------"
        else
            echo -e "----->" "${green}Noice${clear}"
            echo "--------------------------------------------------------"
        fi
    done
fi
rm */*.class
rm *.class