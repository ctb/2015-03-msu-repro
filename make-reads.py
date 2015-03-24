#! /usr/bin/env python
import argparse
import screed
import random

COVERAGE=80
READLEN=100
ERROR_RATE=0.01

def make_read(genome, readlen, error_rate):
   start = random.randint(0, len(genome) - readlen)
   end = start + readlen

   read = genome[start:end]
   assert len(read) == readlen, len(read)
   
   return read


def main():
   random.seed(2)
   
   parser = argparse.ArgumentParser()
   parser.add_argument('genome')

   args = parser.parse_args()
   genome_record = list(screed.open(args.genome))[0]
   sequence = genome_record.sequence

   G = len(sequence)
   n_reads = G * COVERAGE / READLEN

   for i in range(n_reads):
      print '>read%d\n%s' % (i, make_read(sequence, READLEN,
                             ERROR_RATE))

if __name__ == '__main__':
   main()
