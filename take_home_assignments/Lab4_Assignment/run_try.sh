
javac Main.java
java Main < inputs/BinarySearch.microIR > myoutputs/out1
java Main < inputs/BinaryTree.microIR > myoutputs/out2
java Main < inputs/BubbleSort.microIR > myoutputs/out3
java Main < inputs/Factorial.microIR > myoutputs/out4
java Main < inputs/LinearSearch.microIR > myoutputs/out5
java Main < inputs/LinkedList.microIR > myoutputs/out6
java Main < inputs/MoreThan4.microIR > myoutputs/out7
java Main < inputs/MustSpill.microIR > myoutputs/out8
java Main < inputs/QuickSort.microIR > myoutputs/out9
java Main < inputs/TreeVisitor.microIR > myoutputs/out10

mkdir myoutputs 
mkdir my_outs
mkdir correct_outs

echo "Binary Search"
java -jar kgi.jar < myoutputs/out1 > my_outs/out1
echo "Binary Tree"
java -jar kgi.jar < myoutputs/out2 > my_outs/out2
echo "Bubble Sort"
java -jar kgi.jar < myoutputs/out3 > my_outs/out3
echo "Factorial"
java -jar kgi.jar < myoutputs/out4 > my_outs/out4
echo "Linear Search"
java -jar kgi.jar < myoutputs/out5 > my_outs/out5
echo "Linked List"
java -jar kgi.jar < myoutputs/out6 > my_outs/out6
echo "More than 4"
java -jar kgi.jar < myoutputs/out7 > my_outs/out7
echo "Must Spill"
java -jar kgi.jar < myoutputs/out8 > my_outs/out8
echo "Quick Sort"
java -jar kgi.jar < myoutputs/out9 > my_outs/out9
echo "Tree Visitor"
java -jar kgi.jar < myoutputs/out10 > my_outs/out10

echo "Binary Search"
java -jar kgi.jar < outputs/BinarySearch.miniRA > correct_outs/out1
echo "Binary Tree"
java -jar kgi.jar < outputs/BinaryTree.miniRA > correct_outs/out2
echo "Bubble Sort"
java -jar kgi.jar < outputs/BubbleSort.miniRA > correct_outs/out3
echo "Factorial"
java -jar kgi.jar < outputs/Factorial.miniRA > correct_outs/out4
echo "Linear Search"
java -jar kgi.jar < outputs/LinearSearch.miniRA > correct_outs/out5
echo "Linked List"
java -jar kgi.jar < outputs/LinkedList.miniRA > correct_outs/out6
echo "More than 4"
java -jar kgi.jar < outputs/MoreThan4.miniRA > correct_outs/out7
echo "Must Spill"
java -jar kgi.jar < outputs/MustSpill.miniRA > correct_outs/out8
echo "Quick Sort"
java -jar kgi.jar < outputs/QuickSort.miniRA > correct_outs/out9
echo "Tree Visitor"
java -jar kgi.jar < outputs/TreeVisitor.miniRA > correct_outs/out10

for ((i=1; i<=10; i++)); do
    if [[ $(diff "correct_outs/out$i" "my_outs/out$i") == "" ]]; then
        echo "Success on $i-th test case"
    fi
done






