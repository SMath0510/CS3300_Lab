mkdir first_pass_check 
javac Main.java
java Main < inputs/BinarySearch.microIR > first_pass_check/BinarySearch_out
java Main < inputs/BinaryTree.microIR > first_pass_check/BinaryTree_out
java Main < inputs/BubbleSort.microIR > first_pass_check/BubbleSort_out
java Main < inputs/Factorial.microIR > first_pass_check/Factorial_out
java Main < inputs/LinearSearch.microIR > first_pass_check/LinearSearch_out
java Main < inputs/MoreThan4.microIR > first_pass_check/MoreThan4_out
java Main < inputs/MustSpill.microIR > first_pass_check/MustSpill_out
java Main < inputs/MustSpill.microIR > first_pass_check/MustSpill_out
java Main < inputs/QuickSort.microIR > first_pass_check/QuickSort_out
java Main < inputs/TreeVisitor.microIR > first_pass_check/TreeVisitor_out