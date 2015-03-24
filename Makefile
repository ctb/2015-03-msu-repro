# targets:
# 'all' builds all
# 'clean' removes all files that can be reconstructed
# and that's all folks.

all: reads.fa error-locations.hist

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
