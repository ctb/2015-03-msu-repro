Getting started
---------------

We will use the khmer Python/C++ toolkit: http://khmer.readthedocs.org/

We will use the khmer function,

    ct.find_spectral_error_positions(sequence, cutoff)

Data
----

Under data/ are two real data sets from the literature:

* ecoli-mapped.fq.gz - subset of E. coli MG1655 data from Chitsaz et al., 2011.

* rseq-mapped.fq.gz - subset of mouse mRNAseq data from Grabherr et al., 2011

I turned both data sets into .ct files with

    load-into-counting.py -x 1e8 -k 20 filename.ct filename.fq.gz

Links
-----

* etherpad: https://etherpad.mozilla.org/5xwr0yZmDt

* most recent paper using these approaches: https://peerj.com/preprints/890/

* blog post: ivory.idyll.org/blog/2014-our-paper-process.html

* IPython Notebook: http://ipython.org/notebook.html

* GitHub: http://github.com/

* nbviewer: nbviewer.ipython.org/ - for viewing notebooks.

Note to self: save the history => git!
