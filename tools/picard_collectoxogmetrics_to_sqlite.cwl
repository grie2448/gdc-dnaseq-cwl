cwlVersion: v1.0
class: CommandLineTool
id: picard_collectoxogmetrics_to_sqlite
requirements:
  - class: DockerRequirement
    dockerPull: "{{ docker_repo }}/picard_metrics_sqlite:{{ picard_metrics_sqlite }}"
  - class: InlineJavascriptRequirement
  - class: ResourceRequirement
    coresMin: 1
    coresMax: 1
    ramMin: 1000
    ramMax: 1000
    tmpdirMin: 5
    tmpdirMax: 5
    outdirMin: 5
    outdirMax: 5

inputs:
  bam:
    type: string
    inputBinding:
      prefix: --bam

  fasta:
    type: string
    inputBinding:
      prefix: --fasta

  input_state:
    type: string
    inputBinding:
      prefix: --input_state

  metric_path:
    type: File
    inputBinding:
      prefix: --metric_path

  job_uuid:
    type: string
    inputBinding:
      prefix: --job_uuid

  vcf:
    type: string
    inputBinding:
      prefix: --vcf

outputs:
  log:
    type: File
    outputBinding:
      glob: $(inputs.job_uuid+"_picard_CollectOxoGMetrics.log")

  sqlite:
    type: File
    outputBinding:
      glob: $(inputs.job_uuid + ".db")

baseCommand: [--metric_name, CollectOxoGMetrics]
