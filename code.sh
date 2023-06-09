conda activate genomics

cp /tmp/gen711_project_data/fastp-single.sh .

chmod +x fastp-single.sh

./fastp-single.sh 120 /tmp/gen711_project_data/FMT_3/fmt-tutorial-demux-2 trimmed_fastqs1

./fastp-single.sh 120 /tmp/gen711_project_data/FMT_3/fmt-tutorial-demux-1 trimmed_fastqs2

ls -shS trimmed_fastqs1

ls -shS trimmed_fastqs2

conda activate qiime2-2022.8

qiime tools import --type "SampleData[SequencesWithQuality]" --input-format CasavaOneEightSingleLanePerSampleDirFmt --input-path trimmed_fastqs1 --output-path qiimefile1

qiime tools import --type "SampleData[SequencesWithQuality]" --input-format CasavaOneEightSingleLanePerSampleDirFmt --input-path trimmed_fastqs2 --output-path qiimefile2

qiime cutadapt trim-single --i-demultiplexed-sequences qiimefile1.qza --p-front TACGTATGGTGCA --p-discard-untrimmed --p-match-adapter-wildcards --verbose --o-trimmed-sequences cutadapt1

qiime cutadapt trim-single --i-demultiplexed-sequences qiimefile2.qza --p-front TACGTATGGTGCA --p-discard-untrimmed --p-match-adapter-wildcards --verbose --o-trimmed-sequences cutadapt2

qiime demux summarize --i-data cutadapt1.qza --o-visualization qiimesummary1

qiime demux summarize --i-data cutadapt2.qza --o-visualization qiimesummary2

qiime dada2 denoise-single --i-demultiplexed-seqs cutadapt1.qza --p-trunc-len 50 --p-trim-left 13 --p-n-threads 4 --o-denoising-stats denoising-stats.qza --o-table feature_table.qza --o-representative-sequences rep-seqs.qza

qiime dada2 denoise-single --i-demultiplexed-seqs cutadapt2.qza --p-trunc-len 50 --p-trim-left 13 --p-n-threads 4 --o-denoising-stats denoising-stats2.qza --o-table feature_table2.qza --o-representative-sequences rep-seqs2.qza

qiime metadata tabulate --m-input-file denoising-stats.qza --o-visualization denoising-stats1.qzv

qiime metadata tabulate --m-input-file denoising-stats2.qza --o-visualization denoising-stats2.qzv

qiime feature-table tabulate-seqs --i-data rep-seqs.qza --o-visualization rep-seqs1.qzv

qiime feature-table tabulate-seqs --i-data rep-seqs2.qza --o-visualization rep-seqs2.qzv

qiime feature-table merge-seqs --i-data /home/users/amr1175/FT/rep-seqs.qza --i-data /home/users/amr1175/FT/rep-seqs2.qza --o-merged-data /home/users/amr1175/FT/merged.rep-seqs.qza

qiime feature-classifier classify-sklearn --i-classifier /tmp/gen711_project_data/reference_databases/classifier.qza --i-reads /home/users/amr1175/FT/merged.rep-seqs.qza --o-classification /home/users/amr1175/FT/FMT-taxonomy.qza

qiime taxa barplot --i-table /home/users/amr1175/FT/feature_table.qza --i-taxonomy /home/users/amr1175/FT/FMT-taxonomy.qza --o-visualization /home/users/amr1175/FT/barplot-1.qzv

qiime taxa barplot --i-table /home/users/amr1175/FT/feature_table2.qza --i-taxonomy /home/users/amr1175/FT/FMT-taxonomy.qza --o-visualization /home/users/amr1175/FT/barplot-2.qzv

cp /tmp/gen711_project_data/FMT_3/sample-metadata.tsv /home/users/amr1175/FT

qiime taxa barplot --i-table feature_table.qza --m-metadata-file sample-metadata.tsv --i-taxonomy FMT-taxonomy.qza --o-visualization my-barplot.qzv

qiime taxa barplot --i-table feature_table2.qza --m-metadata-file sample-metadata.tsv --i-taxonomy FMT-taxonomy.qza --o-visualization my-barplot2.qzv

qiime feature-table filter-samples --i-table feature_table.qza --m-metadata-file sample-metadata.tsv --o-filtered-table new_samples_table.qza

qiime feature-table filter-samples --i-table feature_table2.qza --m-metadata-file sample-metadata.tsv --o-filtered-table new_samples_table2.qza
