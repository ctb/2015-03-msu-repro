# targets:
# 'all' builds all
# 'clean' removes all files that can be reconstructed
# and that's all folks.

all: reads.fa error-locations.hist rseq-errors.hist \
	ecoli-errors.hist

clean:
	-rm -f genome.fa reads.fa error-locations.hist

genome.fa: make-genome.py
	./make-genome.py > genome.fa

reads.fa: make-reads.py genome.fa
	./make-reads.py genome.fa > reads.fa

reads.ct: reads.fa
	load-into-counting.py -x 1e7 -k 20 reads.ct reads.fa

error-locations.hist: error-spectrum.py reads.fa reads.ct
	./error-spectrum.py reads.ct reads.fa > error-locations.hist

ecoli-errors.hist: error-spectrum.py
	./error-spectrum.py data/ecoli-mapped.ct data/ecoli-mapped.fq.gz > ecoli-errors.hist

rseq-errors.hist: error-spectrum.py
	./error-spectrum.py data/rseq-mapped.ct data/rseq-mapped.fq.gz > rseq-errors.hist
