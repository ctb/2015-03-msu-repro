#! /usr/bin/env python
import random

def main():
   random.seed(1)
   dna = ['A', 'C', 'G', 'T']
   genome = dna * 250
   random.shuffle(genome)
   print '>genome'
   print "".join(genome)

if __name__ == '__main__':
   main()
