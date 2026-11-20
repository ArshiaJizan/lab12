# Number Theory: Addition

In this lab, you’ve learned about One Hot and Binary state machines and how to build them.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Name
Arshia Jizan and Adel Norouzi
group 12
## Summary
In this lab we designed and made a 5 state moore machine. We implemented it once with a onehot and once with binary. We derived the binary next-state and output equations using KMaps, treating the unused codes 101, 110 and 111 as don’t-cares.  
## Lab Questions

### Compare and contrast One Hot and Binary encodings
Both encodings store the current state in D flip-flops and use combinational next-state logic, but they trade flip-flops against logic complexity.One-hot has many unused bit patterns (2⁵ − 5 = 27), and binary has only three (101, 110, 111).
### Which method did your team find easier, and why?
We found one-hot easier. Its equations came straight from the state table with no KMaps. Each flip-flop’s input was just which states lead here, and what is w. The output was a simple OR, and the state LEDs were easy to read.
### In what conditions would you have to use one over the other? Think about resource utilization on the FPGA.
One-hot is usually better on an FPGA, especially for small and medium state machines. Binary is better when flip-flops or area are limited, or when the state count is large.
