#! /usr/bin/env python
import argparse
import khmer
import screed

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--cutoff', type=int, default=5)
    parser.add_argument('table')
    parser.add_argument('reads')
    args = parser.parse_args()

    ct = khmer.load_counting_hash(args.table)

    hist = [0] * 150

    for n, record in enumerate(screed.open(args.reads)):
        posns = ct.find_spectral_error_positions(record.sequence,
                                                 args.cutoff)
        for pos in posns:
            hist[pos] += 1

    for p, count in enumerate(hist):
        print p, count
            
if __name__ == '__main__':
    main()
