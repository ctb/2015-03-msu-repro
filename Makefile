all: genome.fa

genome.fa: make-genome.py
	./make-genome.py > genome.fa
