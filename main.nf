params.help = false
if (params.help) {
    log.info """
    -----------------------------------------------------------------------
    test: a SV calling workflow
    ============================
    Documentation and issues can be found at: https://github.com/brwnj/smoove-nf
    smoove is available at: https://github.com/brentp/smoove
    Required arguments:
    -------------------
    --bam                 Aligned sequences in .bam and/or .cram format.
                          Indexes (.bai/.crai) must be present.
    --fasta               Reference FASTA. Index (.fai) must exist in same
                          directory.
    Options:
    --------
    --outdir              Base results directory for output.
                          Default: '/.results'
    -----------------------------------------------------------------------
    """.stripIndent()
    exit 0
}

// Required arguments
params.fasta = false
if( !params.fasta ) { exit 1, "--fasta is not defined" }
params.bam = false
if( !params.bam ) { exit 1, "--bam is not defined" }


// Instantiate files
fasta = file(params.fasta)
faidx = file("${params.fasta}.fai")
bam = file(params.bam)
bai = file("${params.bam}.bai")

// Check file existence
if (!fasta.exists()) { exit 1, "Missing reference fasta: ${fasta}"}
if (!bam.exists()) { exit 1, "Missing bam: ${bam}"}

process test_wham {
	input:
	file fasta
	file faidx
	file bam 
	file bai

	script:
	"""
	which whamg
	"""
}

process test_manta {
	input:
	file fasta
	file faidx
	file bam 
	file bai

	script:
	"""
	/usr/local/bin/manta/bin/configManta.py --help
	"""
}

process test_delly {
	input:
	file fasta
	file faidx
	file bam 
	file bai

	script:
	"""
	delly call --help
	"""
}

