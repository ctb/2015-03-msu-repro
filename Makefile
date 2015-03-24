# targets:
# 'all' builds all
# 'clean' removes all files that can be reconstructed

all: reads.fa

clean:
	-rm -f genome.fa reads.fa

genome.fa: make-genome.py
	./make-genome.py > genome.fa

reads.fa: make-reads.py genome.fa
	./make-reads.py genome.fa > reads.fa
