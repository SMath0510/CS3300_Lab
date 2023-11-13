#!/bin/bash

read -r idx

javac Main.java

if [ "$idx" -eq 0 ]; then
  java Main < incheck.java > outcheck.java
  java -jar pgi.jar < outcheck.java > out1
  java incheck.java > out2
  output=$(diff out1 out2)
  if [ -z "$output" ]; then
    echo "It works"
  else
    echo "It fails"
  fi
fi

if [ "$idx" -eq 1 ]; then
  java Main < myinputs/Factorial.java > myoutputs/Factorial.microIR
  java -jar pgi.jar < myoutputs/Factorial.microIR > out1
  java myinputs/Factorial.java > out2
  output=$(diff out1 out2)
  if [ -z "$output" ]; then
    echo "Factorial works"
  else
    echo "Factorial fails"
  fi
fi

if [ "$idx" -eq 2 ]; then
  java Main < myinputs/BinarySearch.java > myoutputs/BinarySearch.microIR
  java -jar pgi.jar < myoutputs/BinarySearch.microIR > out1
  java myinputs/BinarySearch.java > out2
  output=$(diff out1 out2)
  if [ -z "$output" ]; then
    echo "BinarySearch works"
  else
    echo "BinarySearch fails"
  fi
fi

if [ "$idx" -eq 3 ]; then
  java Main < myinputs/LinearSearch.java > myoutputs/LinearSearch.microIR
  java -jar pgi.jar < myoutputs/LinearSearch.microIR > out1
  java myinputs/LinearSearch.java > out2
  output=$(diff out1 out2)
  if [ -z "$output" ]; then
    echo "LinearSearch works"
  else
    echo "LinearSearch fails"
  fi
fi

if [ "$idx" -eq 4 ]; then
  java Main < myinputs/BinaryTree.java > myoutputs/BinaryTree.microIR
  java -jar pgi.jar < myoutputs/BinaryTree.microIR > out1
  java myinputs/BinaryTree.java > out2
  output=$(diff out1 out2)
  if [ -z "$output" ]; then
    echo "BinaryTree works"
  else
    echo "BinaryTree fails"
  fi
fi

if [ "$idx" -eq 5 ]; then
  java Main < myinputs/TreeVisitor.java > myoutputs/TreeVisitor.microIR
  java -jar pgi.jar < myoutputs/TreeVisitor.microIR > out1
  java myinputs/TreeVisitor.java > out2
  output=$(diff out1 out2)
  if [ -z "$output" ]; then
    echo "TreeVisitor works"
  else
    echo "TreeVisitor fails"
  fi
fi

if [ "$idx" -eq 6 ]; then
  java Main < myinputs/QuickSort.java > myoutputs/QuickSort.microIR
  java -jar pgi.jar < myoutputs/QuickSort.microIR > out1
  java myinputs/QuickSort.java > out2
  output=$(diff out1 out2)
  if [ -z "$output" ]; then
    echo "QuickSort works"
  else
    echo "QuickSort fails"
  fi
fi

if [ "$idx" -eq 7 ]; then
  java Main < myinputs/BubbleSort.java > myoutputs/BubbleSort.microIR
  java -jar pgi.jar < myoutputs/BubbleSort.microIR > out1
  java myinputs/BubbleSort.java > out2
  output=$(diff out1 out2)
  if [ -z "$output" ]; then
    echo "BubbleSort works"
  else
    echo "BubbleSort fails"
  fi
fi

if [ "$idx" -eq 8 ]; then
  java Main < myinputs/LinkedList.java > myoutputs/LinkedList.microIR
  java -jar pgi.jar < myoutputs/LinkedList.microIR > out1
  java myinputs/LinkedList.java > out2
  output=$(diff out1 out2)
  if [ -z "$output" ]; then
    echo "LinkedList works"
  else
    echo "LinkedList fails"
  fi
fi
